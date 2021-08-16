import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/src/home/mobile_home.dart';
import 'package:page_transition/page_transition.dart';

import 'widgetAnimation.dart';

class AboutMobileTitle extends StatefulWidget {
  @override
  _AboutMobileTitleState createState() => _AboutMobileTitleState();
}

class _AboutMobileTitleState extends State<AboutMobileTitle> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onVerticalDragEnd: (drag) {
        if (drag.velocity != Velocity.zero) {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.bottomToTop, child: MobileHome()));
        }
      },
      child: WidgetAnimator(
        direction: "RIGHT_TO_LEFT",
        milli: 300,
        child: Container(
          width: w * .8,
          height: h * .5,
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                right: 10,
                top: 10,
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: w * .1,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[800]),
                ),
              ),
              Positioned(
                right: -w * .04,
                top: h * .2,
                child: Transform.rotate(
                  angle: 90 * pi / 180,
                  child: Text(
                    'Thanks',
                    style: TextStyle(
                        fontSize: w * .08,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[400]),
                  ),
                ),
              ),
              Positioned(
                right: w * .16,
                top: h * .08,
                child: Text(
                  'Have a nice',
                  style: TextStyle(
                      fontSize: w * .05,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800]),
                ),
              ),
              Positioned(
                right: w * .04,
                top: h * .08,
                child: Transform.rotate(
                  angle: -90 * pi / 180,
                  child: Text(
                    'Day',
                    style: TextStyle(
                        fontSize: w * .07,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[600]),
                  ),
                ),
              ),
              Positioned(
                right: w * .15,
                top: h * .11,
                child: Text(
                  'About',
                  style: TextStyle(
                      fontSize: w * .08,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800]),
                ),
              ),
              Positioned(
                right: w * .15,
                top: h * .16,
                child: Text(
                  'Me',
                  style: TextStyle(
                      fontSize: w * .08,
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
