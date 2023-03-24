import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:confetti/confetti.dart';
import 'dart:async';

class RatingCardDetails extends StatefulWidget {
  const RatingCardDetails({Key? key}) : super(key: key);
  _RatingCardDetailsState createState() => _RatingCardDetailsState();
}

class _RatingCardDetailsState extends State<RatingCardDetails> {
  bool appear = false;
  int rating = 85;
  List tasks = [
    'task a 8/10',
    'task b 5/10',
    'task c 3/10',
    'task d 5/10',
    'task e 9/10',
    'task f 1/10',
    'task g 10/10',
    'task h 5/10'
  ];
  Widget ratingfeedback() {
    if (rating < 80) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'You can do better!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      //confettiAction.play();
      return Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Well Done !! ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

  Widget details() {
    if (appear) {
      return Container(
        height: 180,
        width: double.infinity,
        child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: Icon(
                    Icons.circle,
                    color: Colors.black,
                  ),
                  title: Text("${tasks[index]}"));
            }),
      );
    } else {
      return SizedBox(
        height: 5,
      );
    }
  }

  late ConfettiController _controllerCenterLeft;

  @override
  void initState() {
    super.initState();
    //for confetti
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 5));

    play();
    //for timed transition
    Timer(
      Duration(seconds: 7),
      () {
        setState(() {
          appear = true;
        });
      },
    );
  }

  @override
  void dispose() {
    _controllerCenterLeft.dispose();

    super.dispose();
  }

  void play() {
    if (rating >= 80) {
      _controllerCenterLeft.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15),
        CircularPercentIndicator(
          radius: 130.0,
          animation: true,
          animationDuration: 1200,
          lineWidth: 15.0,
          percent: rating <= 100 ? rating / 100 : 1,
          center: Text(
            "$rating",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Color.fromRGBO(0, 98, 155, 1),
            ),
          ),
          circularStrokeCap: CircularStrokeCap.butt,
          backgroundColor: Colors.black26,
          progressColor: Color.fromRGBO(0, 98, 155, 1),
        ),
        SizedBox(height: 15),
        //cofetti affect but doesnt appear on ui
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: _controllerCenterLeft,
            blastDirectionality:
                BlastDirectionality.explosive, // radial value - RIGHT
            emissionFrequency: 0.7,
            shouldLoop: false,
            minimumSize: const Size(5,
                5), // set the minimum potential size for the confetti (width, height)
            maximumSize: const Size(20,
                20), // set the maximum potential size for the confetti (width, height)
            numberOfParticles: 1,
            gravity: 0.1,
          ),
        ),
        details(),
        ratingfeedback(),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
