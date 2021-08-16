import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/src/homepage.dart';
import 'package:flutter_portfolio_web/widget/widgetAnimation.dart';
import 'package:page_transition/page_transition.dart';

class AboutTitleWidget extends StatefulWidget {
  @override
  _AboutTitleWidgetState createState() => _AboutTitleWidgetState();
}

class _AboutTitleWidgetState extends State<AboutTitleWidget> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onHorizontalDragEnd: (d) {
        if (d.velocity != Velocity.zero)
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: HomePage()));
      },
      child: WidgetAnimator(
        direction: "LEFT_TO_RIGHT",
        milli: 300,
        child: Container(
          width: w * .2,
          height: h * .3,
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 10,
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: w * .035,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[800]),
                ),
              ),
              Positioned(
                left: -w * .03,
                top: h * .16,
                child: Transform.rotate(
                  angle: 90 * pi / 180,
                  child: Text(
                    'Thanks',
                    style: TextStyle(
                        fontSize: w * .03,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[400]),
                  ),
                ),
              ),
              Positioned(
                left: w * .06,
                top: h * .08,
                child: Text(
                  'Have a nice',
                  style: TextStyle(
                      fontSize: w * .02,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800]),
                ),
              ),
              Positioned(
                left: w * .16,
                top: h * .07,
                child: Transform.rotate(
                  angle: -90 * pi / 180,
                  child: Text(
                    'Day',
                    style: TextStyle(
                        fontSize: w * .03,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[600]),
                  ),
                ),
              ),
              Positioned(
                left: w * .04,
                top: h * .12,
                child: Text(
                  'About',
                  style: TextStyle(
                      fontSize: w * .03,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800]),
                ),
              ),
              Positioned(
                left: w * .04,
                top: h * .17,
                child: Text(
                  'Me',
                  style: TextStyle(
                      fontSize: w * .03,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
