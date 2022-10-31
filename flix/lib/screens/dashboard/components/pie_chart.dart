import 'package:fl_chart/fl_chart.dart';
import 'package:flix/models/piechart_response.dart';
import 'package:flutter/material.dart';

import 'package:flix/constants.dart';

class PercentChart extends StatelessWidget {
  const PercentChart({
    Key? key,
    required this.movie_percent,
    required this.show_percent,
  }) : super(key: key);

  final double movie_percent;
  final double show_percent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: getProportions(PiechartResponse(
                  movie_percent: movie_percent, show_percent: show_percent)),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: defaultPadding),
                Text(
                  "${movie_percent}%",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                const Text("Movies")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> getProportions(PiechartResponse data) => [
      PieChartSectionData(
          color: const Color(0xFFEE2727),
          value: data.movie_percent,
          title: '${data.movie_percent}%',
          titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff))),
      PieChartSectionData(
          color: const Color(0xFF4169e1),
          value: data.show_percent,
          title: '${data.show_percent}%',
          titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff))),
    ];
