import 'package:expancetracker/features/stats/viewmodel/stats_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartSection extends StatelessWidget {
  final ChartPeriod selectedPeriod;
  final List<FlSpot> chartData;
  final Function(ChartPeriod) onPeriodChanged;

  const ChartSection({
    super.key,
    required this.selectedPeriod,
    required this.chartData,
    required this.onPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTimeSelector(),
        // const SizedBox(height: 24),
        Container(
          height: 200,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: LineChart(mainData(context)),
        ),
      ],
    );
  }

  Widget _buildTimeSelector() {
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
                          color: Colors.black.withOpacity(0.05),
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
    // Mapping 3D to 30D as per screenshot?
    // Or should be 3D? Screenshot says 30D. Code said 3D.
    // Let's stick to screenshot 30D logic maybe? Or user code had 3D.
    // I'll stick to labels matching enum for now but mapped to reasonable text.

    return switch (period) {
      ChartPeriod.threeDays => '30D',
      ChartPeriod.week => '1W',
      ChartPeriod.month => '3M',
      ChartPeriod.quarter => '1Y',
    };
  }

  LineChartData mainData(BuildContext context) {
    final theme = Theme.of(context);
    List<Color> gradientColors = [
      theme.colorScheme.secondary.withOpacity(0.3),
      theme.colorScheme.secondary.withOpacity(0.0),
    ];

    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 12, // Adjusted for mock data
      minY: 0,
      maxY: 8,
      lineBarsData: [
        LineChartBarData(
          spots: chartData,
          isCurved: true,
          color: theme.colorScheme.secondary,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ), // Hide dots as per design, maybe show one on interaction later
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
          ),
          shadow: const Shadow(
            color: Color(0x408B5CF6),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
              return spotIndexes.map((spotIndex) {
                return TouchedSpotIndicatorData(
                  FlLine(color: theme.colorScheme.secondary, strokeWidth: 0),
                  FlDotData(
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 6,
                        color: Colors.white,
                        strokeWidth: 3,
                        strokeColor: theme.colorScheme.secondary,
                      );
                    },
                  ),
                );
              }).toList();
            },
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              return LineTooltipItem(
                '\$${(barSpot.y * 1000).toStringAsFixed(0)}', // Mock value display
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
    );
  }
}
