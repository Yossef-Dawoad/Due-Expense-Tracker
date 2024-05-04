import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TransactionHistoryBarChar extends StatelessWidget {
  const TransactionHistoryBarChar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(5.0),
        height: 350,
        child: Column(
          children: [
            Text(DateTime.now().toString(), style: f14greyRegularText),
            Text('\$35000.0', style: f24BlackBold),
            const SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(
                    show: true,
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  barGroups: [
                    makeGroupDataLine(1, 10),
                    makeGroupDataLine(2, 9),
                    makeGroupDataLine(3, 4),
                    makeGroupDataLine(4, 20),
                    makeGroupDataLine(5, 12),
                    makeGroupDataLine(6, 13),
                    makeGroupDataLine(7, 18),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupDataLine(
    int x,
    double y, [
    Color color = Colors.amber,
    double width = 15,
  ]) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: width,
          color: color,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 0,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
