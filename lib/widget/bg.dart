import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class AnimationBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final int second1;
  final int second2;
  final Alignment alignment1;
  final Alignment alignment2;
  AnimationBackground({
    this.color1,
    this.color2,
    this.color3,
    this.color4,
    this.second1,
    this.second2,
    this.alignment1,
    this.alignment2,
  });
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(
          Duration(seconds: second1), ColorTween(begin: color1, end: color2)),
      Track("color2").add(
          Duration(seconds: second2), ColorTween(begin: color3, end: color4)),
    ]);

    return ControlledAnimation(
      playBack: PlayBack.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: alignment1,
                  end: alignment2,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}

class Rendering extends StatefulWidget {
  final Widget Function(BuildContext context, Duration timeElapsed) buider;
  final Function(Duration timeElapsed) onTick;
  final Duration startTime;
  final int startTimeTick;

  Rendering(
      {this.buider,
      this.onTick,
      this.startTime = Duration.zero,
      this.startTimeTick = 20})
      : assert(buider != null, "Build need to defined.");

  @override
  _RenderingState createState() => _RenderingState();
}

class _RenderingState extends State<Rendering>
    with SingleTickerProviderStateMixin {
  Ticker _ticker;
  Duration _timeElapsed = Duration(milliseconds: 0);

  @override
  void initState() {
    if (widget.startTime > Duration.zero) {
      _startTimeTick();
    }
    _ticker = createTicker((elapsed) {
      _onRender(elapsed + widget.startTime);
    });
    _ticker.start();
    super.initState();
  }

  void _onRender(Duration effectiveElapsed) {
    if (widget.onTick != null) {
      widget.onTick(effectiveElapsed);
    }
    setState(() {
      _timeElapsed = effectiveElapsed;
    });
  }

  void _startTimeTick() {
    if (widget.onTick != null) {
      Iterable.generate(widget.startTimeTick + 1).forEach((i) {
        final simulatedTime = Duration(
            milliseconds:
                (widget.startTime.inMilliseconds * i / widget.startTimeTick)
                    .round());
        widget.onTick(simulatedTime);
      });
    }
  }

  @override
  void dispose() {
    _ticker.stop(canceled: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.buider(context, _timeElapsed);
  }
}

class MultiTrackTween extends Animatable<Map<String, dynamic>> {
  final _trackToTween = Map<String, _TweenData>();
  var _maxDuration = 0;

  MultiTrackTween(List<Track> tracks)
      : assert(tracks != null && tracks.length > 0,
            "Add a List<Tracks> to configure the tween."),
        assert(tracks.where((track) => track.items.length == 0).length == 0,
            "Each Track needs at least on added Tween by using the add()-method.") {
    _computerMaxDuration(tracks);
    _computerTrackTweens(tracks);
  }

  void _computerMaxDuration(List<Track> tracks) {
    tracks.forEach((track) {
      final trackDuration = track.items
          .map((item) => item.duration.inMilliseconds)
          .reduce((sum, item) => sum + item);
      _maxDuration = max(_maxDuration, trackDuration);
    });
  }

  void _computerTrackTweens(List<Track> tracks) {
    tracks.forEach((track) {
      final trackDuration = track.items
          .map((item) => item.duration.inMilliseconds)
          .reduce((sum, item) => sum + item);
      final sequenceItems = track.items
          .map((item) => TweenSequenceItem(
              tween: item.tween,
              weight: item.duration.inMilliseconds / _maxDuration))
          .toList();
      if (trackDuration < _maxDuration) {
        sequenceItems.add(TweenSequenceItem(
            tween: ConstantTween(null),
            weight: (_maxDuration - trackDuration) / _maxDuration));
      }
      final sequence = TweenSequence(sequenceItems);

      _trackToTween[track.name] =
          _TweenData(tween: sequence, maxTime: trackDuration / _maxDuration);
    });
  }

  Duration get duration {
    return Duration(milliseconds: _maxDuration);
  }

  @override
  Map<String, dynamic> transform(double t) {
    final Map<String, dynamic> result = Map();
    _trackToTween.forEach((name, tweenData) {
      final double tTween = max(0, min(t, tweenData.maxTime - 0.0001));
      result[name] = tweenData.tween.transform(tTween);
    });
    return result;
  }
}

class Track<T> {
  final String name;
  final List<_TrackItem> items = [];

  Track(this.name) : assert(name != null, "Track name must not be null.");

  Track<T> add(Duration duration, Animatable<T> tween, {Curve curve}) {
    items.add(_TrackItem(duration, tween, curve: curve));
    return this;
  }
}

class _TrackItem<T> {
  final Duration duration;
  Animatable<T> tween;

  _TrackItem(this.duration, Animatable<T> _tween, {Curve curve})
      : assert(duration != null, "Please set a duration."),
        assert(_tween != null, "Please set a tween.") {
    if (curve != null) {
      tween = _tween.chain(CurveTween(curve: curve));
    } else {
      tween = _tween;
    }
  }
}

class _TweenData<T> {
  final Animatable<T> tween;
  final double maxTime;

  _TweenData({this.tween, this.maxTime});
}

enum PlayBack {
  PAUSE,
  PLAY_FORWARD,
  PLAY_REVERSE,
  START_OVER_FORWARD,
  START_OVER_REVERSE,
  LOOP,
  MIRROR
}

class ControlledAnimation<T> extends StatefulWidget {
  final PlayBack playBack;
  final Animatable<T> tween;
  final Curve curve;
  final Duration duration;
  final Duration delay;
  final Widget Function(BuildContext bcontext, T animatedValue) builder;
  final Widget Function(BuildContext, Widget child, T animatedValue)
      builderWithChild;
  final Widget child;
  final AnimationStatusListener animationStatusListener;
  final double startPosition;

  ControlledAnimation(
      {this.playBack = PlayBack.PLAY_FORWARD,
      this.tween,
      this.curve = Curves.linear,
      this.delay,
      this.duration,
      this.builder,
      this.builderWithChild,
      this.child,
      this.animationStatusListener,
      this.startPosition = 0.0,
      Key key})
      : assert(duration != null,
            "Please set propery duration/Duration(milliseconds :500)"),
        assert(tween != null,
            "Please set propery tween/Tween:(from:0.0,to:100.0)"),
        assert((builderWithChild != null && child != null && builder == null) ||
            (builder != null && builderWithChild == null && child == null)),
        assert(startPosition >= 0 && startPosition <= 1,
            "must have a value between 0.0 & 1.0"),
        super(key: key);

  @override
  _ControlledAnimationState<T> createState() => _ControlledAnimationState<T>();
}

class _ControlledAnimationState<T> extends State<ControlledAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<T> _animation;
  bool _isDisposed = false;
  bool _waitForDelay = true;
  bool _isCurrentlyMirroring = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() {
        setState(() {});
      })
      ..value = widget.startPosition;
    _animation = widget.tween
        .chain(CurveTween(curve: widget.curve))
        .animate(_controller);
    if (widget.animationStatusListener != null) {
      _controller.addStatusListener(widget.animationStatusListener);
    }
    initialize();
    super.initState();
  }

  void initialize() async {
    if (widget.delay != null) {
      await Future.delayed(widget.delay);
    }
    _waitForDelay = false;
    executeInstruction();
  }

  @override
  void didUpdateWidget(ControlledAnimation oldWidget) {
    _controller.duration = widget.duration;
    executeInstruction();
    super.didUpdateWidget(oldWidget);
  }

  void executeInstruction() async {
    if (_isDisposed || _waitForDelay) {
      return;
    }
    if (widget.playBack == PlayBack.PAUSE) {
      _controller.stop();
    }
    if (widget.playBack == PlayBack.PLAY_FORWARD) {
      _controller.forward();
    }
    if (widget.playBack == PlayBack.PLAY_REVERSE) {
      _controller.reverse();
    }
    if (widget.playBack == PlayBack.START_OVER_FORWARD) {
      _controller.forward(from: 0.0);
    }
    if (widget.playBack == PlayBack.START_OVER_REVERSE) {
      _controller.reverse(from: 1.0);
    }
    if (widget.playBack == PlayBack.LOOP) {
      _controller.repeat();
    }
    if (widget.playBack == PlayBack.MIRROR && !_isCurrentlyMirroring) {
      _controller.repeat(reverse: true);
      _isCurrentlyMirroring = true;
    }
    if (widget.playBack != PlayBack.MIRROR) {
      _isCurrentlyMirroring = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.builder != null) {
      return widget.builder(context, _animation.value);
    } else if (widget.builderWithChild != null && widget.child != null) {
      return widget.builderWithChild(context, widget.child, _animation.value);
    }
    _controller.stop(canceled: true);
    throw FlutterError("Error");
  }

  @override
  void dispose() {
    _isDisposed = true;
    _controller.dispose();
    super.dispose();
  }
}

class AnimationProgress {
  final Duration duration;
  final Duration startTime;

  AnimationProgress({this.duration, this.startTime})
      : assert(duration != null, "Please specify an animation duration."),
        assert(startTime != null, "Please specify a start time");

  double progress(Duration time) => max(0.0,
      min((time - startTime).inMilliseconds / duration.inMilliseconds, 1.0));
}
