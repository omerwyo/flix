import 'package:flix/models/agechart_response.dart';
import 'dart:convert';

class AgeList {
  final List<AgechartResponse> ages; // 1

  AgeList({required this.ages});

  factory AgeList.fromRawJson(String str) =>
      AgeList.fromJson(json.decode(str)); // 2

  factory AgeList.fromJson(Map<String, dynamic> json) => AgeList(
      ages: List<AgechartResponse>.from(
          json["ages"].map((x) => AgechartResponse.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "ages": List<dynamic>.from(ages.map((x) => x.toJson())),
      };
}
