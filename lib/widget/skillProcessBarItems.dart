import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class SkillProcessBar extends StatelessWidget {
  final double widRate;
  final int index;
  final Color color;
  final double fontRate;
  SkillProcessBar({this.widRate, this.index, this.color, this.fontRate});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w * widRate,
      height: w * widRate,
      child: LiquidCircularProgressIndicator(
        value: kP_TechAndLanguagePercent[index],
        valueColor: AlwaysStoppedAnimation(color),
        backgroundColor: Colors.blue[100],
        borderColor: Colors.transparent,
        borderWidth: 0,
        direction: Axis.vertical,
        center: Text(
          '${kP_TechAndLanguage[index]}' +
              "\n" +
              '${(kP_TechAndLanguagePercent[index].toDouble() * 100).round()}%',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: w * fontRate,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
