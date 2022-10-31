// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class AgechartResponse {
  String? title_age_certification;
  String? occurrences;

  AgechartResponse(
      {required this.title_age_certification, required this.occurrences});

  factory AgechartResponse.fromRawJson(String str) =>
      AgechartResponse.fromJson(json.decode(str));

  AgechartResponse.fromJson(Map<String, dynamic> json) {
    title_age_certification = json['title_age_certification'];
    occurrences = json['occurrences'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title_age_certification'] = title_age_certification;
    data['occurrences'] = occurrences;
    return data;
  }

  @override
  String toString() {
    return "(title_age_certification: $title_age_certification, occurrences: $occurrences)";
  }
}
