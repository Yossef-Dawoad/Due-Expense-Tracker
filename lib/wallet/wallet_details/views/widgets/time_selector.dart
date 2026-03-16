import 'package:expancetracker/core/common/widgets/app_sliding_segmented_control.dart';
import 'package:expancetracker/wallet/wallet_details/viewmodels/stats_viewmodel.dart';
import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  final ChartPeriod selectedPeriod;
  final Function(ChartPeriod) onPeriodChanged;

  const TimeSelector({
    super.key,
    required this.selectedPeriod,
    required this.onPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppSlidingSegmentedControl<ChartPeriod>(
      height: 42,
      segments: ChartPeriod.values
          .map(
            (period) => AppSlidingSegment(
              value: period,
              label: _periodToString(period),
            ),
          )
          .toList(),
      selectedValue: selectedPeriod,
      onChanged: onPeriodChanged,
    );
  }

  String _periodToString(ChartPeriod period) {
    return switch (period) {
      ChartPeriod.threeDays => '30D',
      ChartPeriod.week => '1W',
      ChartPeriod.month => '3M',
      ChartPeriod.quarter => '1Y',
    };
  }
}
