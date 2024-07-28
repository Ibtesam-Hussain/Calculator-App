import 'package:firstproject/SciCal/SciCalButtons.dart';
import 'package:firstproject/SciCal/noteForUser.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:google_fonts/google_fonts.dart';

class Scical extends StatefulWidget {
  @override
  _SciCal createState() => _SciCal();
}

class _SciCal extends State<Scical> {
  TextEditingController mycontroller = TextEditingController();
  String result = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          elevation: 30,
          shadowColor: Colors.black,
          content: const Text(
            "* This Sci Cal only accepts numeric Keypad typed numbers. So, enable  that if it's disabled.\nNormally type numbers and (+,-,/,*) operators. For advanced maths functions, use the buttons then put your values under brackets.",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 123, 81, 230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  shadowColor: Colors.black),
              child: const Text(
                'Accept',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ],
        ),
      );
    });
  }

  dynamic sciSolve() {
    String expression = mycontroller.text.toString();
    try {
      double evalResult = double.parse(expression.interpret().toString());
      result = evalResult.toStringAsFixed(4);
    } catch (e) {
      result = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sci Cal',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 156, 156, 156),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(142, 142, 142, 1),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(209, 209, 209, 1),
                          Color.fromRGBO(142, 142, 142, 1),
                        ]),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 17, left: 10, right: 10, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Scientific Calculator",
                        style: GoogleFonts.playfairDisplay(
                          textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(right: 50, top: 60, left: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: mycontroller,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Expression Field',
                          prefixIcon: const Icon(
                            Icons.calculate_outlined,
                            color: Colors.deepPurple,
                            size: 20,
                          ),
                          hintText: "Enter Expression",
                          hintStyle:
                              const TextStyle(fontStyle: FontStyle.italic),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: const BorderSide(
                                color: Colors.deepPurple, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 1),
                      Noteforuser(),
                      const SizedBox(height: 3),
                    ],
                  ),
                ),
              ],
            ),
            Scicalbuttons(mycontroller: mycontroller), //for all sciCal buttons
            const SizedBox(
              height: 2,
            ),
            ElevatedButton(
                onPressed: () {
                  sciSolve();
                  Result();
                },
                style: ElevatedButton.styleFrom(
                    elevation: 20,
                    shadowColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.5),
                            bottomRight: Radius.circular(10.5))),
                    backgroundColor: const Color.fromARGB(255, 123, 81, 230)),
                child: Text(
                  "Calculate",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                )),
          ],
        ),
      ),
    );
  }

  Future Result() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 20,
            shadowColor: Colors.black,
            content: Container(
              width: 100,
              height: 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Result : \n$result',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 123, 81, 230),
          );
        });
  }
}
