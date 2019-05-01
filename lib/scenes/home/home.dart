import 'package:flutter/material.dart';
import 'package:imc_calculator/components/raised_gradient_button.dart';
import 'package:imc_calculator/components/text_input.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _weight = TextEditingController();
  final _height = TextEditingController();
  final _heightFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String _info = "Inform your personal informations!";

  void _resetFields() {
    FocusScope.of(context).requestFocus(FocusNode());
    _weight.text = "";
    _height.text = "";
    setState(() {
      _info = "Inform your personal informations!";
    });
  }

  void _calculate() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState.validate()) {
      double weight = double.parse(_weight.text);
      double height = double.parse(_height.text) / 100;
      double imc = weight / (height * height);
      setState(() {
        if (imc < 18.6) {
          _info = "Underweight  (${imc.toStringAsFixed(2)})";
        } else if (imc >= 18.6 && imc < 24.9) {
          _info = "Ideal weight (${imc.toStringAsFixed(2)})";
        } else if (imc >= 24.9 && imc < 29.9) {
          _info = "Slightly above weight (${imc.toStringAsFixed(2)})";
        } else if (imc >= 29.9 && imc < 34.9) {
          _info = "Class I obesity (${imc.toStringAsFixed(2)})";
        } else if (imc >= 34.9 && imc < 39.9) {
          _info = "Class II obesity (${imc.toStringAsFixed(2)})";
        } else if (imc >= 39.9) {
          _info = "Class III obesity (${imc.toStringAsFixed(2)})";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("IMC Calculator"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => _resetFields(),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 150.0,
                  color: Theme.of(context).primaryColor,
                ),
                TextInput(
                  onFieldSubmitted: (v) =>
                      FocusScope.of(context).requestFocus(_heightFocus),
                  textInputAction: TextInputAction.next,
                  labelText: "Weight (kg)",
                  validator: "Enter your height",
                  controller: _weight,
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextInput(
                  focusNode: _heightFocus,
                  textInputAction: TextInputAction.done,
                  controller: _height,
                  validator: "Enter your height",
                  labelText: "Height (cm)",
                ),
                SizedBox(
                  height: 16.0,
                ),
                RaisedGradientButton(
                  height: 48.0,
                  onPressed: () => _calculate(),
                  child: Text(
                    "Calculate",
                  ),
                  textSize: 20.0,
                  textColor: Colors.white,
                  gradient: LinearGradient(
                    colors: [
                      Colors.black54,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: 40.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  _info,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
