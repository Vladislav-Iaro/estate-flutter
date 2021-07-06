import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/models/estate.dart';
import 'package:estate_social_app/widgets/badge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapMarker extends StatelessWidget {
  final Estate estate;
  final bool selected;
  MapMarker({this.estate, this.selected = false});

  Widget _buildActive() {
    return Container(
      width: 140,
      height: 140,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: primaryColor),
        color: primaryColor.withAlpha(44),
      ),
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: primaryColor),
          color: primaryColor.withAlpha(66),
        ),
        child: Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor),
            color: primaryColor.withAlpha(66),
          ),
        ),
      ),
    );
  }

  Widget _buildNormal() {
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: white,
            ),
            width: 70,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              child: Image(
                image: getAssetImage(estate.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Badge(
            size: 24,
            color: white,
            value: estate.count,
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return selected ? _buildActive() : _buildNormal();
  }
}
