import 'dart:async';

import 'package:firstproject/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage(title: 'MyCal');
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 187, 175, 250),
              Color.fromARGB(255, 64, 45, 114)
            ],
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: SvgPicture.asset(
                'assets/images/CalPic.svg',
                alignment: Alignment.center,
                height: 100,
                width: 100,
              ),
            ),
            Text(
              "MyCal",
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                    color: Colors.blue.shade50,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        )),
      ),
    );
  }
}
