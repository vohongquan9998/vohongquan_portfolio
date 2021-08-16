import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/src/about/mobileabout.dart';
import 'package:flutter_portfolio_web/src/project/mobileproject.dart';
import 'package:flutter_portfolio_web/widget/bg.dart';
import 'package:flutter_portfolio_web/widget/skillProcessBarItems.dart';
import 'package:flutter_portfolio_web/widget/widgetAnimation.dart';
import 'package:page_transition/page_transition.dart';

class MobileSkill extends StatefulWidget {
  @override
  _MobileSkillState createState() => _MobileSkillState();
}

class _MobileSkillState extends State<MobileSkill> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
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
            ),
            Positioned(
              top: 0,
              right: -w * .2,
              child: Container(
                width: w * .4,
                height: h * .5,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.rotate(
                      angle: 90 * pi / 180,
                      child: Text(
                        'Swipe to go Project',
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
              right: -w * .1,
              bottom: -w * .75,
              child: GestureDetector(
                onVerticalDragEnd: (drag) {
                  if (drag.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: MobileProject()));
                  }
                },
                child: Hero(
                  tag: kProject_SkillHero,
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
              left: 0,
              child: GestureDetector(
                onVerticalDragEnd: (DragEndDetails drag) {
                  if (drag.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: MobileProject()));
                  }
                },
                child: Container(
                  width: w * .9,
                  height: h * .6,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                        left: w * .02,
                        top: h * .02,
                        child: WidgetAnimator(
                          direction: "LEFT_TO_RIGHT",
                          milli: 200,
                          child: SkillProcessBar(
                            widRate: .3,
                            index: 1,
                            color: Colors.purple[500],
                            fontRate: .05,
                          ),
                        ),
                      ),
                      Positioned(
                        left: w * .35,
                        bottom: h * .35,
                        child: WidgetAnimator(
                          direction: "LEFT_TO_RIGHT",
                          milli: 300,
                          child: SkillProcessBar(
                            widRate: .3,
                            index: 2,
                            color: Colors.teal[500],
                            fontRate: .05,
                          ),
                        ),
                      ),
                      Positioned(
                        right: w * .01,
                        bottom: h * .2,
                        child: WidgetAnimator(
                          direction: "LEFT_TO_RIGHT",
                          milli: 400,
                          child: SkillProcessBar(
                            widRate: .3,
                            index: 3,
                            color: Colors.red[500],
                            fontRate: .05,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: h * .02,
                        child: WidgetAnimator(
                          direction: "LEFT_TO_RIGHT",
                          milli: 500,
                          child: SkillProcessBar(
                            widRate: .3,
                            index: 4,
                            color: Colors.amber[800],
                            fontRate: .05,
                          ),
                        ),
                      ),
                      Positioned(
                        left: w * .015,
                        bottom: h * .07,
                        child: WidgetAnimator(
                          direction: "LEFT_TO_RIGHT",
                          milli: 600,
                          child: SkillProcessBar(
                            widRate: .5,
                            index: 0,
                            color: Colors.blue[500],
                            fontRate: .07,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: h * .025,
              right: w * .01,
              child: Text(
                'Skills',
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
