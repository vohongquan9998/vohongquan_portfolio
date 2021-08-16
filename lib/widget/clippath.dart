import 'package:flutter/widgets.dart';

class ClipPathHomeOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height);
    //path.lineTo(0, size.height);
    var firstControlPoint = new Offset(size.width * .3, size.height - 30);
    var firstEndPoint = new Offset(size.width * .3, size.height * .7);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * .31, size.height * .5);
    var secondEndPoint = Offset(size.width * .42, size.height * .4);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * .55, size.height * .3);
    var thirdEndPoint = Offset(size.width * .6, size.height * .1);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.quadraticBezierTo(size.width * .635, 0, size.width * .8, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ClipPathAboutOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, size.height);
    //path.lineTo(0, size.height);
    var firstControlPoint = new Offset(size.width * .7, size.height - 30);
    var firstEndPoint = new Offset(size.width * .7, size.height * .7);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * .69, size.height * .5);
    var secondEndPoint = Offset(size.width * .58, size.height * .4);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * .45, size.height * .3);
    var thirdEndPoint = Offset(size.width * .4, size.height * .1);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.quadraticBezierTo(size.width * .365, 0, size.width * .1, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ClipPathSkillOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    var firstControlPoint = new Offset(size.width * .3, 30);
    var firstEndPoint = new Offset(size.width * .3, size.height * .3);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * .31, size.height * .5);
    var secondEndPoint = Offset(size.width * .42, size.height * .6);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * .55, size.height * .7);
    var thirdEndPoint = Offset(size.width * .6, size.height * .9);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.quadraticBezierTo(
        size.width * .635, size.height, size.width * .9, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
