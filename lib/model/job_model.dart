// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class JobModel {
  final Color bgColor;
  final String position;
  final String timing;
  final String company;
  final String location;
  final List<dynamic> keywords;
  final String logo;
  final int date;
  JobModel({
    required this.bgColor,
    required this.position,
    required this.timing,
    required this.company,
    required this.location,
    required this.keywords,
    required this.logo,
    required this.date,
  });
}
