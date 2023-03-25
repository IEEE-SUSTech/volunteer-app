import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ieee_app/popups.dart';
import 'package:confetti/confetti.dart';

void main() {
  runApp(
    myApp(),
  );
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// the app starts here
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    CustomDialogWidget customDialogWidget = CustomDialogWidget();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(238, 0, 98, 155),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(3),
              child: Image(
                height: 50.0,
                width: 50.0,
                image: AssetImage('image/ieee.png'),
              ),
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                customDialogWidget.criteriaCard(context);
              },
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    CircularPercentIndicator(
                      radius: 100.0,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.25,
                      center: new Text(
                        "25.0%",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      footer: new Text(
                        " Completion of certificate criterai ",
                        maxLines: null,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.black,
                    ),
                    //SizedBox(height: 25),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 20, 20, 5),
                          child: Icon(
                            Icons.circle,
                            size: 30,
                          ),
                        ),
                        Text("Suggested next  ")
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 5, 20, 10),
                          child: Icon(
                            Icons.circle,
                            size: 30,
                          ),
                        ),
                        Text("Suggested next #2 ")
                      ],
                    ),
                  ],
                ),
                width: 240.0,
                //color: Color.fromARGB(238, 238, 238, 238),
                height: 300.0,
                margin: const EdgeInsets.fromLTRB(80, 100, 80, 35),

                decoration: const BoxDecoration(
                  color: Color.fromARGB(238, 238, 238, 238),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                        offset: Offset(
                          1.0,
                          5.0,
                        ))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                customDialogWidget.flagsCard(context);
              },
              child: Container(
                child: Column(
                  children: [
                    //SizedBox(height: 20),
                    Row(children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(25, 20, 20, 5),
                          child: GestureDetector(
                              onTap: () {},
                              child: Image(
                                height: 60.0,
                                width: 60.0,
                                //Image.asset("image/yellowflag.PNG"),
                                image: AssetImage('image/yellow_flag.png'),
                              ))),
                      Text("yellow flag count"),
                    ]),
                    //SizedBox(height: 20),
                    Row(children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(25, 20, 20, 5),
                          child: GestureDetector(
                              onTap: () {},
                              child: Image(
                                height: 60.0,
                                width: 60.0,
                                //Image.asset("image/yellowflag.PNG"),
                                image: AssetImage('image/red_flag.png'),
                              ))),
                      Text("red flag count"),
                    ]),
                    SizedBox(height: 20),
                    Padding(
                        padding: EdgeInsets.all(30),
                        child: Text(
                            "your rating this month should be X% to get rid ofone Y flag "))
                  ],
                ),
                width: 240.0,
                height: 300.0,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(238, 238, 238, 238),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                        offset: Offset(
                          1.0,
                          5.0,
                        ))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                customDialogWidget.ratingCard(context);
              },
              child: Container(
                child: Text("containers3"),
                //color: Color.fromARGB(238, 238, 238, 238),
                width: 240.0,
                height: 300.0,
                margin: const EdgeInsets.only(top: 35.0, bottom: 100),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(238, 238, 238, 238),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                        offset: Offset(
                          1.0,
                          5.0,
                        ))
                  ],
                ),
                // margin: const EdgeInsets.fromLTRB(95, 35, 95, 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
