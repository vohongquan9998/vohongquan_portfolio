import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScr extends StatefulWidget {
  @override
  _CalculatorScrState createState() => _CalculatorScrState();
}

class _CalculatorScrState extends State<CalculatorScr> {
  String equal = "0";
  String result = "0";
  String expression = "";
  double equaltionFontSize = 38.0;
  double resultFontSize = 48.0;

  kFontSize() {
    equaltionFontSize = 38.0;
    resultFontSize = 48.0;
  }

  ButtonPressed(String text) {
    setState(() {
      if (text == 'C') {
        equal = "0";
        result = "0";
        kFontSize();
      } else if (text == '=') {
        expression = equal;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '/100');
        expression = expression.replaceAll('Sqrt', 'sqrt');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cn = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cn)}';
        } on Exception catch (e) {
          result = 'Error';
        }
        kFontSize();
      } else if (text == '%') {
        equal = equal + '%';
        kFontSize();
      } else if (text == '-/+') {
        equal = '1/' + equal;
        kFontSize();
      } else if (text == 'x!') {
        equal = equal + '!';
      } else {
        if (equal == '0')
          equal = text;
        else
          equal = equal + text;
        kFontSize();
      }
    });
  }

  Widget ButtonBuild(String text, double height, TextStyle Tstyle,
      Color ButtonColor, bool corner) {
    return Container(
      height: MediaQuery.of(context).size.height * .1 * height,
      child: FlatButton(
        color: ButtonColor,
        shape: (corner == false)
            ? null
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0),
                side: BorderSide(
                    color: ButtonBox, width: 1, style: BorderStyle.solid),
              ),
        onPressed: () => ButtonPressed(text),
        child: Text(text, style: Tstyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: w,
            height: h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: CalculatorBox,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 2),
                      child: Container(
                        width: w * .05,
                        height: h * .1,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(.9),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white70,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Text(
                        '$equal',
                        style: PadStyleCalculator,
                      ),
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.all(10),
                      //color: CalculatorBox,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: CalculatorBox,
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.backspace,
                          color: Equal,
                        ),
                        onPressed: () {
                          setState(() {
                            equal = equal.substring(0, equal.length - 1);
                            if (equal.length == 0) equal = "0";
                          });
                        })
                  ],
                ),
                Container(
                  child: Text(
                    '$result',
                    style: PadStyle,
                  ),
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(15),
                  //color: CalculatorBox,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Calculator,
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.transparent,
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      width: MediaQuery.of(context).size.width * .60,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              ButtonBuild(
                                  'Sqrt', 1, buttonStyle, CalculatorBox, false),
                              ButtonBuild(
                                  '-/+', 1, buttonStyle, CalculatorBox, false),
                              ButtonBuild(
                                  '%', 1, buttonStyle, CalculatorBox, false),
                            ],
                          ),
                          TableRow(
                            children: [
                              ButtonBuild('7', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                              ButtonBuild('8', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                              ButtonBuild('9', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                            ],
                          ),
                          TableRow(
                            children: [
                              ButtonBuild('4', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                              ButtonBuild('5', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                              ButtonBuild('6', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                            ],
                          ),
                          TableRow(
                            children: [
                              ButtonBuild('1', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                              ButtonBuild('2', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                              ButtonBuild('3', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                            ],
                          ),
                          TableRow(
                            children: [
                              ButtonBuild(
                                  'C', 1, buttonStyleNumber, Calculator, true),
                              ButtonBuild('0', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                              ButtonBuild('.', 1, buttonStyleNumber,
                                  CalculatorBox, false),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Calculator,
                        ),
                        width: MediaQuery.of(context).size.width * .34,
                        child: Table(
                          children: [
                            TableRow(
                              children: [
                                ButtonBuild('÷', 1, buttonStyleNumber,
                                    Calculator, false),
                              ],
                            ),
                            TableRow(
                              children: [
                                ButtonBuild('x', 1, buttonStyleNumber,
                                    Calculator, false),
                              ],
                            ),
                            TableRow(
                              children: [
                                ButtonBuild('-', 1, buttonStyleNumber,
                                    Calculator, false),
                              ],
                            ),
                            TableRow(
                              children: [
                                ButtonBuild('+', 1, buttonStyleNumber,
                                    Calculator, false),
                              ],
                            ),
                            TableRow(
                              children: [
                                ButtonBuild('=', 1, EqualStyle, Equal, true),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color CalculatorBox = Colors.blue[100];
Color ButtonBox = Colors.blue.withOpacity(0.5);
Color Calculator = Colors.blue;
Color Equal = Colors.indigo[700];

TextStyle buttonStyle = TextStyle(
  color: Colors.blue[800],
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
);
TextStyle buttonStyleNumber = TextStyle(
  color: Colors.indigo[800],
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
);
TextStyle PadStyle = TextStyle(
  color: Colors.white,
  fontSize: 40.0,
  fontWeight: FontWeight.w500,
);
TextStyle PadStyleCalculator = TextStyle(
  color: Colors.blue[900],
  fontSize: 30.0,
  fontWeight: FontWeight.w500,
);
TextStyle EqualStyle = TextStyle(
  color: Colors.white,
  fontSize: 35.0,
  fontWeight: FontWeight.w900,
);
