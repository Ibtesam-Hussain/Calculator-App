import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMI extends StatefulWidget {
  @override
  _BMIPage createState() => _BMIPage();
}

class _BMIPage extends State<BMI> {
  final TextEditingController controller1 = TextEditingController(); //kg
  final TextEditingController controller2 = TextEditingController(); //feet
  final TextEditingController controller3 = TextEditingController(); //inches
  double bmi = 0;

  dynamic cal() {
    try {
      double heightInMeters = (int.parse(controller2.text) * 0.3048) +
          (int.parse(controller3.text) * 0.0254);

      bmi = int.parse(controller1.text) / (heightInMeters * heightInMeters);
      print(bmi.toStringAsFixed(4)); //to show on UI,
      if (bmi < 18.5) {
        return Container(
          child: Column(
            children: [
              Text(
                bmi.toStringAsFixed(4),
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Alert!! You're Under Weight",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        );
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        return Container(
          child: Column(
            children: [
              Text(
                bmi.toStringAsFixed(4),
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Congratulations You're Normal Weight",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        );
      } else if (bmi >= 25 && bmi <= 29.9) {
        return Container(
          child: Column(
            children: [
              Text(
                bmi.toStringAsFixed(4),
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Alert!! You're Over Weight",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        );
      } else {
        return Container(
          child: Column(
            children: [
              Text(
                bmi.toStringAsFixed(4),
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Consult a Doctor ASAP, You're Obese",
                style: GoogleFonts.openSans(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      Container(
        child: Text(
          'Error Handled, Error 404',
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
              textStyle: const TextStyle(color: Colors.red, fontSize: 14)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Cal',
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
                  height: 350,
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
                      top: 15, left: 10, right: 10, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Check Your BMI",
                          style: GoogleFonts.playfair(
                            textStyle: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  alignment: Alignment.bottomRight,
                  // color: Colors.pinkAccent,
                  margin: const EdgeInsets.only(top: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 50),
                              child: Column(
                                children: [
                                  Text(
                                    "Enter Weight",
                                    style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Text(
                                    "* In Kilograms",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5))),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: 130,
                                  child: TextField(
                                    controller: controller1,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.monitor_weight_outlined,
                                        color: Colors.deepPurple,
                                        size: 20,
                                      ),
                                      hintText: "Weight",
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
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 50),
                              child: Column(
                                children: [
                                  Text(
                                    "Enter Height",
                                    style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Text(
                                    "* In Feet",
                                    style: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5))),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      width: 130,
                                      child: TextField(
                                        controller: controller2,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.height_sharp,
                                            color: Colors.deepPurple,
                                            size: 20,
                                          ),
                                          hintText: "Feets",
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(17),
                                            borderSide: const BorderSide(
                                                color: Colors.deepPurple,
                                                width: 2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(17),
                                            borderSide: const BorderSide(
                                              color: Colors.black38,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, right: 10),
                                    child: Container(
                                      width: 130,
                                      child: TextField(
                                        controller: controller3,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.height_sharp,
                                            color: Colors.deepPurple,
                                            size: 20,
                                          ),
                                          hintText: "Inches",
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(17),
                                            borderSide: const BorderSide(
                                                color: Colors.deepPurple,
                                                width: 2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(17),
                                            borderSide: const BorderSide(
                                              color: Colors.black38,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      // print(controller1.text.isEmpty);
                      // print(controller2.text.isEmpty);
                      // print(controller3.text.isEmpty);

                      if ((controller1.text.isEmpty ||
                          controller2.text.isEmpty ||
                          controller3.text.isEmpty)) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Text(
                                  'Invalid Inputs, Try to Input Proper Values',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.black,
                              );
                            });
                      } else {
                        cal();
                        bmiResult();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 20,
                        shadowColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.5),
                                bottomRight: Radius.circular(10.5))),
                        backgroundColor:
                            const Color.fromARGB(255, 123, 81, 230)),
                    child: Text(
                      "Calculate BMI",
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: Colors.white70,
                              fontWeight: FontWeight.w600)),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: 10,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(21.0),
                    border: Border.all(width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //underWeight
                        height: 10,
                        width: 75,
                        color: const Color.fromRGBO(179, 140, 0, 1),
                      ),
                      Container(
                        //Normal
                        height: 10,
                        width: 75,
                        color: const Color.fromRGBO(12, 149, 0, 1),
                      ),
                      Container(
                        //overWeight
                        height: 10,
                        width: 75,
                        color: const Color.fromRGBO(176, 94, 0, 1),
                      ),
                      Container(
                        //overWeight
                        height: 10,
                        width: 70,
                        color: const Color.fromRGBO(180, 12, 0, 1),
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

  Future bmiResult() {
    var bckColor = Colors.white;
    print(bmi); //value
    if (bmi < 18.5) {
      bckColor = const Color.fromRGBO(179, 140, 0, 1);
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      bckColor = const Color.fromRGBO(12, 149, 0, 1);
    } else if (bmi >= 25 && bmi <= 29.9) {
      bckColor = const Color.fromRGBO(176, 94, 0, 1);
    } else {
      bckColor = const Color.fromRGBO(180, 12, 0, 1);
    }

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
                      'Your BMI is',
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    cal(),
                  ],
                ),
              ),
            ),
            backgroundColor: bckColor,
          );
        });
  }
}
