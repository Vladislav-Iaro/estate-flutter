import 'package:estate_social_app/constant.dart';
import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  ColorDot({
    Key key,
    this.size,
    this.color,
    this.child,
  }) : super(key: key);

  final double size;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: this.child ?? SizedBox(),
    );
  }
}

class ColorDotWhiteBorder extends StatelessWidget {
  ColorDotWhiteBorder({
    Key key,
    this.size,
    this.color,
    this.borderWidth,
    this.child,
  }) : super(key: key);

  final double size, borderWidth;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: white,
          border: Border.all(color: white, width: borderWidth ?? 2)),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: this.child ?? SizedBox(),
      ),
    );
  }
}
