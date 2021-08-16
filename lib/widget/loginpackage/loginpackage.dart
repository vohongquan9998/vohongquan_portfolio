import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_web/widget/loginpackage/clippath.dart';

class LoginPackage extends StatefulWidget {
  @override
  _LoginPackageState createState() => _LoginPackageState();
}

class _LoginPackageState extends State<LoginPackage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: w * 9,
        color: Colors.white,
        height: h,
        child: Stack(
          children: [
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: loginList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: w * .4,
                        height: h,
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w * .02, vertical: h * .01),
                          child: loginList[index],
                        ),
                      ),
                    ],
                  );
                }),
            Positioned(
              top: h * .05,
              left: w * .025,
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

  List<Widget> loginList = [
    SocialLogin(),
    MechanicPage(),
    WaterStyleLogin(),
    StreetStyle(),
    GreenTea(),
    MetroSocial(),
  ];
}

class SocialLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.red[100],
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * .2,
              child: Image.asset(
                'assets/logo3.png',
                width: height * .15,
                height: height * .15,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: width * .3,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 40),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.red,
                                ),
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                  color: Colors.red[200],
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.visibility,
                                  color: Colors.red,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.red,
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.red[200],
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Container(
                              width: width * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.red[400],
                              ),
                              child: FlatButton(
                                height: height * .05,
                                color: Colors.red[400],
                                onPressed: () {},
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              'or',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Image.asset(
                              'assets/gg.png',
                              width: height * .05,
                              height: height * .05,
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: width * .9,
                            height: height * .28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                              ),
                              color: Colors.red[200],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have a account?',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                SizedBox(
                                  height: height * .02,
                                ),
                                Container(
                                  width: width * .6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.red[400],
                                  ),
                                  child: FlatButton(
                                    height: height * .05,
                                    color: Colors.red[400],
                                    onPressed: () {},
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * .01,
                                ),
                                Text(
                                  'or sign up with',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                SizedBox(
                                  height: height * .01,
                                ),
                                Image.asset(
                                  'assets/gg.png',
                                  width: height * .05,
                                  height: height * .05,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MechanicPage extends StatefulWidget {
  @override
  _MechanicPageState createState() => _MechanicPageState();
}

class _MechanicPageState extends State<MechanicPage> {
  bool isWriting = false;
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: width * .3,
        height: height * .9,
        color: Colors.blue[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: height * .25,
                width: width * .3,
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.rotate(
                      angle: -90 * pi / 180,
                      child: Text(
                        'Diamond'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/logo1.png',
                      width: width * .2,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          suffixIcon: isWriting == false
                              ? Icon(
                                  Icons.warning,
                                  color: Colors.red,
                                )
                              : null,
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                        style: TextStyle(fontSize: 23, color: Colors.indigo),
                        onChanged: (val) {
                          if (val.length == 0) {
                            setState(() {
                              isWriting = false;
                            });
                          } else {
                            setState(() {
                              isWriting = true;
                            });
                          }
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                                isPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.blue),
                            onPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                          ),
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                        style: TextStyle(fontSize: 23, color: Colors.indigo),
                        obscureText: isPassword ? false : true,
                      ),
                      SizedBox(
                        height: height * .04,
                      ),
                      Row(
                        children: [
                          Container(
                            height: height * .07,
                            width: width * .15,
                            decoration: BoxDecoration(
                              color: Colors.blue[500],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.login,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: height * .015,
                          ),
                          Container(
                            height: height * .05,
                            width: width * .15,
                            decoration: BoxDecoration(
                              color: Colors.blue[500],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Sign up',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * .05,
                  height: height * .1,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Container(
                  width: width * .23,
                  height: height * .1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * .15,
                  height: height * .1,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Container(
                  width: width * .14,
                  height: height * .1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: width * .25,
                    height: height * .07,
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  Container(
                    width: width * .10,
                    height: height * .07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaterStyleLogin extends StatefulWidget {
  @override
  _WaterStyleLoginState createState() => _WaterStyleLoginState();
}

class _WaterStyleLoginState extends State<WaterStyleLogin> {
  bool isWriting = false;

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ClipPath(
                clipper: ClipPathWaterStyle(),
                child: Container(
                  width: width * .3,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.blue[800],
                      Colors.blue[700].withOpacity(0.4)
                    ],
                  )),
                ),
              ),
            ),
            ClipPath(
              clipper: ClipPathWaterStyle(),
              child: Container(
                width: width * .3,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.center,
                    colors: [
                      Colors.blue[300].withOpacity(0.5),
                      Colors.blue[600],
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: width * .3,
                height: height * .6,
                decoration: BoxDecoration(
                  color: Colors.blue[200].withOpacity(.8),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(6, 6),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Aquarium'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[900]),
                        ),
                      ),
                      SizedBox(
                        height: height * .04,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.blue[900],
                          ),
                          labelText: 'Email',
                          suffixIcon: isWriting == false
                              ? Icon(
                                  Icons.warning_amber_outlined,
                                  color: Colors.red,
                                )
                              : null,
                          labelStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold),
                        ),
                        style: TextStyle(fontSize: 23, color: Colors.indigo),
                        onChanged: (val) {
                          if (val.length == 0) {
                            setState(() {
                              isWriting = false;
                            });
                          } else {
                            setState(() {
                              isWriting = true;
                            });
                          }
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue[900],
                          ),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                                isPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.blue[900]),
                            onPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                          ),
                          labelStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold),
                        ),
                        style: TextStyle(fontSize: 23, color: Colors.indigo),
                        obscureText: isPassword ? false : true,
                      ),
                      SizedBox(
                        height: height * .04,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          width: width * .15,
                          height: height * .1,
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  height: height * .04,
                                  width: width * .15,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 9,
                                          spreadRadius: 1,
                                          offset: Offset(7, 8),
                                        )
                                      ],
                                      color: Colors.blue[900],
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                child: Container(
                                  height: height * .08,
                                  width: height * .08,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo[800],
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 9,
                                        spreadRadius: 1,
                                        offset: Offset(7, 9),
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 28,
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white54,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: height * .015,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          width: width * .15,
                          height: height * .1,
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  height: height * .04,
                                  width: width * .15,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 9,
                                        spreadRadius: 1,
                                        offset: Offset(0, 6),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 8,
                                child: Container(
                                  height: height * .08,
                                  width: height * .08,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo[800],
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 9,
                                        spreadRadius: 1,
                                        offset: Offset(1, 9),
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.person_add,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 28,
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white54,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StreetStyle extends StatefulWidget {
  @override
  _StreetStyleState createState() => _StreetStyleState();
}

class _StreetStyleState extends State<StreetStyle> {
  bool isWriting = false;

  bool isPassword = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        child: Stack(children: [
          Image.asset(
            'assets/gralfiti.jpg',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: height * .15,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: width * .3,
                height: height * .5,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * .01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            labelText: 'Email',
                            suffixIcon: isWriting == false
                                ? Icon(
                                    Icons.warning_amber_outlined,
                                    color: Colors.red,
                                  )
                                : null,
                            labelStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          style: TextStyle(fontSize: 23, color: Colors.indigo),
                          onChanged: (val) {
                            if (val.length == 0) {
                              setState(() {
                                isWriting = false;
                              });
                            } else {
                              setState(() {
                                isWriting = true;
                              });
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                  isPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black),
                              onPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                            ),
                            labelStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          style: TextStyle(fontSize: 23, color: Colors.black),
                          obscureText: isPassword ? false : true,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          Transform.rotate(
                            angle: 25 * pi / 180,
                            child: Container(
                              height: height * .08,
                              width: width * .25,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Colors.blue[700],
                                    Colors.purple[600].withOpacity(.9),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Sign up',
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: ClipPathStreetStyle(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topRight,
                  colors: [
                    Colors.blue[700],
                    Colors.purple[600].withOpacity(.9),
                  ],
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: ClipPathStreetStyleSharp(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.lightBlue[800],
                    Colors.purple[600].withOpacity(.9),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: width * .18,
            top: height * .43,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  size: 40,
                  color: Colors.black,
                ),
                onPressed: () {
                  print('VHQ');
                }),
          ),
          Positioned(
            right: height * .02,
            top: height * .03,
            child: Text('It\'s Street Style',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          )
        ]),
      ),
    );
  }
}

class GreenTea extends StatefulWidget {
  @override
  _GreenTeaState createState() => _GreenTeaState();
}

class _GreenTeaState extends State<GreenTea> {
  bool isWriting = false;
  bool isChoose = false;
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.green[100],
      child: SafeArea(
        child: Stack(
          children: [
            isChoose == false
                ? Positioned(
                    top: -height * .15,
                    left: -width * .3,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      width: width * .9,
                      height: height * .55,
                      child: Center(
                        child: Transform.rotate(
                          angle: 7,
                          child: Text(
                            'Life Tea',
                            style: TextStyle(
                                color: Colors.green[700],
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    top: -height * .05,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isChoose = false;
                        });
                      },
                      child: Container(
                        width: height * .1,
                        height: height * .1,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              size: 30,
                              color: Colors.green[800],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            Positioned(
              bottom: isChoose == false ? height * .05 : null,
              top: isChoose ? height * .05 : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(110),
                              topRight: Radius.circular(15))),
                      width: width * .9,
                      height: height * .4,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextField(
                                onTap: () {
                                  setState(() {
                                    isChoose = true;
                                  });
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.green[800],
                                  ),
                                  labelText: 'Email',
                                  suffixIcon: isWriting == false
                                      ? Icon(
                                          Icons.warning_amber_outlined,
                                          color: Colors.red,
                                        )
                                      : null,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                  labelStyle: TextStyle(
                                      fontSize: 25,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                                style: TextStyle(
                                    fontSize: 23, color: Colors.indigo),
                                onChanged: (val) {
                                  if (val.length == 0) {
                                    setState(() {
                                      isWriting = false;
                                    });
                                  } else {
                                    setState(() {
                                      isWriting = true;
                                    });
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextField(
                                onTap: () {
                                  setState(() {
                                    isChoose = true;
                                  });
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.green[800],
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        isPassword
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.green[800]),
                                    onPressed: () {
                                      setState(() {
                                        isPassword = !isPassword;
                                      });
                                    },
                                  ),
                                  labelStyle: TextStyle(
                                      fontSize: 25,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                                style: TextStyle(
                                    fontSize: 23, color: Colors.indigo),
                                obscureText: isPassword ? false : true,
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(value: false, onChanged: (val) {}),
                                  Text(
                                    'Remenber Me',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 17),
                                  )
                                ],
                              )
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Container(
                      width: width * .9,
                      height: height * .1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            focusColor: Colors.transparent,
                            onPressed: () {},
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.green[800],
                              ),
                            ),
                          ),
                          FlatButton(
                            focusColor: Colors.transparent,
                            onPressed: () {},
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.green[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MetroSocial extends StatefulWidget {
  @override
  _MetroSocialState createState() => _MetroSocialState();
}

class _MetroSocialState extends State<MetroSocial> {
  bool isWriting = false;
  bool isPassword = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        child: Stack(children: [
          ClipPath(
            clipper: ClipPathMetroSocialBlock1(),
            child: Container(
              width: width,
              height: height,
              color: Colors.green[300],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: Image.asset(
                'assets/logo4.png',
                width: height / 2.5,
                height: height / 2.5,
              ),
            ),
          ),
          ClipPath(
            clipper: ClipPathMetroSocialBlock2(),
            child: Container(
              width: width,
              height: height,
              color: Colors.green,
            ),
          ),
          Positioned(
            right: 0,
            bottom: height * .25,
            child: Container(
              width: width * .3,
              height: height * .35,
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        suffixIcon: isWriting == false
                            ? Icon(
                                Icons.warning,
                                color: Colors.red,
                              )
                            : null,
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.green[900],
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.green[900],
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.green[900],
                          ),
                        ),
                      ),
                      cursorColor: Colors.green[900],
                      style: TextStyle(fontSize: 23, color: Colors.green[900]),
                      onChanged: (val) {
                        if (val.length == 0) {
                          setState(() {
                            isWriting = false;
                          });
                        } else {
                          setState(() {
                            isWriting = true;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    TextField(
                      cursorColor: Colors.green[900],
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                              isPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.green[900]),
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        ),
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.green[900],
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.green[900],
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.green[900],
                          ),
                        ),
                      ),
                      style: TextStyle(fontSize: 23, color: Colors.green[900]),
                      obscureText: isPassword ? false : true,
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white70, shape: BoxShape.circle),
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.green[900],
                                size: 30,
                              ),
                              onPressed: () {}),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: height * .05,
            child: Container(
              width: width * .1,
              height: height * .25,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_add,
                      size: 25,
                      color: Colors.green[900],
                    ),
                    Transform.rotate(
                        angle: -90 * pi / 180,
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                              color: Colors.green[900],
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: ClipPathMetroSocialBlock3(),
            child: Container(
              width: width,
              height: height,
              color: Colors.green[700],
            ),
          ),
        ]),
      ),
    );
  }
}
