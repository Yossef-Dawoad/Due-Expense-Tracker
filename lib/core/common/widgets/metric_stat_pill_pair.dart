import 'package:expancetracker/core/common/widgets/icon_metric_stat_pill.dart';
import 'package:flutter/material.dart';

class MetricStatPillData {
  const MetricStatPillData({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    this.prefix = r'$',
    this.decimalPlaces = 0,
    this.startDelay = Duration.zero,
    this.digitStaggerDelay = const Duration(milliseconds: 35),
  });

  final String label;
  final double value;
  final IconData icon;
  final Color iconColor;
  final String prefix;
  final int decimalPlaces;
  final Duration startDelay;
  final Duration digitStaggerDelay;
}

class MetricStatPillPair extends StatelessWidget {
  const MetricStatPillPair({
    super.key,
    required this.leadingMetric,
    required this.trailingMetric,
    this.gap = 12,
  });

  final MetricStatPillData leadingMetric;
  final MetricStatPillData trailingMetric;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _MetricStatPill(data: leadingMetric)),
        SizedBox(width: gap),
        Expanded(child: _MetricStatPill(data: trailingMetric)),
      ],
    );
  }
}

class _MetricStatPill extends StatelessWidget {
  const _MetricStatPill({required this.data});

  final MetricStatPillData data;

  @override
  Widget build(BuildContext context) {
    return IconMetricStatPill(
      label: data.label,
      value: data.value,
      icon: data.icon,
      iconColor: data.iconColor,
      prefix: data.prefix,
      decimalPlaces: data.decimalPlaces,
      startDelay: data.startDelay,
      digitStaggerDelay: data.digitStaggerDelay,
    );
  }
}
