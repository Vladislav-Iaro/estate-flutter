import 'package:estate_social_app/constant.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final double size;
  final Color color;
  final int value;
  Badge({this.size = 18, this.color, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size ?? 18,
      height: this.size ?? 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: this.color),
      child: mainText(value.toString(), size: size * 2 / 3, bold: true),
    );
  }
}
