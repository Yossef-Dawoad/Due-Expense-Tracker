import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

/// A horizontally scrolling selector for recent days, highlighting "Today".
class DaySelector extends StatelessWidget {
  const DaySelector({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate dates relative to today
    final now = DateTime.now();
    final today = _DayInfo(date: now, isToday: true, isDisabled: false);

    final days = [
      _DayInfo(date: now.subtract(const Duration(days: 5))),
      _DayInfo(date: now.subtract(const Duration(days: 4))),
      _DayInfo(date: now.subtract(const Duration(days: 3))),
      _DayInfo(date: now.subtract(const Duration(days: 2))),
      _DayInfo(date: now.subtract(const Duration(days: 1))),
      today,
      _DayInfo(date: now.add(const Duration(days: 1)), isDisabled: true),
    ];

    return SizedBox(
      height: 80, // Allow space for the largest "Today" pill
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          child: StaggeredListAnimation(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            itemDuration: AnimationDurations.medium,
            staggerDuration: const Duration(
              milliseconds: 50,
            ), // Adjusted for horizontal list
            delay: const Duration(milliseconds: 100),
            children: days.map((day) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: _DayPill(dayInfo: day),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _DayInfo {
  const _DayInfo({
    required this.date,
    this.isToday = false,
    this.isDisabled = false,
  });

  final DateTime date;
  final bool isToday;
  final bool isDisabled;

  String get shortDayName {
    switch (date.weekday) {
      case DateTime.monday:
        return 'MON';
      case DateTime.tuesday:
        return 'TUE';
      case DateTime.wednesday:
        return 'WED';
      case DateTime.thursday:
        return 'THU';
      case DateTime.friday:
        return 'FRI';
      case DateTime.saturday:
        return 'SAT';
      case DateTime.sunday:
        return 'SUN';
      default:
        return '';
    }
  }

  String get dayNumber => '${date.day}';
}

class _DayPill extends StatelessWidget {
  const _DayPill({required this.dayInfo});

  final _DayInfo dayInfo;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    final isToday = dayInfo.isToday;
    final isDisabled = dayInfo.isDisabled;

    // Dimensions
    final minWidth = isToday ? 56.0 : 48.0;
    final height = isToday ? 80.0 : 64.0;

    // Colors
    final bgColor = isToday
        ? colors
              .brandPrimaryLight // bg-primary/10
        : colors.bgSurface;
    final borderColor = isToday
        ? colors
              .brandPrimary // border-primary/30
        : colors.borderDefault;
    //.withValues(alpha: 0.5);
    final topTextColor = isToday ? colors.brandPrimary : colors.textTertiary;
    final bottomTextColor = colors.textPrimary;

    // Opacity
    final double targetOpacity = isDisabled ? 0.5 : 1.0;

    final pillContent = AnimatedContainer(
      duration: AnimationDurations.medium,
      curve: Curves.easeOutCubic,
      width: minWidth,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(32), // fully rounded pill
        border: Border.all(color: borderColor, width: isToday ? 2.0 : 1.0),
        boxShadow: isToday
            ? [
                BoxShadow(
                  color: colors.brandPrimary.withValues(alpha: 0.05),
                  blurRadius: 4,
                  spreadRadius: 4, // ring-4 ring-primary/5 approx
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 2, // shadow-sm approx
                  offset: const Offset(0, 1),
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            duration: AnimationDurations.medium,
            curve: Curves.easeOutCubic,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isToday
                  ? FontWeight.w900
                  : FontWeight
                        .w700, // HTML uses font-black for active, font-bold for inactive
              color: topTextColor,
              letterSpacing: 0,
              fontFamily: 'Inter',
            ),
            child: Text(isToday ? 'TODAY' : dayInfo.shortDayName),
          ),
          const SizedBox(height: 2),
          AnimatedDefaultTextStyle(
            duration: AnimationDurations.medium,
            curve: Curves.easeOutCubic,
            style: TextStyle(
              fontSize: isToday ? 18 : 15, // HTML: text-[18px] vs text-[15px]
              fontWeight: FontWeight.w900, // HTML uses font-black for both
              color: bottomTextColor,
              height: 1.1,
              fontFamily: 'Inter',
            ),
            child: Text(dayInfo.dayNumber),
          ),
        ],
      ),
    );

    return AnimatedOpacity(
      opacity: targetOpacity,
      duration: AnimationDurations.medium,
      curve: Curves.easeOutCubic,
      child: isDisabled
          ? pillContent
          : ScaleFeedback(
              onTap: () {
                // TODO: Implement day selection logic/callback when wired up
              },
              child: pillContent,
            ),
    );
  }
}
