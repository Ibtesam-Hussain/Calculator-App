import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Scicalbuttons extends StatefulWidget {
  final TextEditingController mycontroller;
  Scicalbuttons({required this.mycontroller});

  @override
  _sciCalbuttons createState() => _sciCalbuttons();
}

class _sciCalbuttons extends State<Scicalbuttons> {
  void insertText(String text) {
    // Get the current text in the TextField
    String currentText = widget.mycontroller.text;

    // Get the cursor position
    int cursorPosition = widget.mycontroller.selection.baseOffset;

    // Insert the text at the cursor position
    String newText = currentText.substring(0, cursorPosition) +
        text +
        currentText.substring(cursorPosition);

    // Set the new text in the TextField
    widget.mycontroller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorPosition + text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          border: Border.all(width: 1),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              _buildButtonRow(["sin()", "cos()", "tan()"]),
              _buildButtonRow(["π", "abs()", "floor()"]),
              _buildButtonRow(["round()", "sqrt()", "ceil()"]),
              _buildButtonRow(["n!", "Ln", "Log()"]),
              _buildButtonRow(["asin()", "acos()", "atan()"]),
              _buildButtonRow(["sinh()", "cosh()", "tanh()"]),
              _buildButtonRow(["nrt(index,val)", "pow(x,y)"]),
            ],
          ),
        ));
  }

  Widget _buildButtonRow(List<String> buttonLabels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttonLabels.map((label) {
        return Expanded(
          child: ElevatedButton(
            onPressed: () {
              insertText(_getFunctionForLabel(label));
            },
            style: ElevatedButton.styleFrom(
              elevation: 20,
              shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.5),
                  bottomRight: Radius.circular(10.5),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 123, 81, 230),
            ),
            child: Text(
              label,
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _getFunctionForLabel(String label) {
    switch (label) {
      case "π":
        return "pi";
      case "Ln":
        return "ln()";
      case "Log()":
        return "log()";
      case "n!":
        return "fact()";
      case "nrt(index,val)":
        return "nrt()";
      case "pow(x,y)":
        return "pow()";
      default:
        return label;
    }
  }
}
