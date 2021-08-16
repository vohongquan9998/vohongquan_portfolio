import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/widget/widgetAnimation.dart';

import 'bg.dart';

class TechItems extends StatelessWidget {
  final int index;
  final List<String> list;
  final List<String> listRate;
  TechItems({this.index, this.list, this.listRate});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        for (int i = 0; i < list.length; i++)
          Padding(
            padding: EdgeInsets.fromLTRB(w * .005, w * .01, 0, w * .01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: list.length > 5 ? w * .1 : w * .15,
                  height: list.length > 5 ? h * .1 : h * .15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.center,
                          colors: [
                            Colors.blue[50],
                            Colors.blue[300],
                          ])),
                  child: Center(
                    child: Text(
                      list[i],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: w * .01,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, w * .01, w * .005, w * .01),
                  child: Container(
                    width: list.length > 5 ? w * .1 : w * .15,
                    height: list.length > 5 ? h * .05 : h * .1,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Center(
                      child: Text(
                        listRate[i],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: w * .013,
                          color: rateColor(listRate[i]),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Color rateColor(String rate) {
    List<Color> list = List();
    if (rate == "Good") return Colors.greenAccent;
    if (rate == "Medium") return Colors.white;
    if (rate == "Need more training") return Colors.orange;
  }
}
