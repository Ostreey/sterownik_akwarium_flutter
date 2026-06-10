import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/core/utilities.dart';
import 'package:sterownik_akwarium/app/domain/models/device_timers_model/device_timers_model.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_slot_model/timer_slot_model.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_page_model/timer_page_model.dart';
import 'package:sterownik_akwarium/app/pages/edit_timer_page/edit_timer_page.dart';
import 'package:sterownik_akwarium/app/pages/edit_timer_page/edit_timer_slot_model.dart';
import 'package:sterownik_akwarium/app/pages/parameters_page/mqtt_provider.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_day_picker.dart';

/// Etykiety powtarzalności (repeat = firmware repetetiveWeek).
const List<String> kRepeatLabels = [
  'Wyłączony',
  'Co tydzień',
  'Co 2 tygodnie',
  'Co 3 tygodnie',
  'Co 4 tygodnie',
];

class TimerPage extends ConsumerStatefulWidget {
  const TimerPage({super.key, this.data});

  static const pageConfig = PageConfig(
    icon: Icons.timer_rounded,
    name: 'timer',
    child: TimerPage(),
  );
  final TimerPageModel? data;

  @override
  ConsumerState<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends ConsumerState<TimerPage> {
  // Nazwa urzadzenia (app-name, np. "pompa1") = czesc endpointu po "<id>/".
  late final String _device = _deviceFromEndpoint(widget.data!.endpoint);

  static String _deviceFromEndpoint(String endpoint) {
    final i = endpoint.indexOf('/');
    return i < 0 ? endpoint : endpoint.substring(i + 1);
  }

  @override
  void initState() {
    super.initState();
    // Read-on-demand: poproś sterownik o konfigurację timerów tego urządzenia.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(activeTransportProvider).requestTimers(widget.data!.endpoint);
    });
  }

  void _openEdit(TimerSlotModel slot, bool pwm) {
    context.pushNamed(
      EditTimerPage.pageConfig.name,
      extra: EditTimerSlotModel(
        appBarTitle: widget.data!.appBarTitle,
        endpoint: widget.data!.endpoint,
        device: _device,
        pwm: pwm,
        slot: slot,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Bierzemy tylko odpowiedzi dla NASZEGO urządzenia (broker może wysłać też inne).
    final timersAsync = ref.watch(timersProvider);
    final DeviceTimersModel? deviceTimers = timersAsync.maybeWhen(
      data: (d) => d.device == _device ? d : null,
      orElse: () => null,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Timery ${widget.data!.appBarTitle}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Odśwież',
            onPressed: () =>
                ref.read(activeTransportProvider).requestTimers(widget.data!.endpoint),
          ),
        ],
      ),
      body: SafeArea(
        child: deviceTimers == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                padding: const EdgeInsets.all(15),
                itemCount: deviceTimers.timers.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final slot = deviceTimers.timers[index];
                  return _TimerSlotCard(
                    slot: slot,
                    pwm: deviceTimers.pwm,
                    colorTheme: colorTheme,
                    textTheme: textTheme,
                    onTap: () => _openEdit(slot, deviceTimers.pwm),
                  );
                },
              ),
      ),
    );
  }
}

class _TimerSlotCard extends StatelessWidget {
  const _TimerSlotCard({
    required this.slot,
    required this.pwm,
    required this.colorTheme,
    required this.textTheme,
    required this.onTap,
  });

  final TimerSlotModel slot;
  final bool pwm;
  final ColorScheme colorTheme;
  final TextTheme textTheme;
  final VoidCallback onTap;

  String _formTime(Time t) =>
      "${t.h.toString().padLeft(2, '0')}:${t.m.toString().padLeft(2, '0')}:${t.s.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    final bool enabled = slot.repeat > 0;
    final String repeatLabel = (slot.repeat >= 0 && slot.repeat < kRepeatLabels.length)
        ? kRepeatLabels[slot.repeat]
        : 'Wyłączony';

    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: enabled ? colorTheme.surface : colorTheme.surfaceVariant.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: colorTheme.outlineVariant),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Timer ${slot.i}", style: textTheme.titleMedium),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: enabled
                          ? colorTheme.primaryContainer
                          : colorTheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      repeatLabel,
                      style: textTheme.labelMedium!.copyWith(
                        color: enabled
                            ? colorTheme.onPrimaryContainer
                            : colorTheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.edit, size: 20, color: colorTheme.primary),
                ],
              ),
              if (enabled) ...[
                const SizedBox(height: 12),
                CustomDayPicker(weekdays: slot.week, isEditable: false),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Włącz", style: textTheme.labelLarge),
                          Text(_formTime(slot.on),
                              style: textTheme.titleLarge!
                                  .copyWith(color: colorTheme.primary)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Wyłącz", style: textTheme.labelLarge),
                          Text(_formTime(slot.off),
                              style: textTheme.titleLarge!
                                  .copyWith(color: colorTheme.primary)),
                        ],
                      ),
                    ),
                    if (pwm)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Prędkość", style: textTheme.labelLarge),
                            Text("${slot.speed}%",
                                style: textTheme.titleLarge!
                                    .copyWith(color: colorTheme.primary)),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text("Czas pracy: ", style: textTheme.bodyMedium),
                    Text(getTimeDifference(slot.on, slot.off),
                        style: textTheme.bodyMedium!
                            .copyWith(color: colorTheme.primary)),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
