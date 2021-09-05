import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tracker/common/style.dart';
import 'package:tracker/presentation/pages/base_page.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int _selectedMonth = 0;
  List<String> _monthName = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  List<Color> _gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData _chartData() => LineChartData(
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
                1 + new Random().nextInt(5).toDouble(),
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
    return SafeArea(
      child: BasePage(
        body: ListView(
          children: [
            Text(
              "Stats",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  1,
                  (index) => ChoiceChip(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    label: Text("2021"),
                    selected: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  12,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      label: Text("${_monthName[index]}"),
                      selected: _selectedMonth == index,
                      onSelected: (val) {
                        setState(() {
                          _selectedMonth = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            Container(
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
                    "Net Balance",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                  Text(
                    "Balance",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: whiteColor,
                        ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    height: 220,
                    child: LineChart(_chartData()),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.remove_circle,
                          ),
                          Text(
                            "Spend",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      Text(
                        "Balance",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: darkSecondaryColor,
                            ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.add_circle,
                          ),
                          Text(
                            "Income",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      Text(
                        "Balance",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: darkSecondaryColor,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
