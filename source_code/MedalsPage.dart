import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedalsPage extends StatefulWidget {
  static String route = "Medals_Page_route";

  const MedalsPage({Key? key}) : super(key: key);

  @override
  _MedalsPageState createState() => _MedalsPageState();
}

class _MedalsPageState extends State<MedalsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            "Medals Screen Is Under Development. Soon :)",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Arvo', fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
