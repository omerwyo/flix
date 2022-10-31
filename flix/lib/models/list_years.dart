import 'dart:convert';

import 'package:flix/models/linechart_response.dart';

class YearList {
  final List<LinechartResponse> years;

  YearList({required this.years});

  factory YearList.fromRawJson(String str) =>
      YearList.fromJson(json.decode(str));

  factory YearList.fromJson(Map<String, dynamic> json) => YearList(
      years: List<LinechartResponse>.from(
          json["titles"].map((x) => LinechartResponse.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "years": List<dynamic>.from(years.map((x) => x.toJson())),
      };
}
