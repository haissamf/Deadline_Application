import 'dart:async';

import 'package:date_count_down/countdown.dart';
import 'package:deadline_application/DeadlinePage.dart';
import 'package:deadline_application/model/Deadline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:intl/intl.dart';

Color color2 = Color(0xff3b1600);
Color color1 = Color(0xfffabf9f);


class MyCard extends StatefulWidget {
  Deadline dl;

  MyCard({Key? key,
     required this.dl,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {


  @override
  Widget build(BuildContext context) {
    double progress = 0;

    progress = widget.dl.progress.toDouble();

    return InkWell(
      onTap: () async {
        var result = await Navigator.pushNamed(context, DeadlinePage.route,
            arguments: widget.dl);

        print("Iamdebuging: " + "$result");

        String str = "$result";
        String name = str.split("////")[0];

        if( name != "cancelled"){
          String rem = str.split("////")[1];
          print("Iamdebuging: " + double.parse(rem).toString());
          setState(() {
            widget.dl.progress = double.parse(rem);
          });
        }

        },
        child: Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
                color: color1,

                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: color1.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 4)),
                ]
            ),

            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20, 20, 20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                      widget.dl.name,
                      style: TextStyle(
                        fontFamily: 'Arvo', fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: color2,
                      )),


                  Row(
                    children: [
                      Text(
                          "due:   ",
                          style: TextStyle(
                            fontFamily: 'Arvo', fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: color2,
                          )),

                      Text(
                          DateFormat('EEE, MMM d, ''yyyy').format(
                              widget.dl.end_date),
                          style: TextStyle(
                            fontFamily: 'Arvo', fontSize: 25,
                            color: color2,
                          )),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Progress: ",
                          style: TextStyle(
                            fontFamily: 'Arvo', fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: color2,
                          )
                      ),

                      Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 220,
                              decoration: BoxDecoration(
                                  color: Color(0xff686868),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                            Container(
                              height: 5,
                              width: (widget.dl.progress/100) * 220 ,
                              decoration: BoxDecoration(
                                  color: Color(0xff74ffa2),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [

                                  ]
                              ),
                            ),


                          ]
                      ),
                    ],
                  ),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Column(
                          children: [
                            // Text(
                            //   "d  :   h  :  m :  s",
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     fontFamily: 'Arvo', fontSize: 25,
                            //     fontWeight: FontWeight.bold,
                            //     color: color2,
                            //   ),),

                            CountDownText(
                              due: widget.dl.end_date,
                              finishedText: "Done",
                              showLabel: true,
                              longDateName: true,
                              daysTextLong: " d : ",
                              hoursTextLong: " h : ",
                              minutesTextLong: " m :  ",
                              secondsTextLong: " s  ",
                              style: TextStyle(
                                fontFamily: 'Arvo', fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: color2,
                              ),
                            )

                          ],
                        ),


                      ]
                  )
                ],
              ),
            )
        ));
  }

  void updateStatus() {
  }

  Color getColor() {
    updateStatus();

    return Color(0xffff0000);
  }
}
