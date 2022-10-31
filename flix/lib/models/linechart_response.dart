// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class LinechartResponse {
  int? title_release_year;
  String? averageRuntime;

  LinechartResponse(
      {required this.title_release_year, required this.averageRuntime});

  factory LinechartResponse.fromRawJson(String str) =>
      LinechartResponse.fromJson(json.decode(str));

  LinechartResponse.fromJson(Map<String, dynamic> json) {
    title_release_year = json['title_release_year'];
    averageRuntime = json['averageRuntime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title_release_year'] = title_release_year;
    data['averageRuntime'] = averageRuntime;
    return data;
  }
}
