import 'package:fl_chart/fl_chart.dart';
import 'package:flix/models/linechart_response.dart';
import 'package:flutter/material.dart';
import 'package:flix/constants.dart';

class YearLineChart extends StatelessWidget {
  final List<Color> gradientColors = const [
    Color(0xff23b6e6),
    Color(0xff02d39a),
  ];

  const YearLineChart({
    Key? key,
    required this.years,
  }) : super(key: key);

  final List<LinechartResponse> years;

  static getTitleData(years) => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          reservedSize: 22,
          showTitles: true,
          getTitles: ((value) {
            return value.toString();
          }),
          margin: 8,
        ),
        // leftTitles: SideTitles(
        //   showTitles: true,
        //   getTitles: (value) {
        //     return value.toString();
        //   },
        // )
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(children: [
        LineChart(
          LineChartData(
            // minY: 86,
            // maxY: 119,
            // minX: 1980,
            // maxX: 1983,
            titlesData: getTitleData(years),
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
                  spots: years
                      .map((year) => FlSpot(
                            year.title_release_year!.toDouble(),
                            double.parse(year.averageRuntime!),
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

