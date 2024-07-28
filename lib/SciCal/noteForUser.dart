import 'package:flutter/material.dart';

class Noteforuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        "* Your Normal expression : (x^3 + 3x^2 - 5) / (sin(pi/2))(4x - 2!). Your Typed expression should like : [pow(x, 3) + 3 * pow(x,2) - 5] / [(sin(pi/2)) * (4x - fact(2))]. Mention x,y,z values also. Thanks",
        style: TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
