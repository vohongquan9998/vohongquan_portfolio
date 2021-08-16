import 'dart:async';

import 'package:flutter/material.dart';

class SlidePuzzle extends StatefulWidget {
  @override
  _SlidePuzzleState createState() => _SlidePuzzleState();
}

class _SlidePuzzleState extends State<SlidePuzzle> {
  var num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  int second = 0;
  Color color;
  Timer timer;
  static const duration = const Duration(seconds: 1);
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    num.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (timer == null) {
      timer = Timer.periodic(duration, (timer) {
        startTimer();
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          color: Colors.amber[800],
          child: Column(
            children: <Widget>[
              MyTile(
                size: size,
              ),
              Menu(
                move: move,
                second: second,
                reset: OnReset,
              ),
              Grid(
                number: num,
                size: size,
                onclick: clickonGrid,
                color: Colors.white,
              ),
              // FooterButton(
              //   reset: OnReset,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void clickonGrid(index) {
    if (second == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && num[index - 1] == 0 && index % 4 != 0 /*To left*/ ||
        index + 1 < 16 &&
            num[index + 1] == 0 &&
            (index + 1) % 4 != 0 /*To right*/ ||
        index + 4 < 16 && num[index + 4] == 0 /*To bottom*/ ||
        index - 4 >= 0 && num[index - 4] == 0 /*To top*/) {
      setState(() {
        num[num.indexOf(0)] = num[index];
        num[index] = 0;
        move++;
      });
    }

    checkIfwin();
  }

  void OnReset() {
    setState(() {
      num.shuffle();
      move = 0;
      isActive = false;
      second = 0;
    });
  }

  void startTimer() {
    if (isActive) {
      setState(() {
        second++;
      });
    }
  }

  bool isSort(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkIfwin() {
    if (isSort(num)) {
      isActive = false;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You win',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }
  }
}

class Time extends StatelessWidget {
  int second;
  Time({this.second});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Time:${second}',
      style: TextStyle(
          fontSize: 25.0,
          color: Colors.amber[900],
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none),
    );
  }
}

class MyTile extends StatelessWidget {
  var size;

  MyTile({this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .08,
      padding: EdgeInsets.all(5),
      child: Text(
        'Slide Puzzle Game',
        style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none),
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  Function reset;
  ResetButton({this.reset});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: reset,
      color: Colors.blue[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        'New Game',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Move extends StatelessWidget {
  int move;
  Move({this.move});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Move:${move}',
      style: TextStyle(
          fontSize: 25.0,
          color: Colors.amber[900],
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none),
    );
  }
}

class Menu extends StatelessWidget {
  int move;
  int second;
  Function reset;
  Menu({this.move, this.second, this.reset});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .1,
            height: MediaQuery.of(context).size.height * .08,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 10.0),
                    color: Colors.black45,
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.amber[900],
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .2,
            height: MediaQuery.of(context).size.height * .08,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 10),
                  ),
                ]),
            child: Center(child: Move(move: move)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .2,
            height: MediaQuery.of(context).size.height * .08,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 10),
                  ),
                ]),
            child: Center(child: Time(second: second)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .1,
            height: MediaQuery.of(context).size.height * .08,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 10.0),
                    color: Colors.black45,
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]),
            child: IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.amber[900],
                size: 40,
              ),
              onPressed: reset,
            ),
          ),
        ],
      ),
    );
  }
}

class GridButton extends StatelessWidget {
  Function click;
  String name;
  Color color;
  GridButton({this.click, this.name, this.color});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      color: color,
      onPressed: click,
      child: Text(
        name,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Grid extends StatelessWidget {
  var number = [];
  var size;
  Function onclick;
  Color color;

  Grid({this.number, this.size, this.onclick, this.color});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.8,
      width: MediaQuery.of(context).size.width * .4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: number.length,
          itemBuilder: (BuildContext context, int index) {
            return number[index] != 0
                ? GridButton(
                    click: () {
                      onclick(index);
                    },
                    name: '${number[index]}',
                    color: color,
                  )
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class FooterButton extends StatelessWidget {
  Function reset;
  FooterButton({this.reset});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .2,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 10.0),
                    color: Colors.black45,
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.amber[900],
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .2,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 10.0),
                    color: Colors.black45,
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]),
            child: IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.amber[900],
                size: 40,
              ),
              onPressed: reset,
            ),
          ),
        ],
      ),
    );
  }
}
