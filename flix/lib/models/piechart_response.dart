// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PiechartResponse {
  double? movie_percent;
  double? show_percent;

  PiechartResponse({required this.movie_percent, required this.show_percent});

  factory PiechartResponse.fromRawJson(String str) =>
      PiechartResponse.fromJson(json.decode(str));

  PiechartResponse.fromJson(Map<String, dynamic> json) {
    movie_percent = json['movie_percent'];
    show_percent = json['show_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['movie_percent'] = movie_percent;
    data['show_percent'] = show_percent;
    return data;
  }
}
