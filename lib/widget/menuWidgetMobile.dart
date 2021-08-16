import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/src/about/mobileabout.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuWidgetMobile extends StatefulWidget {
  @override
  _MenuWidgetMobileState createState() => _MenuWidgetMobileState();
}

class _MenuWidgetMobileState extends State<MenuWidgetMobile> {
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
                  type: PageTransitionType.topToBottom, child: MobileAbout()));
        }
      },
      child: Container(
        width: w * .9,
        height: h * .6,
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              bottom: h * .31,
              right: -w * .05,
              child: Transform.rotate(
                angle: -90 * pi / 180,
                child: Text(
                  'Developer',
                  style: TextStyle(
                      fontSize: w * .1,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w900,
                      color: Colors.purple[400]),
                ),
              ),
            ),
            Positioned(
              bottom: h * .05,
              right: w * .07,
              child: Text(
                'Vo Hong Quan',
                style: TextStyle(
                    fontSize: w * .1,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w900,
                    color: Colors.blue[900]),
              ),
            ),
            Positioned(
              bottom: h * .11,
              right: w * .15,
              child: GestureDetector(
                onTap: () async {
                  await canLaunch(klinkGithubHome)
                      ? launch(klinkGithubHome)
                      : throw ('Failed to Launch');
                },
                child: Text(
                  'Github',
                  style: TextStyle(
                      fontSize: w * .1,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      color: Colors.red[900]),
                ),
              ),
            ),
            Positioned(
              bottom: h * .16,
              right: w * .15,
              child: GestureDetector(
                onTap: () async {
                  await canLaunch(klinkFBHome)
                      ? launch(klinkFBHome)
                      : throw ('Failed to Launch');
                },
                child: Text(
                  'Facebook',
                  style: TextStyle(
                      fontSize: h * .05,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.normal,
                      color: Colors.blue[700]),
                ),
              ),
            ),
            Positioned(
              bottom: h * .22,
              right: w * .25,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await canLaunch(klinkZaloHome)
                          ? launch(klinkZaloHome)
                          : throw ('Failed to Launch');
                    },
                    child: Text(
                      'Zalo',
                      style: TextStyle(
                          fontSize: w * .05,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.normal,
                          color: Colors.blueGrey[800]),
                    ),
                  ),
                  SizedBox(
                    width: w * .01,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await canLaunch(klinkEmail)
                          ? launch(klinkEmail)
                          : throw ('Failed to Launch');
                    },
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: w * .05,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.normal,
                          color: Colors.green[900]),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: h * .35,
              right: -w * .01,
              child: Transform.rotate(
                angle: -90 * pi / 180,
                child: Text(
                  'Mobile',
                  style: TextStyle(
                      fontSize: w * .07,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ),
            Positioned(
              bottom: h * .16,
              right: -w * .03,
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Text(
                  'Design',
                  style: TextStyle(
                      fontSize: w * .07,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.lime[700]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
