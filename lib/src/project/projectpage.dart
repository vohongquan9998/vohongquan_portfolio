import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/src/about/aboutpage.dart';
import 'package:flutter_portfolio_web/src/project/mobileproject.dart';
import 'package:flutter_portfolio_web/src/skills/skillpage.dart';
import 'package:flutter_portfolio_web/widget/bg.dart';
import 'package:flutter_portfolio_web/widget/imageZoomScreen.dart';
import 'package:flutter_portfolio_web/widget/stepper.dart';
import 'package:flutter_portfolio_web/widget/testmodeScr.dart';
import 'package:flutter_portfolio_web/widget/widgetAnimation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return (w > 1100 && h > 500)
        ? DesktopProject()
        : w < 600
            ? MobileProject()
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

class DesktopProject extends StatefulWidget {
  @override
  _DesktopProjectState createState() => _DesktopProjectState();
}

class _DesktopProjectState extends State<DesktopProject> {
  int val;
  bool isHover = false;
  @override
  void initState() {
    super.initState();
    val = 1;
  }

  Widget getChildBg() {
    return AnimationBackground(
      color1: Colors.lightBlue[400],
      color2: Colors.lightBlue[700],
      color3: Colors.blue[400],
      color4: Colors.indigo.shade900,
      second1: 10,
      second2: 10,
      alignment1: Alignment.topCenter,
      alignment2: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: kImageProjectBgHero,
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
              right: w * .15,
              child: GestureDetector(
                onVerticalDragEnd: (d) {
                  if (d.velocity != Velocity.zero) {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 350),
                          pageBuilder: (context, animation, secondAnimation) {
                            return AboutPage();
                          },
                          transitionsBuilder:
                              (context, animation, seccondAnimation, child) {
                            return SlideTransition(
                              position: animation.drive(
                                Tween(
                                  begin: Offset(0, -1),
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
                  height: h > 850 ? h * .3 : h * .25,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h * .01,
                      ),
                      Text(
                        'Swipe to go Greeting',
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: w * .03),
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
              top: h * .38,
              right: -w * .18,
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: WidgetAnimator(
                  direction: "TOP_TO_BOTTOM",
                  milli: 300,
                  child: Text(
                    'Project'.toUpperCase(),
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
            Positioned(
              bottom: w > 1500 ? h * .04 : h * .02,
              right: w > 1500 ? w * .2 : w * .14,
              child: WidgetAnimator(
                direction: "TOP_TO_BOTTOM",
                milli: 500,
                child: Container(
                  width: w > 1500 ? w * .35 : w * .45,
                  height: h > 800 ? h * .7 : h * .9,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                          tag: kImageProjectHero,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * .05, vertical: h * .05),
                            child: Image.asset(
                              kprojectBanner[val - 1],
                              fit: BoxFit.fitWidth,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: w > 1500 ? w * .005 : w * .01,
                        bottom: w > 1500 ? h * .2 : h * .38,
                        top: w > 1500 ? h * .2 : h * .38,
                        child: Container(
                          width: w * .045,
                          height: h * .09,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(.4)),
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_right_rounded,
                                size: w * .037,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (val < kProjectTitle.length) val++;
                                });
                              }),
                        ),
                      ),
                      // Positioned(
                      //   left: w > 1900 ? w * .13 : w * .18,
                      //   bottom: w > 1900
                      //       ? h * .11
                      //       : w > 1400
                      //           ? h * .17
                      //           : h * .16,
                      //   child: Container(
                      //     width: w * .1,
                      //     height: h * .07,
                      //     child: StepperWidget(
                      //       counterColor: Colors.white,
                      //       dragButtonColor: Colors.blue,
                      //       buttonsColor: Colors.blue[900],
                      //       withSpring: true,
                      //       direction: Axis.horizontal,
                      //       initialValue: val,
                      //       onChanged: (int value) {
                      //         if (value > 1 || value <= kProjectTitle.length) {
                      //           if (value >= val) {
                      //             setState(() {
                      //               if (val < kProjectTitle.length) val++;
                      //             });
                      //           } else {
                      //             setState(() {
                      //               if (val <= kProjectTitle.length && val > 1)
                      //                 val--;
                      //             });
                      //           }
                      //         }
                      //       },
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                        left: w > 1500 ? w * .005 : w * .01,
                        bottom: w > 1500 ? h * .2 : h * .38,
                        top: w > 1500 ? h * .2 : h * .38,
                        child: Container(
                          width: w * .045,
                          height: h * .09,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(.4)),
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_left_rounded,
                                size: w * .037,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (val <= kProjectTitle.length && val > 1)
                                    val--;
                                });
                              }),
                        ),
                      ),
                      Positioned(
                        right: w > 1500 ? w * .1 : w * .15,
                        bottom: w > 1900
                            ? h * .04
                            : w > 1400
                                ? h * .13
                                : h * .08,
                        child: WidgetAnimator(
                          direction: "TOP_TO_BOTTOM",
                          milli: 300,
                          child: Container(
                            width: w * .04,
                            height: h * .08,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: IconButton(
                                icon: Image.asset(
                                  'assets/icons8-github color.gif',
                                  width: w * .03,
                                  height: h * .06,
                                ),
                                onPressed: () {
                                  launch(kprojectLink[val - 1]);
                                }),
                          ),
                        ),
                      ),
                      Positioned(
                        left: w > 1500 ? w * .1 : w * .15,
                        bottom: w > 1900
                            ? h * .04
                            : w > 1400
                                ? h * .13
                                : h * .08,
                        child: WidgetAnimator(
                          direction: "TOP_TO_BOTTOM",
                          milli: 300,
                          child: Container(
                            width: w * .04,
                            height: h * .08,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: IconButton(
                                icon: Image.asset(
                                  'assets/icons8-crop.gif',
                                  width: w * .03,
                                  height: h * .06,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ZoomScreen(
                                            index: (val - 1),
                                          )));
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: -w * .425,
              top: -w * .425,
              child: Hero(
                tag: kCircleHero,
                child: GestureDetector(
                  onHorizontalDragEnd: (DragEndDetails drag) {},
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
              top: 0,
              left: 0,
              child: GestureDetector(
                onHorizontalDragEnd: (DragEndDetails drag) {
                  if (drag.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: SkillsPage()));
                  }
                },
                child: Container(
                  width: w * .4,
                  height: h * .75,
                  decoration: BoxDecoration(
                      color: Colors.transparent, shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      Positioned(
                        top: h * .045,
                        left: w * .03,
                        child: WidgetAnimator(
                          direction: "TOP_TO_BOTTOM",
                          milli: 400,
                          child: Container(
                            width: w * .2,
                            height: h * .37,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(360),
                                    child: getChildBg()),
                                Center(
                                  child: Text(
                                    '${kProjectTitle[(val - 1).toInt()]}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: w * .017,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Rubik'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: h * .04,
                        left: w * .02,
                        child: WidgetAnimator(
                          direction: "TOP_TO_BOTTOM",
                          milli: 400,
                          child: Container(
                            width: w * .12,
                            height: h * .22,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(360),
                                    child: getChildBg()),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Current Project',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '${val}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: w * .03,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: h * .02,
                        right: w * .02,
                        child: WidgetAnimator(
                          direction: "TOP_TO_BOTTOM",
                          milli: 400,
                          child: Container(
                            width: w * .1,
                            height: h * .19,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(360),
                                    child: getChildBg()),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'All Project',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '${kProjectTitle.length}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: w * .03,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: h * .24,
                        right: w * .08,
                        child: WidgetAnimator(
                          direction: "TOP_TO_BOTTOM",
                          milli: 400,
                          child: GestureDetector(
                            onTap: () {
                              launch(klinkGithubProject);
                            },
                            child: Container(
                              width: w * .07,
                              height: w * .07,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(360),
                                      child: getChildBg()),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        'More Project',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      kProjectHaveDemo[val - 1]
                          ? Positioned(
                              bottom: h * .16,
                              left: w * .16,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => TestMode(
                                            index: (val - 1),
                                          )));
                                },
                                child: Container(
                                  width: w * .07,
                                  height: w * .07,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: getChildBg()),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            'Test Now',
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            h > 600
                ? Positioned(
                    bottom: h * .025,
                    left: w * .025,
                    child: Text(
                      'Project',
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
}
