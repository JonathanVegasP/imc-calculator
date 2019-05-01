import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Gradient gradient;
  final double elevation;
  final Color textColor;
  final double textSize;
  final Widget child;
  final Function onPressed;

  const RaisedGradientButton(
      {Key key,
      @required this.gradient,
      @required this.child,
      this.height = 40.0,
      this.width = double.infinity,
      this.textSize = 16.0,
      this.textColor = Colors.black,
      this.elevation = 2.0,
      this.borderRadius = 0.0,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[700],
            offset: Offset(0.0, elevation),
            blurRadius: elevation,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        type: MaterialType.button,
        textStyle: TextStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: FontWeight.w500,
        ),
        child: InkWell(
          child: Center(
            child: child,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
        ),
      ),
    );
  }
}
