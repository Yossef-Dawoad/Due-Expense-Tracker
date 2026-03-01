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
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xffF1F5F9), // Slate 100
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: ChartPeriod.values.map((period) {
          final isSelected = period == selectedPeriod;
          return GestureDetector(
            onTap: () => onPeriodChanged(period),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                _periodToString(period),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
            ),
          );
        }).toList(),
      ),
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
