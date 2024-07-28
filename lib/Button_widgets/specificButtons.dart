import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Specificbuttons extends StatefulWidget {
  final String equalsto;
  final Function? callback;
  Specificbuttons({required this.equalsto, this.callback});
  @override
  _ImportantButtons createState() {
    return _ImportantButtons();
  }
}

class _ImportantButtons extends State<Specificbuttons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 70,
      height: 70,
      child: ElevatedButton(
          onPressed: () {
            print("Button was tapped");
            widget.callback!(widget.equalsto);
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.5)),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 20,
              shadowColor: Colors.black),
          child: Center(
            child: Text(
              widget.equalsto,
              style: GoogleFonts.openSans(
                textStyle:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
          )),
    );
  }
}
