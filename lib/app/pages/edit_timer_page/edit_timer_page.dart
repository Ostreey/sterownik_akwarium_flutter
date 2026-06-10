import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sterownik_akwarium/app/core/page_config.dart';
import 'package:sterownik_akwarium/app/core/utilities.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_device_model/timer_device_model.dart';
import 'package:sterownik_akwarium/app/domain/models/timer_slot_model/timer_slot_model.dart';
import 'package:sterownik_akwarium/app/pages/edit_timer_page/edit_timer_provider.dart';
import 'package:sterownik_akwarium/app/pages/edit_timer_page/edit_timer_slot_model.dart';
import 'package:sterownik_akwarium/app/pages/timer_page/timer_page.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_button.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_day_picker.dart';
import 'package:sterownik_akwarium/app/pages/widgets/custom_time_picker.dart';

class EditTimerPage extends ConsumerStatefulWidget {
  const EditTimerPage({super.key, this.data});

  static const pageConfig = PageConfig(
    icon: Icons.timer_rounded,
    name: 'edit_timer',
    child: EditTimerPage(),
  );
  final EditTimerSlotModel? data;

  @override
  ConsumerState<EditTimerPage> createState() => _EditTimerPageState();
}

class _EditTimerPageState extends ConsumerState<EditTimerPage> {
  late TimerSlotModel _slot;

  @override
  void initState() {
    super.initState();
    _slot = widget.data!.slot;
  }

  void _save() {
    ref.read(editTimerProvider.notifier).saveSlot(
          endpoint: widget.data!.endpoint,
          device: widget.data!.device,
          slot: _slot,
        );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bool pwm = widget.data!.pwm;
    final bool enabled = _slot.repeat > 0;

    return Scaffold(
      appBar: AppBar(
          title: Text("Timer ${_slot.i} — ${widget.data!.appBarTitle}")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: colorTheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(width: 1, color: colorTheme.outlineVariant),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Powtarzalnosc (repeat = repetetiveWeek; 0 = wylaczony slot).
                        Text("Powtarzalność", style: textTheme.titleMedium),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<int>(
                          value: _slot.repeat,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                          ),
                          items: [
                            for (int r = 0; r < kRepeatLabels.length; r++)
                              DropdownMenuItem(
                                  value: r, child: Text(kRepeatLabels[r])),
                          ],
                          onChanged: (v) {
                            if (v != null) {
                              setState(() => _slot = _slot.copyWith(repeat: v));
                            }
                          },
                        ),
                        if (enabled) ...[
                          const SizedBox(height: 16),
                          CustomDayPicker(
                            weekdays: _slot.week,
                            isEditable: true,
                            onDaysChanged: (days) => setState(() => _slot =
                                _slot.copyWith(
                                    week: convertSelectedDaysToInt(days))),
                          ),
                          const SizedBox(height: 12),
                          Text("Włącz", style: textTheme.titleLarge),
                          CustomTimerPicker(
                            timerData: _slot.on,
                            timeChanged: (t) =>
                                setState(() => _slot = _slot.copyWith(on: t)),
                          ),
                          const SizedBox(height: 12),
                          Text("Wyłącz", style: textTheme.titleLarge),
                          CustomTimerPicker(
                            timerData: _slot.off,
                            timeChanged: (t) =>
                                setState(() => _slot = _slot.copyWith(off: t)),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text("Czas pracy", style: textTheme.titleMedium),
                              const SizedBox(width: 16),
                              Text(getTimeDifference(_slot.on, _slot.off),
                                  style: textTheme.titleMedium!
                                      .copyWith(color: colorTheme.primary)),
                            ],
                          ),
                          // Predkosc PWM - tylko dla pomp/cyrkulacji.
                          if (pwm) ...[
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Text("Prędkość", style: textTheme.titleMedium),
                                const SizedBox(width: 12),
                                Text("${_slot.speed}%",
                                    style: textTheme.titleMedium!
                                        .copyWith(color: colorTheme.primary)),
                              ],
                            ),
                            Slider(
                              value: _slot.speed.toDouble().clamp(0, 100),
                              min: 0,
                              max: 100,
                              divisions: 100,
                              label: "${_slot.speed}%",
                              onChanged: (v) => setState(() =>
                                  _slot = _slot.copyWith(speed: v.round())),
                            ),
                          ],
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(text: "Zapisz", onPressed: _save),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
