import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:ieee_app/ratingCardDetails.dart';

class CustomDialogWidget extends StatelessWidget {
  List item = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
  List flags = [
    'yellow',
    'yellow',
    'yellow',
    'yellow',
    'yellow',
  ];

  // remove this  u dont need it after tesing _ ab
  @override
  Widget build(BuildContext context) => TextButton(
      onPressed: () => criteriaCard(context),
      child: Text(
        'Custom Dialog',
      ));

  void criteriaCard(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 12),
                    Text(
                      'Completion of Certificate Criteria',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 12),
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
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.black,
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 217,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: item.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: ListTile(
                                  leading: const Icon(
                                    Icons.square,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                      "You achieved criterion ${item[index]}")),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

  void flagsCard(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: Dialog(
              backgroundColor: Color.fromRGBO(238, 238, 238, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    Container(
                      height: 217,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: flags.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                  leading: Image(
                                    image: AssetImage(
                                        'image/${flags[index]}_flag.png'),
                                  ),
                                  title: Text(
                                      " You received a  ${flags[index]} flag for not submitting a task on Date Y")),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    redFlageAdvice(),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

  Widget redFlageAdvice() {
    if (flags.contains('red')) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'A rating of 75% or higher will remove that red flag for you! \n You can do it! Good luck!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if (flags.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Woudn't hurt you to miss somethings \n hehe ^-^ \n Keep up the Good work !! ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  void ratingCard(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: Dialog(
              backgroundColor: Color.fromRGBO(238, 238, 238, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RatingCardDetails(),
              ),
            ),
          );
        },
      );
}
