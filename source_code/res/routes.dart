import 'package:deadline_application/AddPage.dart';
import 'package:deadline_application/DeadlinePage.dart';
import 'package:deadline_application/InshightsPage.dart';
import 'package:deadline_application/MedalsPage.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  AddPage.route: (context) => AddPage(),
  DeadlinePage.route: (context) => DeadlinePage(),
  MedalsPage.route: (context) => MedalsPage(),
  InsightsPage.route: (context) => InsightsPage(),

};