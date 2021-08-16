import 'dart:async';

import 'package:flutter/material.dart';

class Animator extends StatefulWidget {
  final Widget child;
  final Duration time;
  final String direction;

  Animator(this.child, this.time, this.direction);
  @override
  _AnimatorState createState() => _AnimatorState();
}

class _AnimatorState extends State<Animator>
    with SingleTickerProviderStateMixin {
  Timer timer;
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    timer = Timer(widget.time, animationController.forward);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        child: widget.child,
        builder: (BuildContext context, Widget child) {
          return Opacity(
            opacity: animation.value,
            child: Transform.translate(
              offset: widget.direction == "LEFT_TO_RIGHT"
                  ? Offset(-50 + animation.value * 50, 0)
                  : widget.direction == "RIGHT_TO_LEFT"
                      ? Offset(50 - animation.value * 50, 0)
                      : widget.direction == "TOP_TO_BOTTOM"
                          ? Offset(0, -50 + animation.value * 50)
                          : Offset(0, 50 - animation.value * 50),
              child: child,
            ),
          );
        });
  }
}

Timer timer;
Duration duration = Duration();

wait(int milli) {
  if (timer == null || !timer.isActive) {
    timer = Timer(Duration(microseconds: 120), () {
      duration = Duration();
    });
  }
  duration += Duration(milliseconds: milli);
  return duration;
}

class WidgetAnimator extends StatelessWidget {
  final Widget child;
  final String direction;
  final int milli;
  WidgetAnimator({this.child, this.direction, this.milli});

  @override
  Widget build(BuildContext context) {
    return Animator(child, wait(milli), direction);
  }
}
