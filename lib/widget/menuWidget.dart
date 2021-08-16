import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/src/about/aboutpage.dart';
import 'package:flutter_portfolio_web/src/skills/skillpage.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onHorizontalDragEnd: (d) {
        if (d.velocity != Velocity.zero) AboutPageFunc(context);
      },
      child: Container(
        width: w * .4,
        height: h * .8,
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              bottom: h * .31,
              right: -w * .01,
              child: Transform.rotate(
                angle: -90 * pi / 180,
                child: Text(
                  'Developer',
                  style: TextStyle(
                      fontSize: w * .043,
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
                    fontSize: w * .045,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w900,
                    color: Colors.blue[900]),
              ),
            ),
            Positioned(
              bottom: h * .145,
              right: w * .12,
              child: GestureDetector(
                onTap: () async {
                  await canLaunch(klinkGithubHome)
                      ? launch(klinkGithubHome)
                      : throw ('Failed to Launch');
                },
                child: Text(
                  'Github',
                  style: TextStyle(
                      fontSize: w * .045,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      color: Colors.red[900]),
                ),
              ),
            ),
            Positioned(
              bottom: h * .25,
              right: w * .12,
              child: GestureDetector(
                onTap: () async {
                  await canLaunch(klinkFBHome)
                      ? launch(klinkFBHome)
                      : throw ('Failed to Launch');
                },
                child: Text(
                  'Facebook',
                  style: TextStyle(
                      fontSize: w * .025,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.normal,
                      color: Colors.blue[700]),
                ),
              ),
            ),
            Positioned(
              bottom: h * .31,
              right: w * .12,
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
                          fontSize: w * .02,
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
                          fontSize: w * .02,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.normal,
                          color: Colors.green[900]),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: h * .43,
            //   right: w * .08,
            //   child: Transform.rotate(
            //     angle: 90 * pi / 180,
            //     child: Text(
            //       'Flutter',
            //       style: TextStyle(
            //           fontSize: w * .0275,
            //           fontFamily: 'Rubik',
            //           fontWeight: FontWeight.bold,
            //           color: Colors.blue[800]),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: h * .43,
              right: w * .005,
              child: Transform.rotate(
                angle: -90 * pi / 180,
                child: Text(
                  'Mobile',
                  style: TextStyle(
                      fontSize: w * .0285,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ),
            // Positioned(
            //   bottom: h * .55,
            //   right: 0,
            //   child: Row(
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           AboutPageFunc(context);
            //         },
            //         child: Text(
            //           'Me',
            //           style: TextStyle(
            //               fontSize: w * .0335,
            //               fontFamily: 'Rubik',
            //               fontWeight: FontWeight.bold,
            //               color: Colors.orange[800]),
            //         ),
            //       ),
            //       Icon(
            //         Icons.arrow_right,
            //         size: h * .1,
            //         color: Colors.orange[800],
            //       ),
            //     ],
            //   ),
            // ),
            // Positioned(
            //   bottom: h * .11,
            //   right: -w * .01,
            //   child: Transform.rotate(
            //     angle: 90 * pi / 180,
            //     child: GestureDetector(
            //       onTap: () => SkillPageFunc(context),
            //       child: Row(
            //         children: [
            //           Text(
            //             'Skills',
            //             style: TextStyle(
            //                 fontSize: w * .025,
            //                 fontFamily: 'Rubik',
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.teal[800]),
            //           ),
            //           Icon(
            //             Icons.arrow_right,
            //             size: h * .1,
            //             color: Colors.teal[800],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: h * .13,
              right: -w * .001,
              child: Transform.rotate(
                angle: 90 * pi / 180,
                child: Text(
                  'Design',
                  style: TextStyle(
                      fontSize: w * .03,
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

  void AboutPageFunc(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 350),
          pageBuilder: (context, animation, secondAnimation) {
            return AboutPage();
          },
          transitionsBuilder: (context, animation, seccondAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: Offset(-1, 0),
                  end: Offset(0, 0),
                ),
              ),
              child: child,
            );
          }),
    );
  }

  SkillPageFunc(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 350),
          pageBuilder: (context, animation, secondAnimation) {
            return SkillsPage();
          },
          transitionsBuilder: (context, animation, seccondAnimation, child) {
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
}
