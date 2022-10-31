// ignore_for_file: library_private_types_in_public_api

import 'package:flix/models/agechart_response.dart';
import 'package:flix/models/linechart_response.dart';
import 'package:flix/models/list_ages.dart';
import 'package:flix/models/list_years.dart';
import 'package:flix/models/piechart_response.dart';
import 'package:flix/models/result.dart';
import 'package:flix/network/remote_data_source.dart';
import 'package:flix/screens/dashboard/components/age_chart.dart';
import 'package:flix/screens/dashboard/components/line_chart.dart';
import 'package:flix/screens/dashboard/components/pie_chart.dart';
import 'package:flix/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  RemoteDataSource _apiResponse = RemoteDataSource();
  int _releaseStartYear = 1980;
  int _releaseEndYear = 2000;
  String _genre = "crime";
  int _releaseYear = 2016;

  final myController_Start = TextEditingController();
  final myController_End = TextEditingController();
  final myController_Genre = TextEditingController();

  void _setReleaseYears(start_year, end_year) {
    setState(() {
      _releaseStartYear = int.parse(start_year);
      _releaseEndYear = int.parse(end_year);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(children: [
          Header(),
          SizedBox(
            height: defaultPadding + 25,
          ),
          Text(
            "Average Runtime for each release year between $_releaseStartYear and $_releaseEndYear",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: defaultPadding + 10,
          ),
          FutureBuilder(
            future:
                _apiResponse.getLineChart(_releaseStartYear, _releaseEndYear),
            builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
              if (snapshot.data is SuccessState) {
                YearList linechartdata = (snapshot.data as SuccessState).value;
                return YearLineChart(
                  years: linechartdata.years,
                );
              } else if (snapshot.data is ErrorState) {
                String errorMessage = (snapshot.data as ErrorState).msg;
                return Text(errorMessage);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: myController_Start,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () => _setReleaseYears(
                    myController_Start.text, myController_End.text),
                child: Text('Submit Start Year'),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: myController_End,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () => _setReleaseYears(
                    myController_Start.text, myController_End.text),
                child: Text('Submit End Year'),
              )
            ],
          ),
          SizedBox(
            height: defaultPadding + 25,
          ),
          Text(
            "Pie Chart of proportion of movies by release year: 2016",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: defaultPadding + 10,
          ),
          FutureBuilder(
            future: _apiResponse.getPieChart(_releaseYear),
            builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
              if (snapshot.data is SuccessState) {
                PiechartResponse piechartdata =
                    (snapshot.data as SuccessState).value;
                return PercentChart(
                  movie_percent: piechartdata.movie_percent!,
                  show_percent: piechartdata.show_percent!,
                );
              } else if (snapshot.data is ErrorState) {
                String errorMessage = (snapshot.data as ErrorState).msg;
                return Text(errorMessage);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          SizedBox(
            height: defaultPadding + 25,
          ),
          Text(
            "Occurrences of Age Certification by movie genre: $_genre",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: defaultPadding + 10,
          ),
          FutureBuilder(
            future: _apiResponse.getAgeChart(_genre),
            builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
              if (snapshot.data is SuccessState) {
                AgeList agechartdata = (snapshot.data as SuccessState).value;
                return AgeChart(
                  ages: agechartdata.ages,
                );
              } else if (snapshot.data is ErrorState) {
                String errorMessage = (snapshot.data as ErrorState).msg;
                return Text(errorMessage);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ]),
      ),
    );
  }
}
