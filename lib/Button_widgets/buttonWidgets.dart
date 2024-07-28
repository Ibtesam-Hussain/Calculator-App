import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttonwidgets extends StatelessWidget {
  final String numb;
  final Function? callback;

  Buttonwidgets({Key? key, required this.numb, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 70,
      height: 70,
      child: TextButton(
        onPressed: () {
          print("Button was tapped");
          callback!(numb);
        },
        child: Text(
          numb,
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w300, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
