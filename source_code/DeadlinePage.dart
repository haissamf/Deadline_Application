import 'package:deadline_application/model/Deadline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

Color color2 = Color(0xff3b1600);
Color color1 = Color(0xfffabf9f);

Deadline deadline = Deadline(name: "name", start_date: DateTime.now(), end_date:  DateTime.now());

String name = "";
DateTime end_date = DateTime.now();

String displayDate = "dd / mm / yyyy";
String displayTime = "hour : minute";



class DeadlinePage extends StatefulWidget {

  static String route = "deadlinepage_route";

  const DeadlinePage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();

}



class _AddPageState extends State<DeadlinePage> {
  double _value = 0;

  @override
  void initState() {

    super.initState();
  }
  @override
  void dispose() {
    _value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recievedDeadline = ModalRoute.of(context)!.settings.arguments as Deadline;
    deadline = recievedDeadline;

    if( _value < deadline.progress)
      while(  _value < deadline.progress)
        _value++;

    return Scaffold(
      body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,

          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    shadow(),
                    Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,

                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              child: Container(
                                width: 30,
                                height: 60,

                                alignment: Alignment.center,
                                child: Icon(Icons.delete, color: color2, size: 30,),
                              ),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                  )
                              ),

                              onPressed: () => {
                                Navigator.pop(context, "" + name + "////"
                                    + end_date.year.toString() + ":"
                                    + end_date.month.toString() + ":"
                                    + end_date.day.toString() + ":"
                                    + end_date.hour.toString() + ":"
                                    + end_date.minute.toString() )
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(25.0, 10,0,0),
                      child: Text( deadline.name,
                        style: TextStyle(
                          color: color2,
                          fontFamily: 'Arvo',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30,0,0),
                      child: Text( "Due Date: \n"+  DateFormat('EEE, MMM d yyyy, kk:mm').format(
                          deadline.end_date) ,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: color2,
                          fontFamily: 'Arvo',
                          fontSize: 30,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 100,0,10),
                      child: Text( "How much did you progress?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: color2,
                          fontFamily: 'Arvo',
                          fontSize: 20,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 15,8,8),
                      child: Slider(
                        activeColor: Colors.black.withOpacity(0.5),
                        inactiveColor: Colors.white,
                        divisions: 10,
                        min: deadline.progress,
                        max: 100,
                        value: _value ,
                        label: _value.round().toString() + "%",
                        onChanged: (dynamic value){
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    ),

                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              child: Container(
                                width: 40,
                                height: 70,

                                alignment: Alignment.center,
                                child: Icon(Icons.arrow_back_ios, color: color2, size: 35,),
                              ),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(color1),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                  )
                              ),

                              onPressed: () => {
                                Navigator.pop(context,"cancelled////nothing")
                              },
                            ),

                            ElevatedButton(
                              child: Container(
                                width: 240,
                                height: 70,

                                alignment: Alignment.center,
                                child: Text(

                                    "Confirm Log",

                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'Arvo',
                                        fontWeight: FontWeight.bold,
                                        color: color2)
                                ),
                              ),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor: MaterialStateProperty.all<Color>(color1),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )
                                  )
                              ),

                              onPressed: () => {
                                Navigator.pop(context, "progress////$_value")
                              },
                            ),
                          ],

                    ),
                  ),
                ),
              ),

            ],
          )
      ),
    );

  }

  Container shadow(){
    return  Container(
      height: 60,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,
            colors: [
              Color(0xfffabf9f),
              Colors.white,
            ],
          )
      ),);
  }
}
