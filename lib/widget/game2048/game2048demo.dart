import 'dart:math' show Random;

import 'package:flutter/material.dart';

class BoardWidget extends StatefulWidget {
  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  Board _board;
  int row;
  int column;
  bool _isMoving;
  bool _gameOver;
  double tilePadding = 5.0;
  MediaQueryData _queryData;

  @override
  void initState() {
    super.initState();
    row = 4;
    column = 4;
    _isMoving = false;
    _gameOver = false;

    _board = Board(column, row);
    NewGame();
  }

  void NewGame() {
    setState(() {
      _board.initBoard();
      _gameOver = false;
    });
  }

  void GameOver() {
    setState(() {
      if (_board.GameOver()) return _gameOver = true;
    });
  }

  Size boardSize() {
    Size size = _queryData.size;
    return Size(size.width, size.width);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    _queryData = MediaQuery.of(context);

    List<TileWidget> _tileWidget = List<TileWidget>();

    for (int r = 0; r < row; ++r) {
      for (int c = 0; c < column; ++c) {
        _tileWidget.add(TileWidget(
          tile: _board.getTile(r, c),
          state: this,
        ));
      }
    }

    // ignore: deprecated_member_use
    List<Widget> children = List<Widget>();

    children.add(Game2048(state: this));
    children.addAll(_tileWidget);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(colors: [Colors.pink[800], Colors.pink])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: w * .9,
                        height: h * .1,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: w * .25,
                              height: h * .1,
                              child: Opacity(
                                opacity: _gameOver ? 1.0 : 0.0,
                                child: Center(
                                    child: Text(
                                  'Game Over',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Scores: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: w * .02,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "${_board.scores}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: w * .03,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        NewGame();
                      },
                      child: Container(
                        width: w * .1,
                        height: w * .1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.indigo, Colors.indigo[400]]),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                            child: Icon(
                          Icons.refresh,
                          size: 30,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue[50],
            width: _queryData.size.width * .4,
            height: _queryData.size.height * .8,
            child: GestureDetector(
              onVerticalDragUpdate: (detail) {
                if (detail.delta.distance == 0 || _isMoving) {
                  return;
                }
                _isMoving = true;
                if (detail.delta.direction > 0) {
                  setState(() {
                    _board.moveDown();
                    GameOver();
                  });
                } else {
                  setState(() {
                    _board.moveUp();
                    GameOver();
                  });
                }
              },
              onVerticalDragEnd: (d) {
                _isMoving = false;
              },
              onVerticalDragCancel: () {
                _isMoving = false;
              },
              onHorizontalDragUpdate: (d) {
                if (d.delta.distance == 0 || _isMoving) {
                  return;
                }
                _isMoving = true;
                if (d.delta.direction > 0) {
                  setState(() {
                    _board.moveLeft();
                    GameOver();
                  });
                } else {
                  setState(() {
                    _board.moveRight();
                    GameOver();
                  });
                }
              },
              onHorizontalDragEnd: (d) {
                _isMoving = false;
              },
              onHorizontalDragCancel: () {
                _isMoving = false;
              },
              child: Stack(
                children: children,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TileWidget extends StatefulWidget {
  final Tile tile;
  final _BoardWidgetState state;

  const TileWidget({Key key, this.tile, this.state}) : super(key: key);

  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    widget.tile.isNew = false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tile.isNew && !widget.tile.isEmpty()) {
      controller.reset();
      controller.forward();
      widget.tile.isNew = false;
    } else {
      controller.animateTo(1.0);
    }
    return AnimatedTileWidget(
      tile: widget.tile,
      state: widget.state,
      animation: animation,
    );
  }
}

class AnimatedTileWidget extends AnimatedWidget {
  final Tile tile;
  final _BoardWidgetState state;

  AnimatedTileWidget(
      {Key key, this.tile, this.state, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    double animationValue = animation.value;
    Size boardSize = state.boardSize();
    double width = (boardSize.width - (state.column + 1) * state.tilePadding) /
        state.column;

    if (tile.value == 0) {
      return Container();
    } else {
      return TileBox(
        left: (tile.column * width + state.tilePadding * (tile.column + 1)) +
            width / 2 * (1 - animationValue),
        top: tile.row * width +
            state.tilePadding * (tile.row + 1) +
            width / 2 * (1 - animationValue),
        size: width * animationValue,
        color: tileColor.containsKey(tile.value)
            ? tileColor[tile.value]
            : Colors.blue,
        text: Text(
          '${tile.value}',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}

class TileBox extends StatelessWidget {
  final double left;
  final double top;
  final double size;
  final Color color;
  final Text text;

  const TileBox(
      {Key key, this.left, this.top, this.size, this.color, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}

class Game2048 extends StatelessWidget {
  final _BoardWidgetState state;

  const Game2048({this.state});

  @override
  Widget build(BuildContext context) {
    Size boardSize = state.boardSize();
    double width = (boardSize.width - (state.column + 1) * state.tilePadding) /
        state.column;
    // double width = MediaQuery.of(context).size.width * .4;
    // ignore: deprecated_member_use
    List<TileBox> bgbox = List<TileBox>();
    for (int r = 0; r < state.row; ++r) {
      for (int c = 0; c < state.column; ++c) {
        TileBox tile = TileBox(
          left: c * width * state.tilePadding * (c + 1),
          top: r * width * state.tilePadding * (r + 1),
          size: width * .4,
        );
        bgbox.add(tile);
      }
    }
    return Positioned(
      left: 0.0,
      top: 0.0,
      child: Container(
        width: state.boardSize().width,
        height: state.boardSize().width,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Stack(
          children: bgbox,
        ),
      ),
    );
  }
}

class Board {
  final int columm;
  final int row;
  int scores;

  Board(this.columm, this.row);

  List<List<Tile>> _boardTile;

  void initBoard() {
    _boardTile = List.generate(
      4,
      (r) => List.generate(
        4,
        (c) => Tile(
          row: r,
          column: c,
          value: 0,
          isNew: false,
          canMerge: false,
        ),
      ),
    );

    print(_boardTile);

    scores = 0;
    resetCanMerge();
    randomEmptyTile();
    randomEmptyTile();
  }

  void moveLeft() {
    if (!canMoveLeft()) return;
    for (int r = 0; r < row; ++r) {
      for (int c = 0; c < columm; ++c) {
        mergeLeft(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  void moveRight() {
    if (!canMoveRight()) return;
    for (int r = 0; r < row; ++r) {
      for (int c = columm - 2; c >= 0; --c) {
        mergeRight(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  void moveUp() {
    if (!canMoveUp()) return;
    for (int r = 0; r < row; ++r) {
      for (int c = 0; c < columm; ++c) {
        mergeUp(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  void moveDown() {
    if (!canMoveDown()) return;
    for (int r = row - 2; r >= 0; --r) {
      for (int c = 0; c < columm; ++c) {
        mergeDown(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

//Left
  void mergeLeft(int row, int c) {
    while (c > 0) {
      merge(_boardTile[row][c], _boardTile[row][c - 1]);
      c--;
    }
  }

  bool canMoveLeft() {
    for (int r = 0; r < row; ++r) {
      for (int c = 1; c < columm; ++c) {
        if (canMerge(_boardTile[r][c], _boardTile[r][c - 1])) {
          return true;
        }
      }
    }
    return false;
  }

//Right
  void mergeRight(int row, int c) {
    while (c < columm - 1) {
      merge(_boardTile[row][c], _boardTile[row][c + 1]);
      c++;
    }
  }

  bool canMoveRight() {
    for (int r = 0; r < row; ++r) {
      for (int c = columm - 2; c >= 0; --c) {
        if (canMerge(_boardTile[r][c], _boardTile[r][c + 1])) {
          return true;
        }
      }
    }
    return false;
  }

//Up

  void mergeUp(int r, int c) {
    while (r > 0) {
      merge(_boardTile[r][c], _boardTile[r - 1][c]);
      r--;
    }
  }

  bool canMoveUp() {
    for (int r = 1; r < row; ++r) {
      for (int c = 0; c < columm; ++c) {
        if (canMerge(_boardTile[r][c], _boardTile[r - 1][c])) {
          return true;
        }
      }
    }
    return false;
  }

//Down

  void mergeDown(int r, int c) {
    while (r < row - 1) {
      merge(_boardTile[r][c], _boardTile[r + 1][c]);
      r++;
    }
  }

  bool canMoveDown() {
    for (int r = row - 2; r >= 0; --r) {
      for (int c = 0; c < columm; ++c) {
        if (canMerge(_boardTile[r][c], _boardTile[r + 1][c])) {
          return true;
        }
      }
    }
    return false;
  }

//Merge

  bool canMerge(Tile a, Tile b) {
    return !a.canMerge &&
        ((b.isEmpty() && !a.isEmpty()) || (!a.isEmpty() && a == b));
  }

  void merge(Tile a, Tile b) {
    if (!canMerge(a, b)) {
      if (!a.isEmpty() && !b.canMerge) {
        b.canMerge = true;
      }
      return;
    }

    if (b.isEmpty()) {
      b.value = a.value;
      a.value = 0;
    } else if (a == b) {
      b.value = b.value * 2;
      a.value = 0;
      scores += b.value;
      b.canMerge = true;
    } else {
      b.canMerge = true;
    }
  }

  bool GameOver() {
    return !canMoveLeft() && !canMoveRight() && !canMoveUp() && !canMoveDown();
  }

  Tile getTile(int row, int column) {
    return _boardTile[row][column];
  }

  void randomEmptyTile() {
    // ignore: deprecated_member_use
    List<Tile> empty = List<Tile>();

    _boardTile.forEach((rows) {
      empty.addAll(rows.where((tile) => tile.isEmpty()));
    });
    if (empty.isEmpty) {
      return;
    }
    Random rand = Random();
    int index = rand.nextInt(empty.length);
    empty[index].value = rand.nextInt(9) == 0 ? 4 : 2;
    empty[index].isNew = true;
    empty.removeAt(index);
  }

  void resetCanMerge() {
    _boardTile.forEach((r) {
      r.forEach((tile) {
        tile.canMerge = false;
      });
    });
  }
}

class Tile {
  int row, column;
  int value;
  bool canMerge;
  bool isNew;
  Tile({this.row, this.column, this.value = 0, this.canMerge, this.isNew});

  bool isEmpty() {
    return value == 0;
  }

  @override
  int get hashCode {
    return value.hashCode;
  }

  @override
  operator ==(other) {
    return other is Tile && value == other.value;
  }
}

final Map<int, Color> tileColor = <int, Color>{
  2: Colors.indigo,
  4: Colors.blue[900],
  8: Colors.purple[800],
  16: Colors.red[900],
  32: Colors.indigo[900],
  64: Colors.pink[900],
  128: Colors.purpleAccent[400],
  256: Colors.brown[900],
  512: Colors.orange[900],
  1024: Colors.green[900],
  2048: Colors.teal[900],
};
