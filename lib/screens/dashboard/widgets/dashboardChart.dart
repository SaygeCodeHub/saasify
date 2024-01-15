import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class DashboardChart extends StatelessWidget {
  const DashboardChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> weeks = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacingLarge),
        child: BarChart(BarChartData(
            alignment: BarChartAlignment.spaceBetween,
            borderData: FlBorderData(border: Border.all(width: 0)),
            maxY: 10,
            // gridData: FlGridData(drawVerticalLine: false),
            titlesData: FlTitlesData(
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                              padding: const EdgeInsets.all(spacingSmall),
                              child: Text(weeks[value.toInt()],
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTiniest
                                      .copyWith(
                                          color:
                                              AppColor.saasifyLightPaleGrey)));
                        })),
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                              padding: const EdgeInsets.all(spacingSmall),
                              child: Text(meta.formattedValue.toString(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTiniest
                                      .copyWith(
                                          color:
                                              AppColor.saasifyLightPaleGrey)));
                        }))),
            barGroups: List.generate(
                7,
                (index) => BarChartGroupData(x: index, barRods: [
                      BarChartRodData(
                          borderRadius: BorderRadius.circular(8),
                          fromY: 0,
                          toY: (Random().nextDouble() * 10).round().toDouble(),
                          width: 40,
                          color: (index % 2 == 0)
                              ? AppColor.saasifyCementGrey
                              : AppColor.saasifyLightDeepBlue)
                    ])))));
  }
}
