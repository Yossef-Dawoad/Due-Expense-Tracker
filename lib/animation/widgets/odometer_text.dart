// OdometerText widget — per-digit rolling counter animation.
//
// Each digit scrolls vertically from 0 → target value with a cascading
// stagger, creating the classic mechanical odometer / rolling counter effect.

import 'package:flutter/material.dart';

import '../constants.dart';
import '../mixins.dart';

/// A widget that animates monetary values with a per-digit rolling odometer
/// effect. Each digit column scrolls vertically from 0 to the target digit,
/// with a slight stagger between successive digits.
///
/// **When to use**:
/// *   Hero monetary amounts that should "roll" into place on page entry.
/// *   Dashboard statistics where a counting-up feel adds perceived quality.
///
/// **Usage**:
/// ```dart
/// OdometerText(
///   value: 2450.00,
///   prefix: '\$',
///   decimalPlaces: 2,
///   style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900),
/// )
/// ```
class OdometerText extends StatefulWidget {
  /// The numeric value to display.
  final double value;

  /// Text style applied to every character.
  final TextStyle? style;

  /// Optional prefix shown before the number (e.g. `\$`).
  final String prefix;

  /// Number of decimal places to display. Defaults to 2.
  final int decimalPlaces;

  /// Total duration for each digit's roll animation.
  final Duration duration;

  /// Delay between successive digit columns (cascading stagger).
  final Duration digitStagger;

  /// Delay before the full odometer starts animating.
  final Duration startDelay;

  /// Easing curve for the digit roll.
  final Curve curve;

  const OdometerText({
    super.key,
    required this.value,
    this.style,
    this.prefix = '',
    this.decimalPlaces = 2,
    this.duration = AnimationDurations.longer,
    this.digitStagger = const Duration(milliseconds: 60),
    this.startDelay = Duration.zero,
    this.curve = AnimationCurves.decelerate,
  });

  @override
  State<OdometerText> createState() => _OdometerTextState();
}

class _OdometerTextState extends State<OdometerText>
    with TickerProviderStateMixin, AutoDisposeAnimationControllerMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  late String _formattedValue;

  /// The digit column: characters "0123456789" used for digit slots.
  static const _digits = '0123456789';

  @override
  void initState() {
    super.initState();
    _formattedValue = _format(widget.value);
    _buildAnimations();
    // Defer animation start to after the first frame so that
    // MediaQuery.maybeOf(context) is available (context isn't ready
    // during initState).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimations();
    });
  }

  @override
  void didUpdateWidget(covariant OdometerText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      // Clean up old controllers
      for (final c in _controllers) {
        c.dispose();
      }
      _formattedValue = _format(widget.value);
      _buildAnimations();
      _startAnimations();
    }
  }

  /// Build one [AnimationController] per character in the formatted string.
  void _buildAnimations() {
    _controllers = [];
    _animations = [];

    int digitIndex = 0;
    for (int i = 0; i < _formattedValue.length; i++) {
      final char = _formattedValue[i];
      final isDigit = _digits.contains(char);

      final controller = createController(
        vsync: this,
        duration: widget.duration,
      );
      _controllers.add(controller);

      final curvedAnimation = CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: widget.curve),
      );

      if (isDigit) {
        final targetDigit = int.parse(char);
        _animations.add(
          Tween<double>(
            begin: 0.0,
            end: targetDigit.toDouble(),
          ).animate(curvedAnimation),
        );
        digitIndex++;
      } else {
        // For non-digit chars, we animate opacity from 0 → 1
        _animations.add(
          Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
        );
      }

      // Store the delay for staggered start
      controller.value = 0.0;
    }

    // Store delays for scheduling
    _delays = [];
    digitIndex = 0;
    for (int i = 0; i < _formattedValue.length; i++) {
      final char = _formattedValue[i];
      final isDigit = _digits.contains(char);
      if (isDigit) {
        _delays.add(widget.digitStagger * digitIndex);
        digitIndex++;
      } else {
        _delays.add(
          widget.digitStagger * (digitIndex > 0 ? digitIndex - 1 : 0),
        );
      }
    }
  }

  late List<Duration> _delays;

  void _startAnimations() {
    // Check for reduced motion
    final disableAnimations =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    for (int i = 0; i < _controllers.length; i++) {
      if (disableAnimations) {
        _controllers[i].value = 1.0;
      } else {
        final totalDelay = widget.startDelay + _delays[i];
        Future.delayed(totalDelay, () {
          if (mounted) {
            _controllers[i].forward();
          }
        });
      }
    }
  }

  String _format(double value) {
    final formatted = value
        .toStringAsFixed(widget.decimalPlaces)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? DefaultTextStyle.of(context).style;

    // Pre-compute digit dimensions once, accounting for textScaler.
    final textScaler = MediaQuery.textScalerOf(context);
    final textPainter = TextPainter(
      text: TextSpan(text: '0', style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
      textScaler: textScaler,
    )..layout();
    final digitWidth = textPainter.width;
    final digitHeight = textPainter.height;
    textPainter.dispose();

    return RepaintBoundary(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          // Prefix (e.g. "$") — static, no animation
          if (widget.prefix.isNotEmpty)
            _OdometerStaticCharacter(
              character: widget.prefix,
              style: style,
              controller: _controllers.isNotEmpty ? _controllers.first : null,
            ),
          // Each character of the formatted value
          for (int i = 0; i < _formattedValue.length; i++)
            _buildCharSlot(i, style, digitWidth, digitHeight),
        ],
      ),
    );
  }

  Widget _buildCharSlot(
    int index,
    TextStyle style,
    double digitWidth,
    double digitHeight,
  ) {
    final char = _formattedValue[index];
    final isDigit = _digits.contains(char);

    if (isDigit) {
      return _OdometerDigitColumn(
        animation: _animations[index],
        style: style,
        digitWidth: digitWidth,
        digitHeight: digitHeight,
      );
    } else {
      // Non-digit: fade in (comma, period)
      return AnimatedBuilder(
        animation: _animations[index],
        builder: (context, child) {
          return Opacity(
            opacity: _animations[index].value.clamp(0.0, 1.0),
            child: child,
          );
        },
        child: Text(char, style: style),
      );
    }
  }
}

/// Renders the prefix character with a fade-in tied to the first digit's controller.
class _OdometerStaticCharacter extends StatelessWidget {
  const _OdometerStaticCharacter({
    required this.character,
    required this.style,
    this.controller,
  });

  final String character;
  final TextStyle style;

  /// The first digit's controller — its progress (0→1) drives opacity.
  final AnimationController? controller;

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return Text(character, style: style);
    }
    return AnimatedBuilder(
      animation: controller!,
      builder: (context, child) {
        // Use the controller's value (0→1) for opacity, not the digit value.
        return Opacity(
          opacity: controller!.value.clamp(0.0, 1.0),
          child: child,
        );
      },
      child: Text(character, style: style),
    );
  }
}

/// A single digit column that scrolls vertically through 0–9.
///
/// The [animation] value goes from 0.0 → targetDigit, and the column
/// translates by `-value * digitHeight` to reveal the correct digit.
class _OdometerDigitColumn extends StatelessWidget {
  const _OdometerDigitColumn({
    required this.animation,
    required this.style,
    required this.digitWidth,
    required this.digitHeight,
  });

  final Animation<double> animation;
  final TextStyle style;
  final double digitWidth;
  final double digitHeight;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final offset = -animation.value * digitHeight;
          return SizedBox(
            width: digitWidth,
            height: digitHeight,
            child: ClipRect(
              child: OverflowBox(
                maxHeight: digitHeight * 10,
                alignment: Alignment.topCenter,
                child: Transform.translate(
                  offset: Offset(0, offset),
                  child: child!,
                ),
              ),
            ),
          );
        },
        // Build the digit strip once as the child parameter to avoid
        // rebuilding 10 Text widgets on every animation frame.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(10, (digit) {
            return SizedBox(
              width: digitWidth,
              height: digitHeight,
              child: Align(
                alignment: Alignment.center,
                child: Text('$digit', style: style),
              ),
            );
          }),
        ),
      ),
    );
  }
}
