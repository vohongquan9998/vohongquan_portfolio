import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/src/home/mobile_home.dart';
import 'package:flutter_portfolio_web/src/skills/mobileskills.dart';
import 'package:flutter_portfolio_web/widget/aboutTitleWidget.dart';
import 'package:flutter_portfolio_web/widget/bg.dart';
import 'package:flutter_portfolio_web/widget/aboutTitleMobileWidget.dart';
import 'package:flutter_portfolio_web/widget/widgetAnimation.dart';
import 'package:page_transition/page_transition.dart';

class MobileAbout extends StatefulWidget {
  @override
  _MobileAboutState createState() => _MobileAboutState();
}

class _MobileAboutState extends State<MobileAbout> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return w < 500
        ? Scaffold(
            backgroundColor: Colors.blue,
            body: Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onVerticalDragEnd: (drag) {
                      if (drag.velocity != Velocity.zero) {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: MobileSkill()));
                      }
                    },
                    child: AnimationBackground(
                      color1: Colors.blue[400],
                      color2: Colors.blue[700],
                      color3: Colors.indigo,
                      color4: Colors.indigo.shade800,
                      second1: 5,
                      second2: 5,
                      alignment1: Alignment.bottomLeft,
                      alignment2: Alignment.center,
                    ),
                  ),
                ),
                Positioned(
                  //small circle right
                  left: -w * .1,
                  top: -w * .75,
                  child: GestureDetector(
                    onVerticalDragEnd: (drag) {
                      if (drag.velocity != Velocity.zero) {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: MobileHome()));
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
                  bottom: h * .025,
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
                            'Swipe to go Skills',
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
                  bottom: h * .025,
                  right: w * .01,
                  child: Text(
                    'Greeting',
                    style: TextStyle(
                        fontSize: w * .15,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w900,
                        color: Colors.blue[800]),
                  ),
                ),
                Positioned(
                  top: h * .15,
                  left: w * .15,
                  child: Container(
                    width: w * .7,
                    child: TypewriterAnimatedTextKit(
                        duration: Duration(seconds: 30),
                        text: kDescriptionAbout,
                        textStyle: TextStyle(
                          fontSize: w * .04,
                        ),
                        textAlign: TextAlign.start,
                        alignment: AlignmentDirectional
                            .topStart // or Alignment.topLeft
                        ),
                  ),
                ),
                Positioned(
                  top: h * .25,
                  right: 0,
                  child: AboutMobileTitle(),
                )
              ],
            ),
          )
        : Container();
  }
}
