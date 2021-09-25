import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';

class BalanceInfo extends StatelessWidget {
  const BalanceInfo({Key? key}) : super(key: key);

  static const List<Color> _gradientColors = [
    Color(0xff23b6e6),
    Color(0xff02d39a),
  ];

  LineChartData _chartData(BuildContext context) => LineChartData(
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) =>
                Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: whiteColor,
                    ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 0:
                  return 'Sun';
                case 5:
                  return 'Mon';
                case 10:
                  return 'Tue';
                case 15:
                  return 'Wed';
                case 20:
                  return 'Thu';
                case 25:
                  return 'Fri';
                case 30:
                  return 'Sat';
              }
              return '';
            },
            margin: 8,
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '10k';
                case 3:
                  return '30k';
                case 5:
                  return '50k';
              }
              return '';
            },
            reservedSize: 28,
            margin: 8,
          ),
        ),
        borderData: FlBorderData(
          show: false,
          border: Border.all(color: whiteColor, width: 1),
        ),
        minX: 0,
        maxX: 30,
        minY: 0,
        maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              30,
              (index) => FlSpot(
                index.toDouble(),
                1 + Random().nextInt(5).toDouble(),
              ),
            ),
            isCurved: true,
            colors: _gradientColors,
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              colors: _gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: secondaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Net Balance',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: whiteColor,
                ),
          ),
          Text(
            'Balance',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: whiteColor,
                ),
          ),
          const SizedBox(height: 18),
          Container(
            height: 220,
            child: LineChart(_chartData(context)),
          ),
        ],
      ),
    );
  }
}
