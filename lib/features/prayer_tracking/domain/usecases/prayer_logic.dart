import 'package:rakaa_ai/features/prayer_tracking/domain/entities/prayer_state.dart';

class PrayerLogic {
  int _currentRak'ah = 1;
  int _totalRak'ahs = 4;
  PrayerPosition _currentPosition = PrayerPosition.standing;
  List<PrayerPosition> _history = [];

  PrayerProgress updateState(PrayerPosition detectedPosition) {
    if (detectedPosition == _currentPosition) return _getCurrentProgress();

    // State machine logic to prevent false transitions
    switch (_currentPosition) {
      case PrayerPosition.standing:
        if (detectedPosition == PrayerPosition.bowing) {
          _currentPosition = PrayerPosition.bowing;
        }
        break;
      case PrayerPosition.bowing:
        if (detectedPosition == PrayerPosition.standingAfterBowing) {
          _currentPosition = PrayerPosition.standingAfterBowing;
        }
        break;
      case PrayerPosition.standingAfterBowing:
        if (detectedPosition == PrayerPosition.firstSujood) {
          _currentPosition = PrayerPosition.firstSujood;
        }
        break;
      case PrayerPosition.firstSujood:
        if (detectedPosition == PrayerPosition.sittingBetweenSujoods) {
          _currentPosition = PrayerPosition.sittingBetweenSujoods;
        }
        break;
      case PrayerPosition.sittingBetweenSujoods:
        if (detectedPosition == PrayerPosition.secondSujood) {
          _currentPosition = PrayerPosition.secondSujood;
        }
        break;
      case PrayerPosition.secondSujood:
        if (detectedPosition == PrayerPosition.standing) {
          _currentRak'ah++;
          _currentPosition = PrayerPosition.standing;
        } else if (detectedPosition == PrayerPosition.tashahhud) {
          _currentPosition = PrayerPosition.tashahhud;
        }
        break;
      case PrayerPosition.tashahhud:
        if (detectedPosition == PrayerPosition.salam) {
          _currentPosition = PrayerPosition.salam;
        }
        break;
      default:
        break;
    }

    return _getCurrentProgress();
  }

  PrayerProgress _getCurrentProgress() {
    return PrayerProgress(
      currentRak'ah: _currentRak'ah,
      totalRak'ahs: _totalRak'ahs,
      currentPosition: _currentPosition,
      confidence: 0.98,
      duration: Duration.zero,
    );
  }

  void reset(int total) {
    _currentRak'ah = 1;
    _totalRak'ahs = total;
    _currentPosition = PrayerPosition.standing;
    _history = [];
  }
}
