import 'package:flutter/material.dart';
import 'package:imc_calculator/scenes/home/home.dart';

class ImcCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IMC Calculator",
      color: Colors.green,
      home: Home(),
    );
  }
}

void main() => runApp(ImcCalculator());