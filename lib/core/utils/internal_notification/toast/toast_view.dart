import 'package:flutter/material.dart';

import '../../../ui/app_theme.dart';
import '../../locator.dart';
import '../notify_service.dart';
import 'toast_event.dart';
import 'toast_view_model.dart';

class ToastView extends StatefulWidget {
  final Widget child;

  const ToastView({super.key, required this.child});

  @override
  State<ToastView> createState() => _ToastViewState();
}

class _ToastViewState extends State<ToastView> {
  late final ToastViewModel _viewModel = ToastViewModel(
    notifyService: locator<NotifyService>(),
  );

  double _dragOffset = 0;

  @override
  void initState() {
    super.initState();
    _viewModel.toastEvent.addListener(_onToastEventChanged);
  }

  @override
  void dispose() {
    _viewModel.toastEvent.removeListener(_onToastEventChanged);
    super.dispose();
  }

  void _onToastEventChanged() {
    final toastEvent = _viewModel.toastEvent.value;
    if (toastEvent != null) {
      Future.delayed(toastEvent.duration, () {
        if (mounted && _viewModel.toastEvent.value == toastEvent) {
          _viewModel.clearToastEvent();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        ValueListenableBuilder<ToastEvent?>(
          valueListenable: _viewModel.toastEvent,
          builder: (context, toastEvent, _) {
            return AnimatedSwitcher(
              duration: context.durations.duration200,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position:
                        Tween<Offset>(
                          begin: const Offset(0, -0.3),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOut,
                            reverseCurve: Curves.easeIn,
                          ),
                        ),
                    child: child,
                  ),
                );
              },
              child: toastEvent == null
                  ? const SizedBox.shrink()
                  : _Toast(
                      key: ValueKey(toastEvent),
                      toastEvent: toastEvent,
                      onDismiss: () {
                        _viewModel.clearToastEvent();
                      },
                      onVerticalDragStart: (_) => _dragOffset = 0,
                      onVerticalDragUpdate: (details) {
                        _dragOffset += details.primaryDelta!;
                        if (_dragOffset < -20) {
                          _viewModel.clearToastEvent();
                        }
                      },
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _Toast extends StatelessWidget {
  final ToastEvent toastEvent;
  final VoidCallback onDismiss;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;

  const _Toast({
    super.key,
    required this.toastEvent,
    required this.onDismiss,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
  });

  @override
  Widget build(BuildContext context) {
    // Current design uses single theme (light mode optimized), but we can still check brightness
    // However, kit colors now uses semantic naming and handles dark/light inherently if configured
    final radius = context.borderRadius.card;

    final iconData = switch (toastEvent) {
      ToastEventSuccess() => Icons.check_circle_rounded,
      ToastEventError() => Icons.error_rounded,
      ToastEventWarning() => Icons.warning_rounded,
      ToastEventInfo() => null,
    };

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.breakpoints.sm),
          child: GestureDetector(
            onVerticalDragStart: onVerticalDragStart,
            onVerticalDragUpdate: onVerticalDragUpdate,
            child: Container(
              margin: EdgeInsets.all(context.spacing.s4),
              decoration: BoxDecoration(
                color: context.kitColors.bgSurfaceSecondary,
                border: Border.all(
                  color: context.kitColors.borderDefault,
                  width: 1,
                ),
                borderRadius: radius,
                boxShadow: context.shadows.elevation2,
              ),
              child: Material(
                borderRadius: radius,
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.spacing.s4,
                    vertical: context.spacing.s4,
                  ),
                  child: Row(
                    children: [
                      if (iconData != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              iconData,
                              color: context.kitColors.textPrimary,
                            ),
                            SizedBox(width: context.spacing.iconTextGap),
                          ],
                        ),
                      Expanded(
                        child: Text(
                          toastEvent.message,
                          style: context.textStyles.bodyMD.copyWith(
                            color: context.kitColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
