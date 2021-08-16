import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/widget/calculator/calculatorScr.dart';
import 'package:flutter_portfolio_web/widget/loginParticles/loginParticles.dart';
import 'package:flutter_portfolio_web/widget/loginpackage/loginpackage.dart';
import 'package:flutter_portfolio_web/widget/paint/paintScreen.dart';
import 'package:flutter_portfolio_web/widget/slide/slideScr.dart';

import 'game2048/game2048demo.dart';

class TestMode extends StatefulWidget {
  final int index;
  TestMode({this.index});

  @override
  _TestModeState createState() => _TestModeState();
}

class _TestModeState extends State<TestMode> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w * .5,
      height: h * .8,
      child: testWidget[widget.index],
    );
  }

  List<Widget> testWidget = [
    Container(),
    Container(),
    Container(),
    Container(),
    LoginPackage(),
    Container(),
    SlidePuzzle(),
    CalculatorScr(),
    PaintScr(),
    BoardWidget(),
    ParticleBgApp(),
  ];
}
