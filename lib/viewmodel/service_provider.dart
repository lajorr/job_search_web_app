import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/job_model.dart';

// https://storage.googleapis.com/programiz-static/hiring/software/job-listing-page-challenge/data.json

final List<Color> bgColors = [
  const Color.fromRGBO(77, 96, 252, 1),
  const Color.fromRGBO(33, 116, 186, 1),
  const Color.fromRGBO(18, 24, 40, 1),
  const Color.fromRGBO(46, 77, 146, 1),
  Colors.white,
  const Color.fromRGBO(4, 1, 92, 1),
];

class ServiceProvider extends ChangeNotifier {
  List<JobModel> _jobList = [];
  final List<JobModel> _filteredList = [];

  // make _filtered list listenable
  // make sorting functions thats sorts this list and notify

  List<JobModel> get filterList {
    return _filteredList;
  }

  DateTime intToDateTime(int time) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
    return date;
  }

  Future apiCall() async {
    _jobList = [];
    final url = Uri.parse(
        'https://storage.googleapis.com/programiz-static/hiring/software/job-listing-page-challenge/data.json');

    final response = await http.get(url);
    // print(response.body);
    if (response.statusCode != 200) {
      print('Error');
      return;
    }
    final data = json.decode(response.body);

    for (int i = 0; i < data.length; i++) {
      final givenDate = data[i]['posted_on'] as int;
      final givenDateDTO = intToDateTime(givenDate);

      final diff = DateTime.now().difference(givenDateDTO);

      final postedDate = diff.inDays;

      final job = JobModel(
        position: data[i]['position'] as String,
        timing: data[i]['timing'] as String,
        company: data[i]['company'] as String,
        keywords: data[i]['keywords'] as List<dynamic>,
        logo: data[i]['company_logo'] as String,
        location: data[i]['location'] as String,
        date: postedDate,
        bgColor: bgColors[i],
      );

      _jobList.add(job);
    }
    notifyListeners();
  }

  List<JobModel> filteredList(List<String> searchTags) {
    List<JobModel> newList = [];

    final searchedSet = searchTags.toSet();

    newList = _jobList.where(
      (job) {
        final jobTagSet = job.keywords.toSet();
        var intersect = jobTagSet.intersection(searchedSet).toList();

        var newInter = intersect.map((e) => e as String).toList();

        if (searchTags.isEmpty ||
            (searchTags.every(
              (tag) => newInter.contains(tag),
            ))) {
          return true;
        }
        return false;
      },
    ).toList();
    print(_isSort);

    if (_isSort) {
      newList.sort(
        (a, b) => a.date.compareTo(b.date),
      );
      print('sort');
    }

    return newList;
  }

  bool _isSort = false;

  void sortList() {
    _isSort = !_isSort;
    print('bool');
  }
}
