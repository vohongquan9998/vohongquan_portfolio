import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/src/about/mobileabout.dart';
import 'package:flutter_portfolio_web/widget/bg.dart';
import 'package:flutter_portfolio_web/widget/menuWidget.dart';
import 'package:flutter_portfolio_web/widget/menuWidgetMobile.dart';
import 'package:flutter_portfolio_web/widget/widgetAnimation.dart';
import 'package:page_transition/page_transition.dart';

class MobileHome extends StatefulWidget {
  @override
  _MobileHomeState createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onVerticalDragEnd: (drag) {
                  print(drag);
                  if (drag.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: MobileAbout()));
                  }
                },
                child: AnimationBackground(
                  color1: Colors.blue[400],
                  color2: Colors.blue[700],
                  color3: Colors.indigo,
                  color4: Colors.indigo.shade800,
                  second1: 5,
                  second2: 5,
                  alignment1: Alignment.topLeft,
                  alignment2: Alignment.center,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: -w * .1,
              child: Container(
                width: w * .4,
                height: h * .5,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.rotate(
                      angle: -90 * pi / 180,
                      child: Text(
                        'Swipe to go Greeting',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: h * .05,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              //small circle right
              left: -w * .1,
              bottom: -w * .75,
              child: GestureDetector(
                onVerticalDragEnd: (drag) {
                  if (drag.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: MobileAbout()));
                  }
                },
                child: Hero(
                  tag: kCircleHero,
                  child: Container(
                    width: w * 2,
                    height: w * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: WidgetAnimator(
                  direction: "BOTTOM_TO_TOP",
                  milli: 300,
                  child: MenuWidgetMobile()),
            ),
            Positioned(
              top: h * .025,
              right: w * .01,
              child: Text(
                'Home',
                style: TextStyle(
                    fontSize: w * .15,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w900,
                    color: Colors.blue[800]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
