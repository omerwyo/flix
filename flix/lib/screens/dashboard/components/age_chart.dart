import 'package:fl_chart/fl_chart.dart';
import 'package:flix/models/agechart_response.dart';
import 'package:flix/models/linechart_response.dart';
import 'package:flutter/material.dart';
import 'package:flix/constants.dart';

class AgeChart extends StatelessWidget {
  final List<Color> gradientColors = const [
    Color(0xff23b6e6),
    Color(0xff02d39a),
  ];

  const AgeChart({
    Key? key,
    required this.ages,
  }) : super(key: key);

  final List<AgechartResponse> ages;

  static getAgeData(ages) => FlTitlesData(
      bottomTitles: SideTitles(
        reservedSize: 22,
        showTitles: true,
        getTitles: ((value) {
          switch (value.toInt()) {
            case 0:
              return "G";
            case 1:
              return "NC-17";
            case 2:
              return "PG";
            case 3:
              return "PG-13";
            case 4:
              return "R";
            case 5:
              return "TV-14";
            case 6:
              return "TV-G";
            case 7:
              return "TV-MA";
            case 8:
              return "TV-PG";
            case 9:
              return "TV-Y";
            case 10:
              return "TV-Y7";
          }
          return '';
        }),
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTitles: (value) {
          return value.toString();
        },
      ));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(children: [
        LineChart(
          LineChartData(
            titlesData: getAgeData(ages),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
                show: true,
                border: Border.all(color: const Color(0xff37434d), width: 1)),
            lineBarsData: [
              LineChartBarData(
                  spots: ages
                      .map((age) => FlSpot(
                            CertNumMapping[age.title_age_certification!]!
                                .toDouble(),
                            double.parse(age.occurrences!),
                          ))
                      .toList(),
                  isCurved: true,
                  colors: gradientColors,
                  barWidth: 4,
                  belowBarData: BarAreaData(
                      show: true,
                      colors: gradientColors
                          .map((color) => color.withOpacity(0.3))
                          .toList()))
            ],
          ),
        ),
      ]),
    );
  }
}

// LineChartBarData getYearAvgData(List<LinechartResponse> data) => 

