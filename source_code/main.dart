import 'dart:ffi';
import 'dart:io';

import 'package:deadline_application/AddPage.dart';
import 'package:deadline_application/InshightsPage.dart';
import 'package:deadline_application/model/DeadlinesController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MedalsPage.dart';
import 'model/Deadline.dart';
import 'packages/MyCard.dart';
import 'res/routes.dart';
import 'dart:developer' as developer;

int today = 1;
int thisWeek = 0;
int thisMonth = 0;
int thisQuarter = 1;
int thisYear = 0;

Color color2 = Color(0xff3b1600);
Color color1 = Color(0xfffabf9f);

Column c = Column();

DeadlinesController dc = DeadlinesController();
List<Deadline> localList = List.empty( growable: true);


void main() {

  runApp( MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Color(0xfffabf9f),

  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    prepareDeadlineListInitially();

    localList = dc.myList;
    localList.sort((a, b) => a.end_date.compareTo(b.end_date));

    return MaterialApp(
      routes: routes,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Arova',
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: Colors.indigo,
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: Container(
        height: double.infinity,
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Stack(
          children: [
                    SingleChildScrollView(
                    physics: ScrollPhysics(),

                    child: Column(
                    children: [
                      topPart(),

                      ListView.builder(
                            itemCount: localList.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),

                          itemBuilder: (context,index) {
                              return Padding(
                              padding: const EdgeInsets.all(10.0),

                              child: MyCard(
                                  dl: Deadline(
                                  name: localList[index].name,
                                  start_date: DateTime.now(),
                                  end_date : localList[index].end_date)),
                            ); }

                      ),

                      Container( height: 80,)

                    ],
                    ),
                  ),

            Positioned(
              bottom: 0,
              child:  Column(
                children: [

                  Container(
                    height: 40,
                    width: 420,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xfffabf9f),
                            Colors.white.withOpacity(0),
                          ],
                        )
                    ),),
                ],
              )
            ),

            Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ElevatedButton(
                      child: Icon(Icons.military_tech, color: color2,size: 35,),

                      onPressed: () => Navigator.pushNamed( context, MedalsPage.route,),

                  style: ElevatedButton.styleFrom(
                        fixedSize: const Size(50, 50),

                        primary: Color(0xfffabf9f),
                      ),
                    ),

                    ElevatedButton(
                      child: Positioned(

                          child: Icon(Icons.insights, color: color2,size: 40, )),

                      onPressed: () {
                        Navigator.pushNamed( context, InsightsPage.route,);

                        },

                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(65, 65),

                        primary: Color(0xfffabf9f),



                      ),
                    ),   ElevatedButton(
                      child: Icon(Icons.add, color: color2,size: 35,),

                      onPressed: () async {
                        var result = await Navigator.pushNamed( context, AddPage.route,);
                        print("Iamdebuging: " + "$result");
                        String str = "$result";
                        print("Iamdebuging: " + "$str");

                        String name = str.split("////")[0];

                        if( name != "cancelled"){
                          String rem = str.split("////")[1];

                          print("Iamdebuging: " + "$name");
                          print("Iamdebuging: " + "$rem");

                          print("Iamdebuging: " + int.parse(rem.split(":")[0]).toString());
                          print("Iamdebuging: " + int.parse(rem.split(":")[1]).toString());
                          print("Iamdebuging: " + int.parse(rem.split(":")[2]).toString());
                          print("Iamdebuging: " + int.parse(rem.split(":")[3]).toString());
                          print("Iamdebuging: " + int.parse(rem.split(":")[4]).toString());

                          DateTime constructed_end_date = DateTime(
                              int.parse(rem.split(":")[0]),
                              int.parse(rem.split(":")[1]),
                              int.parse(rem.split(":")[2]),
                              int.parse(rem.split(":")[3]),
                              int.parse(rem.split(":")[4]));

                          Deadline deadline1 =  Deadline(
                              name: name,
                              start_date: DateTime.now(),
                              end_date: constructed_end_date);

                          print("Iamdebuging: calling function ");
                          addDeadline( deadline1);
                        }
                      },                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(50, 50),

                        primary: Color(0xfffabf9f),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCard(int index) {
    if (today > 0) {
      return Padding(
        padding: const EdgeInsets.fromLTRB( 12, 0, 12, 0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                "    today",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Arvo',
                    color: Color(0xff3b3b3b),
                    fontSize: 20
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 30),
              ),
            ],
          ),
        ),
      );
    }

    return Container();

  }


  Widget getThisWeek() {
    if (today > 0) {
      return Padding(
        padding: const EdgeInsets.fromLTRB( 12, 0, 12, 0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                "    this week",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Arvo',
                    color: Color(0xff3b3b3b),
                    fontSize: 20
                ),
              ),



              // end_date: new DateTime(2022, 5, 20, 20, 8), start_date: DateTime.now()
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 30),
                child: MyCard( dl : Deadline(
                    name: "Finish os HW",
                    start_date: DateTime.now(),
                    end_date: DateTime(2022, 5, 20, 20, 8)), ),
              ),
            ],
          ),
        ),
      );
    }

    return Container();
  }


  Widget getThisMonth() {
    return Column();
  }

  Widget getThisQuarter() {

    if (thisQuarter > 0) {
      return Padding(
        padding: const EdgeInsets.fromLTRB( 12, 0, 12, 0),

        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "    this quarter",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Arvo',
                    color: Color(0xff3b3b3b),
                    fontSize: 20
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 30),
                child: MyCard( dl: Deadline(name: "hii", start_date: DateTime.now(), end_date : DateTime(2022))),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }

  Widget getThisYear() {
    return Column();
  }

  Widget topPart() {
    return Column(

      children: [
        Container(
          child: Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(height: 60,),

                    Text("Hi, welcome back  : )",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 30, fontFamily: 'Arvo',
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xfffabf9f),

                ),),
            ],
          ),
        ),

        Container(
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
          ),),


      ],
    );
  }

  void addDeadline(Deadline dl){
    print("iamdebugging: adding " + dl.name);
    setState( () {
      localList.add( dl );
      localList.sort((a, b) => a.end_date.compareTo(b.end_date));
    });

    // c = Column(
    //     children: List.generate( dc.myList.length, (index) => Container(
    //       child: Text(dc.myList[index].name),
    //     ))
    // );
    //
    // print("Comlumn updated" + dc.myList.length.toString());

  }

  void updateListView(){

  }
}

void prepareDeadlineListInitially(){
  // dc.reset();
  // int r = dc.addDeadlineData( Deadline( name: "Finish os HW",
  //     start_date: DateTime.now(),
  //     end_date: DateTime(2022, 5, 20, 20, 8)),);
  //
  // print("preparing" + r.toString());
  //
  // r = dc.addDeadlineData(Deadline( name: "Finish os HW",
  //     start_date: DateTime.now(),
  //     end_date: DateTime(2022, 5, 20, 20, 8)),);
  //
  // print("preparing" + r.toString());
  //
  // r = dc.addDeadlineData(Deadline( name: "Earn first thousand :)",
  //     start_date: DateTime.now(),
  //     end_date: DateTime(2022, 3, 1, 23, 59)),);
  //
  // print("preparing" + r.toString());


  // c = Column(
  //     children: List.generate( dc.myList.length, (index) => Container(
  //       child: Text(dc.myList[index].name),
  //     ))
  // );
}
