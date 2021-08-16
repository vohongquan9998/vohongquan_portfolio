import 'dart:math';

import 'package:flutter/material.dart';

import '../bg.dart';

class ParticleBgApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: AnimationBackground()),
          Positioned.fill(child: Particles(15)),
          Positioned.fill(child: LoginText()),
          Positioned(
            top: h * .05,
            right: w * .025,
            child: Container(
              width: w * .04,
              height: w * .04,
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
        ],
      ),
    );
  }
}

class Particles extends StatefulWidget {
  final int numberOfParticles;
  Particles(this.numberOfParticles);

  @override
  _ParticlesState createState() => _ParticlesState();
}

class _ParticlesState extends State<Particles> {
  final Random rand = Random();
  final List<ParticleModel> particles = [];
  @override
  void initState() {
    List.generate(widget.numberOfParticles, (index) {
      particles.add(ParticleModel(rand));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Rendering(
      startTime: Duration(seconds: 30),
      onTick: _simulateParticles,
      buider: (context, time) {
        return CustomPaint(
          painter: ParticlePainter(particles, time),
        );
      },
    );
  }

  _simulateParticles(Duration time) {
    particles.forEach((particle) => particle.maintainRestart(time));
  }
}

class ParticleModel {
  Animatable tween;
  double size;
  AnimationProgress animationProgress;
  Random rand;

  ParticleModel(this.rand) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    final startPosition = Offset(-0.2 + 1.4 * rand.nextDouble(), 1.2);
    final endPosition = Offset(-0.2 + 1.4 * rand.nextDouble(), -0.2);
    final duration = Duration(milliseconds: 3000 + rand.nextInt(6000));

    tween = MultiTrackTween([
      Track("x").add(
          duration, Tween(begin: startPosition.dx, end: endPosition.dy),
          curve: Curves.easeInOutSine),
      Track("y").add(
          duration, Tween(begin: startPosition.dx, end: endPosition.dy),
          curve: Curves.easeIn),
    ]);
    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = 0.2 + rand.nextDouble() * 0.4;
  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}

class ParticlePainter extends CustomPainter {
  List<ParticleModel> particles;
  Duration time;

  ParticlePainter(this.particles, this.time);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withAlpha(50);

    particles.forEach((particle) {
      var propress = particle.animationProgress.progress(time);
      final animation = particle.tween.transform(propress);
      final position =
          Offset(animation["x"] * size.width, animation["y"] * size.height);
      canvas.drawCircle(position, size.width * 0.2 * particle.size, paint);
    });
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}

class AnimationBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xff8a113a), end: Colors.lightBlue.shade900)),
      Track("color2").add(Duration(seconds: 3),
          ColorTween(begin: Color(0xff440216), end: Colors.blue.shade600)),
    ]);

    return ControlledAnimation(
      playBack: PlayBack.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}

Widget _buildUsername() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Username:',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            hintText: 'Enter your Username',
            hintStyle: kHintTextStyle,
          ),
        ),
      )
    ],
  );
}

bool _isObscure = true;

Widget _buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password:',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          obscureText: _isObscure,
          keyboardType: TextInputType.text,
          obscuringCharacter: "*",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState({_isObscure != _isObscure});
              },
            ),
            hintText: 'Enter your Password',
            hintStyle: kHintTextStyle,
          ),
        ),
      )
    ],
  );
}

void setState(Set<bool> set) {}

Widget _buildForgorPassword() {
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
        onPressed: () => print("Forgot Password Button Pressed"),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        )),
  );
}

Widget _buildLoginButton() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: () => print('Login Button Pressed'),
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.indigo.shade800,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

Widget _buiSignInWith() {
  return Column(
    children: <Widget>[
      Text(
        '-OR-',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Text(
        'Sign-In with',
        style: kLabelStyle,
      )
    ],
  );
}

Widget _buildSignInWithBtn(Function onTap, AssetImage img) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            )
          ],
          image: DecorationImage(
            image: img,
          )),
    ),
  );
}

Widget _buildSocialBtnRow() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildSignInWithBtn(
          () => print('Login with FB'),
          AssetImage(
            'assets/facebook.jpg',
          ),
        ),
        _buildSignInWithBtn(
          () => print('Login with Google'),
          AssetImage('assets/google.jpg'),
        ),
      ],
    ),
  );
}

class LoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign-In',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildUsername(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildPassword(),
                    _buildForgorPassword(),
                    _buildLoginButton(),
                    _buiSignInWith(),
                    _buildSocialBtnRow(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);
final kBoxDecorationStyle = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      )
    ]);
