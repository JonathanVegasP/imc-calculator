import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _weight = TextEditingController();
  final _height = TextEditingController();
  String _info = "Inform your personal informations!";

  void _resetFields() {
    setState(() {
      _weight.text = "";
      _height.text = "";
      _info = "Inform your personal informations!";
    });
  }

  void _calculate(){
    setState(() {
      double weight = double.parse(_weight.text);
      double height = double.parse(_height.text)/100;
      double imc = weight / (height * height);
      if(imc < 18.6){
        _info = "Underweight  (${imc.toStringAsFixed(2)})";
      } else if(imc >= 18.6 && imc < 24.9){
        _info = "Ideal weight (${imc.toStringAsFixed(2)})";
      }else if(imc >= 24.9 && imc < 29.9){
        _info = "Slightly above weight (${imc.toStringAsFixed(2)})";
      } else if(imc >= 29.9 && imc < 34.9){
        _info = "Class I obesity (${imc.toStringAsFixed(2)})";
      } else if(imc >= 34.9 && imc < 39.9){
        _info = "Class II obesity (${imc.toStringAsFixed(2)})";
      }else if(imc >= 39.9){
        _info = "Class III obesity (${imc.toStringAsFixed(2)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person,
              size: 150.0,
              color: Theme.of(context).primaryColor,
            ),
            Theme(
              data: ThemeData(
                hintColor: Colors.black,
                primaryColor: Colors.teal,
              ),
              child: TextField(
                controller: _weight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Weight (kg)",
                  alignLabelWithHint: true,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20.0,
                ),
              ),
            ),
            Theme(
              data: ThemeData(
                hintColor: Colors.black,
                primaryColor: Colors.teal,
              ),
              child: TextField(
                controller: _height,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Height (cm)",
                  alignLabelWithHint: true,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
              onPressed: () => _calculate(),
              child: Text(
                "Calculate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              color: Colors.black,
              padding: EdgeInsets.all(12.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              _info,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
