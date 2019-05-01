import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC Calculator"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
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
        ],
      ),
    );
  }
}
