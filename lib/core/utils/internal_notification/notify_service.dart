import 'package:flutter/material.dart';

import 'haptic_feedback/haptic_feedback_listener.dart';
import 'toast/toast_event.dart';

class NotifyService {
  final ValueNotifier<ToastEvent?> toastEvent = ValueNotifier<ToastEvent?>(
    null,
  );
  final ValueNotifier<HapticFeedbackEvent?> hapticFeedbackEvent =
      ValueNotifier<HapticFeedbackEvent?>(null);

  void setToastEvent(ToastEvent? event) {
    toastEvent.value = event;
  }

  void clearToastEvent() {
    toastEvent.value = null;
  }

  void setHapticFeedbackEvent(HapticFeedbackEvent? event) {
    hapticFeedbackEvent.value = event;
  }

  void clearHapticFeedbackEvent() {
    hapticFeedbackEvent.value = null;
  }
}
