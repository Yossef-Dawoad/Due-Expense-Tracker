import 'package:expancetracker/wallet/wallet_details/viewmodels/stats_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:expancetracker/wallet/wallet_details/views/widgets/time_selector.dart';

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
        TimeSelector(
          selectedPeriod: selectedPeriod,
          onPeriodChanged: onPeriodChanged,
        ),
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

  LineChartData mainData(BuildContext context) {
    final theme = Theme.of(context);
    List<Color> gradientColors = [
      theme.colorScheme.secondary.withValues(alpha: 0.3),
      theme.colorScheme.secondary.withValues(alpha: 0.0),
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
