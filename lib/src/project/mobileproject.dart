import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/src/skills/mobileskills.dart';
import 'package:flutter_portfolio_web/widget/bg.dart';
import 'package:flutter_portfolio_web/widget/imageZoomLandS.dart';
import 'package:flutter_portfolio_web/widget/widgetAnimation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileProject extends StatefulWidget {
  @override
  _MobileProjectState createState() => _MobileProjectState();
}

class _MobileProjectState extends State<MobileProject> {
  int val;
  bool isHover = false;
  @override
  void initState() {
    super.initState();
    val = 3;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
                  alignment1: Alignment.bottomRight,
                  alignment2: Alignment.center,
                ),
              ),
            ),
            Positioned(
              bottom: -h * .9,
              right: -w * .5,
              child: WidgetAnimator(
                direction: "TOP_TO_BOTTOM",
                milli: 500,
                child: Container(
                  width: w * 2,
                  height: h * 2,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: h * .65,
                        left: w * .25,
                        right: w * .25,
                        child: Hero(
                          tag: kImageProjectHero,
                          child: Image.asset(
                            kprojectBanner[val - 1],
                            width: w * .5,
                            height: h,
                            fit: BoxFit.fitWidth,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: h * .6,
                        top: h * .6,
                        right: w * .55,
                        child: Container(
                          width: w * .15,
                          height: h * .15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue[900].withOpacity(.9)),
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_right_rounded,
                                size: w * .1,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (val < kProjectTitle.length) val++;
                                });
                              }),
                        ),
                      ),
                      Positioned(
                        bottom: h * .6,
                        top: h * .6,
                        left: w * .55,
                        child: Container(
                          width: w * .15,
                          height: h * .15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue[900].withOpacity(.9)),
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_left_rounded,
                                size: w * .1,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (val <= kProjectTitle.length && val > 1)
                                    val--;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              //small circle right
              right: -w * .1,
              top: -w * 1.5,
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
              top: 0,
              left: 0,
              child: GestureDetector(
                onVerticalDragEnd: (DragEndDetails drag) {
                  if (drag.velocity != Velocity.zero) {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: MobileSkill()));
                  }
                },
                child: Container(
                  width: w * .9,
                  height: h * .3,
                  decoration: BoxDecoration(
                      color: Colors.transparent, shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      Positioned(
                        top: h * .023,
                        left: w * .03,
                        child: WidgetAnimator(
                          direction: "TOP_TO_BOTTOM",
                          milli: 400,
                          child: Container(
                            width: w * .4,
                            height: h * .07,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: getChildBg()),
                                Center(
                                  child: Text(
                                    '${kProjectTitle[(val - 1).toInt()]}',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: w * .05,
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
                        bottom: h * .06,
                        left: w * .02,
                        child: WidgetAnimator(
                          direction: "TOP_TO_BOTTOM",
                          milli: 400,
                          child: Container(
                            width: w * .2,
                            height: h * .1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
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
                                            fontSize: w * .05,
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
                        top: 4,
                        right: w * .06,
                        child: WidgetAnimator(
                          direction: "TOP_TO_BOTTOM",
                          milli: 400,
                          child: Container(
                            width: w * .2,
                            height: h * .1,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
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
                                            fontSize: w * .05,
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
                        top: h * .08,
                        right: w * .26,
                        child: WidgetAnimator(
                          direction: "TOP_TO_BOTTOM",
                          milli: 400,
                          child: GestureDetector(
                            onTap: () {
                              launch(klinkGithubProject);
                            },
                            child: Container(
                              width: w * .2,
                              height: w * .2,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.blue),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
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
                      // kProjectHaveDemo[val - 1]
                      //     ? Positioned(
                      //         bottom: h * .16,
                      //         left: w * .16,
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             Navigator.of(context).push(MaterialPageRoute(
                      //                 builder: (context) => TestMode(
                      //                       index: (val - 1),
                      //                     )));
                      //           },
                      //           child: Container(
                      //             width: w * .07,
                      //             height: w * .07,
                      //             decoration: BoxDecoration(
                      //                 shape: BoxShape.circle,
                      //                 color: Colors.blue),
                      //             child: Stack(
                      //               children: [
                      //                 ClipRRect(
                      //                     borderRadius:
                      //                         BorderRadius.circular(100),
                      //                     child: getChildBg()),
                      //                 Center(
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.symmetric(
                      //                         horizontal: 5),
                      //                     child: Text(
                      //                       'Test Now',
                      //                       textAlign: TextAlign.center,
                      //                       style:
                      //                           TextStyle(color: Colors.white),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     : Container(),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   right: w * .15,
            //   top: h * .37,
            //   child: WidgetAnimator(
            //     direction: "RIGHT_TO_LEFT",
            //     milli: 300,
            //     child: Container(
            //       width: w * .13,
            //       height: h * .13,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle, color: Colors.white),
            //       child: IconButton(
            //           icon: Image.asset(
            //             'assets/icons8-crop.gif',
            //             width: w * .15,
            //             height: h * .15,
            //           ),
            //           onPressed: () {
            //             // Navigator.of(context).push(MaterialPageRoute(
            //             //     builder: (context) => ImageZoomLand(
            //             //           index: (val - 1),
            //             //         )));
            //           }),
            //     ),
            //   ),
            // ),
            Positioned(
              right: w * .05,
              top: h * .07,
              child: WidgetAnimator(
                direction: "LEFT_TO_RIGHT",
                milli: 300,
                child: Container(
                  width: w * .13,
                  height: h * .13,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: IconButton(
                      icon: Image.asset(
                        'assets/icons8-github color.gif',
                        width: w * .15,
                        height: h * .15,
                      ),
                      onPressed: () {
                        launch(kprojectLink[val - 1]);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
