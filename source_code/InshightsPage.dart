import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsightsPage extends StatefulWidget {
  static String route = "Insights_page_route";

  const InsightsPage({Key? key}) : super(key: key);

  @override
  _InsightsPageState createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            "Insights Screen Is Under Development. Soon :)",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Arvo', fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
