import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/src/about/mobileabout.dart';
import 'package:flutter_portfolio_web/src/homepage.dart';
import 'package:flutter_portfolio_web/src/project/projectpage.dart';
import 'package:flutter_portfolio_web/widget/aboutTitleWidget.dart';
import 'package:flutter_portfolio_web/widget/bg.dart';
import 'package:flutter_portfolio_web/widget/clippath.dart';
import 'package:flutter_portfolio_web/widget/widgetAnimation.dart';
import 'package:page_transition/page_transition.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return (w > 1100 && h > 500)
        ? DesktopAbout()
        : w < 600
            ? MobileAbout()
            : Scaffold(
                body: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Oop.Please don\'t make your screen is too small.Please wait for the update version to fix this',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: h * .05,
                      ),
                    ),
                  ),
                ),
              );
  }
}

class DesktopAbout extends StatefulWidget {
  @override
  _DesktopAboutState createState() => _DesktopAboutState();
}

class _DesktopAboutState extends State<DesktopAbout> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimationBackground(
              color1: Colors.blue[400],
              color2: Colors.blue[700],
              color3: Colors.indigo,
              color4: Colors.indigo.shade800,
              second1: 5,
              second2: 5,
              alignment1: Alignment.topRight,
              alignment2: Alignment.center,
            ),
          ),
          Positioned(
            left: -w * .425,
            bottom: -w * .425,
            child: Hero(
              tag: kCircleHero,
              child: GestureDetector(
                onHorizontalDragEnd: (DragEndDetails drag) {
                  if (drag.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: HomePage()));
                  }
                },
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
            right: w * .15,
            child: GestureDetector(
              onVerticalDragEnd: (drag) {
                if (drag.velocity != Velocity.zero) {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 350),
                        pageBuilder: (context, animation, secondAnimation) {
                          return ProjectPage();
                        },
                        transitionsBuilder:
                            (context, animation, seccondAnimation, child) {
                          return SlideTransition(
                            position: animation.drive(
                              Tween(
                                begin: Offset(0, 1),
                                end: Offset(0, 0),
                              ),
                            ),
                            child: child,
                          );
                        }),
                  );
                }
              },
              child: Container(
                width: w * .4,
                height: h * .5,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: w * .03),
                      child: Transform.rotate(
                        angle: -90 * pi / 180,
                        child: Icon(Icons.double_arrow,
                            color: Colors.white, size: w * .02),
                      ),
                    ),
                    Text(
                      'Swipe to go Project',
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
            top: h * .38,
            right: -w * .2,
            child: Transform.rotate(
              angle: 90 * pi / 180,
              child: WidgetAnimator(
                direction: "TOP_TO_BOTTOM",
                milli: 300,
                child: Text(
                  'Greeting'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: h * .2,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(.1)),
                ),
              ),
            ),
          ),
          h > 650
              ? Positioned(
                  top: h * .025,
                  left: w * .025,
                  child: Text(
                    'Greeting',
                    style: TextStyle(
                        fontSize: w * .05,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigo[500]),
                  ),
                )
              : Container(),
          Positioned(
            bottom: h * .15,
            left: w * .025,
            child: GestureDetector(
                onHorizontalDragEnd: (drag) {
                  if (drag.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: HomePage()));
                  }
                },
                child: Container(
                  width: w * .25,
                  child: TypewriterAnimatedTextKit(
                      duration: Duration(seconds: 30),
                      text: kDescriptionAbout,
                      textStyle: TextStyle(
                        fontSize: w * .015,
                      ),
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),
                )),
          ),
          Positioned(
            top: h * .4,
            left: 0,
            child: AboutTitleWidget(),
          )
        ],
      ),
    );
  }
}
