import 'package:firstproject/BMI/BMI.dart';
import 'package:firstproject/Dropdown/CustomPageRoute.dart';
import 'package:firstproject/SciCal/SciCal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Dropdown extends StatefulWidget {
  String dropdownvalue = '';

  Dropdown({super.key});
  @override
  DropdownUI createState() => DropdownUI();
}

class DropdownUI extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: DropdownButton(
          icon: const Icon(
            Icons.more_horiz,
            size: 30,
            color: Colors.black,
          ),
          dropdownColor: Colors.white70,
          items: [
            DropdownMenuItem(
                alignment: Alignment.center,
                value: 'BMI',
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, Custompageroute(child: BMI()));
                    },
                    child: Text(
                      'BMI',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ))),
            DropdownMenuItem(
                alignment: Alignment.center,
                value: 'Sci Cal',
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, Custompageroute(child: Scical()));
                    },
                    child: Text(
                      'Sci Cal',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ))),
            DropdownMenuItem(
                alignment: Alignment.center,
                value: 'About Dev',
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            surfaceTintColor:
                                const Color.fromARGB(255, 227, 225, 239),
                            elevation: 20,
                            shadowColor: Colors.black,
                            content: Container(
                              width: 150,
                              height: 250,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/images.jpeg"),
                                      radius: 60,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Ibtesam Hussain',
                                      style: GoogleFonts.playfairDisplay(
                                          textStyle: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 250,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 76, 59, 158),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Icon(
                                              Icons.email_outlined,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'ibtesamh786@gmail.com',
                                            style: GoogleFonts.openSans(
                                                textStyle: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      width: 250,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 76, 59, 158),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 7),
                                            child: SvgPicture.asset(
                                              'assets/images/github.svg',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'https://github.com/Ibtesam-Hussain',
                                            style: GoogleFonts.openSans(
                                                textStyle: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 125, 111, 195),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 123, 81, 230),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    shadowColor: Colors.black),
                                child: const Text(
                                  'GOT IT',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  style: TextButton.styleFrom(shadowColor: Colors.black),
                  child: Text(
                    'About Dev',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ),
                )),
          ],
          borderRadius: BorderRadius.circular(20.0),
          onChanged: (String? newValue) {
            setState(() {
              widget.dropdownvalue = newValue!;
            });
          }),
    );
  }
}
