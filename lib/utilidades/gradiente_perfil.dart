import 'package:flutter/material.dart';

class GradientBackProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [
          //Del tomo màs claro al màs oscuro
          Color(0xFF4F53CD),
          Color(0xFF4750BF),
          Color(0xFF4C5DC8)
        ],
        radius: 4.9,
        stops: [0.2, 0.1, 0.25],
        center: Alignment(1.5, 0.9),
      )),
    );
  }
}
