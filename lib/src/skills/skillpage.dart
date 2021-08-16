import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/src/homepage.dart';
import 'package:flutter_portfolio_web/src/project/projectpage.dart';
import 'package:flutter_portfolio_web/src/skills/mobileskills.dart';
import 'package:flutter_portfolio_web/widget/bg.dart';
import 'package:flutter_portfolio_web/widget/clippath.dart';
import 'package:flutter_portfolio_web/widget/skillProcessBarItems.dart';
import 'package:flutter_portfolio_web/widget/techItemWidget.dart';
import 'package:flutter_portfolio_web/widget/widgetAnimation.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:page_transition/page_transition.dart';

class SkillsPage extends StatefulWidget {
  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return (w > 1100 && h > 500)
        ? DesktopSkills()
        : w < 600
            ? MobileSkill()
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

class DesktopSkills extends StatefulWidget {
  @override
  _DesktopSkillsState createState() => _DesktopSkillsState();
}

class _DesktopSkillsState extends State<DesktopSkills> {
  int valueTech;
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
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
                alignment1: Alignment.bottomLeft,
                alignment2: Alignment.center,
              ),
            ),
            isClick
                ? Positioned(
                    bottom: valueTech != 0 ? h * .05 : h * .03,
                    left: w * .12,
                    child: TechItems(
                      list: TechCheck(valueTech),
                      index: valueTech,
                      listRate: TechRate(valueTech),
                    ))
                : Container(),
            Positioned(
              top: 0,
              left: w * .15,
              child: GestureDetector(
                onVerticalDragEnd: (d) {
                  if (d.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: HomePage()));
                  }
                },
                child: Container(
                  width: w * .4,
                  height: h * .4,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: h * .01,
                      ),
                      Text(
                        'Swipe to go Home',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: w * .03),
                        child: Transform.rotate(
                          angle: 90 * pi / 180,
                          child: Icon(Icons.double_arrow,
                              color: Colors.white, size: w * .02),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: -w * .425,
              top: -w * .425,
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
            Positioned(
              top: h * .33,
              left: -w * .18,
              child: Transform.rotate(
                angle: -90 * pi / 180,
                child: WidgetAnimator(
                  direction: "TOP_TO_BOTTOM",
                  milli: 300,
                  child: Text(
                    'Skills'.toUpperCase(),
                    style: TextStyle(
                        fontSize: w * .15,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(.1)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onHorizontalDragEnd: (DragEndDetails drag) {
                  if (drag.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: ProjectPage()));
                  }
                },
                child: Container(
                  width: w * .4,
                  height: h * .75,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                        left: w * .02,
                        top: h * .02,
                        child: WidgetAnimator(
                          direction: "RIGHT_TO_LEFT",
                          milli: 200,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                valueTech = 1;
                                isClick = true;
                              });
                            },
                            child: SkillProcessBar(
                              widRate: .1,
                              index: 1,
                              color: Colors.purple[500],
                              fontRate: .015,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: w * .075,
                        top: h * .235,
                        child: WidgetAnimator(
                          direction: "RIGHT_TO_LEFT",
                          milli: 300,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                valueTech = 2;
                                isClick = true;
                              });
                            },
                            child: SkillProcessBar(
                              widRate: .1,
                              index: 2,
                              color: Colors.teal[500],
                              fontRate: .015,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: w * .14,
                        top: h * .42,
                        child: WidgetAnimator(
                          direction: "RIGHT_TO_LEFT",
                          milli: 400,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClick = true;
                                valueTech = 3;
                              });
                            },
                            child: SkillProcessBar(
                              widRate: .1,
                              index: 3,
                              color: Colors.red[500],
                              fontRate: .015,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: w * .02,
                        top: h * .51,
                        child: WidgetAnimator(
                          direction: "RIGHT_TO_LEFT",
                          milli: 500,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClick = true;
                                valueTech = 4;
                              });
                            },
                            child: SkillProcessBar(
                              widRate: .1,
                              index: 4,
                              color: Colors.amber[800],
                              fontRate: .015,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: w * .015,
                        top: h * .015,
                        child: WidgetAnimator(
                          direction: "RIGHT_TO_LEFT",
                          milli: 600,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClick = true;
                                valueTech = 0;
                              });
                            },
                            child: SkillProcessBar(
                              widRate: .18,
                              index: 0,
                              color: Colors.blue[500],
                              fontRate: .03,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            h > 600
                ? Positioned(
                    bottom: h * .025,
                    right: w * .025,
                    child: Text(
                      'Skills',
                      style: TextStyle(
                          fontSize: w * .05,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w900,
                          color: Colors.indigo[500]),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  List<String> TechCheck(int i) {
    return kTechDetail[i];
  }

  List<String> TechRate(int i) {
    return kTechRate[i];
  }
}
