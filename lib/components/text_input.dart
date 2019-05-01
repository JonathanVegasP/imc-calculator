import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String validator;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final Function onFieldSubmitted;

  const TextInput({
    Key key,
    this.controller,
    this.labelText,
    this.validator,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        hintColor: Colors.black,
        primaryColor: Colors.teal,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(28.0)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        focusNode: focusNode,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: labelText,
          alignLabelWithHint: true,
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.teal,
          fontSize: 20.0,
        ),
        validator: (v) {
          if (v.trim().isEmpty) {
            return validator;
          }
        },
      ),
    );
  }
}
