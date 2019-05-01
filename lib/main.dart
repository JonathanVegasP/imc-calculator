import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:imc_calculator/scenes/home/home.dart';

class ImcCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IMC Calculator",
      theme: ThemeData.dark(),
      home: Home(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (l, s) => l,
    );
  }
}

void main() => runApp(ImcCalculator());
//Created by Jonathan Vegas Peixoto