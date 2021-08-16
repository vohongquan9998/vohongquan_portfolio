import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/src/skills/skillpage.dart';
import 'package:flutter_portfolio_web/widget/bg.dart';
import 'package:flutter_portfolio_web/widget/menuWidget.dart';
import 'package:flutter_portfolio_web/widget/widgetAnimation.dart';
import 'package:page_transition/page_transition.dart';

class DesktopHome extends StatefulWidget {
  @override
  _DesktopHomeState createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  @override
  Widget build(BuildContext context) {
    return Desktop();
  }

  // SkillPageFunc(BuildContext context) {
  //   Navigator.of(context).push(
  //     PageRouteBuilder(
  //         transitionDuration: Duration(milliseconds: 350),
  //         pageBuilder: (context, animation, secondAnimation) {
  //           return SkillsPage();
  //         },
  //         transitionsBuilder: (context, animation, seccondAnimation, child) {
  //           return SlideTransition(
  //             position: animation.drive(
  //               Tween(
  //                 begin: Offset(0, 1),
  //                 end: Offset(0, 0),
  //               ),
  //             ),
  //             child: child,
  //           );
  //         }),
  //   );
  // }
}

class Desktop extends StatefulWidget {
  @override
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
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
            Positioned(
              bottom: 0,
              left: w * .15,
              child: GestureDetector(
                onVerticalDragEnd: (drag) {
                  if (drag.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: SkillsPage()));
                  }
                },
                child: Container(
                  width: w * .4,
                  height: h * .5,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: w * .03),
                        child: Transform.rotate(
                          angle: -90 * pi / 180,
                          child: Icon(Icons.double_arrow,
                              color: Colors.white, size: w * .02),
                        ),
                      ),
                      Text(
                        'Swipe to go Skills',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: h * .01,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              //small circle right
              right: -w * .425,
              bottom: -w * .425,
              child: GestureDetector(
                child: Hero(
                  tag: kCircleHero,
                  child: Container(
                    width: w * .85,
                    height: w * .85,
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
                  direction: "BOTTOM_TO_TOP", milli: 300, child: MenuWidget()),
            ),
            h > 650
                ? Positioned(
                    top: h * .025,
                    right: w * .025,
                    child: Text(
                      'Home',
                      style: TextStyle(
                          fontSize: w * .05,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w900,
                          color: Colors.indigo[800]),
                    ),
                  )
                : Container(),
            Positioned(
              top: h * .3,
              left: -w * .14,
              child: Transform.rotate(
                angle: -90 * pi / 180,
                child: WidgetAnimator(
                  direction: "TOP_TO_BOTTOM",
                  milli: 300,
                  child: Text(
                    'Home'.toUpperCase(),
                    style: TextStyle(
                        fontSize: w * .15,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(.1)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
