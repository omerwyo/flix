import 'dart:async';

import 'package:flix/models/agechart_response.dart';
import 'package:flix/models/linechart_response.dart';
import 'package:flix/models/list_ages.dart';
import 'package:flix/models/list_years.dart';
import 'package:flix/models/piechart_response.dart';
import 'package:flix/network/client.dart';
import 'package:http/http.dart';

// import '../models/network_response.dart';
import '../models/result.dart';
import '../util/request_type.dart';

class RemoteDataSource {
  //Creating Singleton
  RemoteDataSource._privateConstructor();
  static final RemoteDataSource _apiResponse =
      RemoteDataSource._privateConstructor();
  factory RemoteDataSource() => _apiResponse;

  FlixClient client = FlixClient(Client());

  Future<Result> getLineChart(int startYear, int endYear) async {
    try {
      final queryParameters = {
        'start_year': startYear.toString(),
        'end_year': endYear.toString(),
      };
      final response = await client.request(
          requestType: RequestType.GET,
          path: "api/titles/line_chart",
          parameters: queryParameters);
      if (response.statusCode == 200) {
        return Result<YearList>.success(YearList.fromRawJson(response.body));
      } else {
        return Result.error("Line Chart not Available");
      }
    } catch (error) {
      return Result.error("Something went wrong!: $error");
    }
  }

  Future<Result> getPieChart(int releaseYear) async {
    try {
      final queryParameters = {'release_year': releaseYear.toString()};
      final response = await client.request(
          requestType: RequestType.GET,
          path: "api/titles/proportion",
          parameters: queryParameters);
      if (response.statusCode == 200) {
        return Result<PiechartResponse>.success(
            PiechartResponse.fromRawJson(response.body));
      } else {
        return Result.error("Pie Chart not Available");
      }
    } catch (error) {
      return Result.error("Something went wrong!: $error");
    }
  }

  Future<Result> getAgeChart(String genre) async {
    try {
      final queryParameters = {'genre': genre.toString()};
      final response = await client.request(
          requestType: RequestType.GET,
          path: "api/titles/age",
          parameters: queryParameters);
      if (response.statusCode == 200) {
        return Result<AgeList>.success(AgeList.fromRawJson(response.body));
      } else {
        return Result.error("Age Chart not Available");
      }
    } catch (error) {
      return Result.error("Something went wrong!: $error");
    }
  }
}
