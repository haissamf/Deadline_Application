import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

Color color2 = Color(0xff3b1600);
Color color1 = Color(0xfffabf9f);

String name = "";
DateTime end_date = DateTime.now();

String displayDate = "dd / mm / yyyy";
String displayTime = "hour : minute";



class AddPage extends StatefulWidget {
  static String route = "addpage_route";

  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();

}

class _AddPageState extends State<AddPage> {
  @override
  void dispose() {
    displayDate = "dd / mm / yyyy";
    displayTime = "hour : minute";
    name = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  shadow(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 50,10,10),
                    child: Text( "Choose Deadline Name",
                      style: TextStyle(
                        color: color2,
                        fontFamily: 'Arvo',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
                    child: TextField(
                      cursorColor: color2,
                      decoration: InputDecoration(
                        hoverColor: color2,
                        focusColor: color2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color1, width: 3.0),
                        ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color2, width: 3.0),
                          ),

                      ),
                      style: TextStyle(
                        color: color2,
                        fontFamily: 'Arvo', fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (text){
                        name = text;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 30,10,10),
                    child: Text( "Select Deadline Date and Time",
                      style: TextStyle(
                          color: color2,
                          fontFamily: 'Arvo', fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(DateTime.now().year + 30), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            end_date = DateTime(
                                date.year,
                                date.month,
                                date.day,
                                end_date.hour,
                                end_date. minute,
                            );
                            setState(() {
                              displayDate = date.day.toString();
                              displayDate = displayDate + " / " + date.month.toString();
                              displayDate = displayDate + " / " + date.year.toString();

                            });
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
                      child: Container(
                        height: 70,
                        width: double.infinity,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text( displayDate, style: TextStyle(
                              fontFamily: 'Arvo', fontSize: 20,
                              fontWeight: FontWeight.bold,
                                color: color2.withOpacity(0.5)),
                            ),
                          ],
                        ),

                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: color1),
                          borderRadius: BorderRadius.circular(5 )
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      DatePicker.showTime12hPicker(context, showTitleActions: true,
                          onChanged: (date) {

                          }, onConfirm: (date) {
                            end_date = DateTime(
                                end_date.year,
                                end_date.month,
                                end_date.day,
                                date.hour,
                                date.minute
                            );
                            setState(() {
                              displayTime = date.hour.toString()
                                  + " : " + date.minute.toString();
                            });

                          }, currentTime: DateTime.now());
                    },

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
                      child: Container(
                        height: 70,
                        width: double.infinity,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(displayTime, style: TextStyle(
                                fontFamily: 'Arvo', fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: color2.withOpacity(0.5)),
                            ),
                          ],
                        ),

                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: color1),
                            borderRadius: BorderRadius.circular(5 )
                        ),
                      ),
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
                  padding: const EdgeInsets.fromLTRB(8, 0, 8,20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: Container(
                          width: 40,
                          height: 70,

                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_back_ios, color: color2, size: 30,),
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
                          Navigator.pop(context, "cancelled////0:0:0:0:0")},
                      ),

                      ElevatedButton(
                        child: Container(
                          width: 240,
                          height: 70,

                          alignment: Alignment.center,
                          child: Text(

                              "Create Deadline",

                              style: TextStyle(
                                  fontSize: 22,
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
                          Navigator.pop(context, "" + name + "////"
                              + end_date.year.toString() + ":"
                              + end_date.month.toString() + ":"
                              + end_date.day.toString() + ":"
                              + end_date.hour.toString() + ":"
                              + end_date.minute.toString() )
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
