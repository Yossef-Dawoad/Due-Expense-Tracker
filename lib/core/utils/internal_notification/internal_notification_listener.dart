import 'package:flutter/material.dart';

import 'haptic_feedback/haptic_feedback_listener.dart';
import 'toast/toast_view.dart';

class InternalNotificationListener extends StatelessWidget {
  const InternalNotificationListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HapticFeedbackListener(child: ToastView(child: child));
  }
}
