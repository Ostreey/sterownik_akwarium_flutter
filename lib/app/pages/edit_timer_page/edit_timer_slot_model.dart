import 'package:sterownik_akwarium/app/domain/models/timer_slot_model/timer_slot_model.dart';

/// Argument nawigacji do edycji pojedynczego slotu timera (Faza 4).
///
/// [endpoint] = `"<id>/<device>"` (np. `"001/pompa1"`); [device] = sama nazwa
/// urządzenia (`pompa1`). [pwm] decyduje, czy pokazać suwak prędkości. [slot] to
/// bieżąca konfiguracja slotu (z `get_timers`) do edycji.
class EditTimerSlotModel {
  final String appBarTitle;
  final String endpoint;
  final String device;
  final bool pwm;
  final TimerSlotModel slot;

  const EditTimerSlotModel({
    required this.appBarTitle,
    required this.endpoint,
    required this.device,
    required this.pwm,
    required this.slot,
  });
}
