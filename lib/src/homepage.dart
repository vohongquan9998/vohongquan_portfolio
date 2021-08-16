import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/src/home/desktop_home.dart';
import 'package:flutter_portfolio_web/src/home/mobile_home.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDrag;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return ScreenTypeLayout(
        mobile: MobileHome(),
        desktop: (w > 1100 && h > 500)
            ? DesktopHome()
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
              ));
  }
}
