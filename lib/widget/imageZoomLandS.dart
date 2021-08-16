import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio_web/models/data.dart';
import 'package:flutter_portfolio_web/widget/bg.dart';

class ImageZoomLand extends StatefulWidget {
  final int index;
  ImageZoomLand({this.index});

  @override
  _ImageZoomLandState createState() => _ImageZoomLandState();
}

class _ImageZoomLandState extends State<ImageZoomLand> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: kImageProjectBgHero,
                child: AnimationBackground(
                  color1: Colors.blue[400],
                  color2: Colors.blue[700],
                  color3: Colors.indigo,
                  color4: Colors.indigo.shade800,
                  second1: 5,
                  second2: 5,
                  alignment1: Alignment.topLeft,
                  alignment2: Alignment.center,
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * .075, vertical: h * .04),
                child: Hero(
                    tag: kImageProjectHero,
                    child: Image.asset(kprojectBanner[widget.index])),
              ),
            ),
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
      ),
    );
  }
}
