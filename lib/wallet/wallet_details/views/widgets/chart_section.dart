import 'package:expancetracker/core/common/widgets/app_section_header.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/wallet/wallet_details/viewmodels/stats_viewmodel.dart';
import 'package:expancetracker/wallet/wallet_details/views/widgets/time_selector.dart';
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
    final spacing = context.spacing;
    final colors = context.kitColors;

    return AppSurfaceCard(
      padding: EdgeInsets.all(spacing.cardPadding),
      borderRadius: context.borderRadius.xxl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSectionHeader(
            title: 'Balance trend',
            subtitle:
                'Track how your wallet moves across each selected window.',
            trailing: SizedBox(
              width: 190,
              child: TimeSelector(
                selectedPeriod: selectedPeriod,
                onPeriodChanged: onPeriodChanged,
              ),
            ),
          ),
          SizedBox(height: spacing.s5),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: LineChart(mainData(context)),
          ),
          SizedBox(height: spacing.s2),
          Text(
            'Interactive points reveal the estimated balance snapshot for each period.',
            style: context.textStyles.caption.copyWith(
              color: colors.textTertiary,
            ),
          ),
        ],
      ),
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
