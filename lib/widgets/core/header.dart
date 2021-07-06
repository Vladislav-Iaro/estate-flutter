import 'package:estate_social_app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final Function action;
  final bool main;
  Header({this.title, this.action, this.main = true});

  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      padding: EdgeInsets.only(top: 50, bottom: 15, left: 20),
      child: Row(
        children: [
          InkWell(
            onTap: action,
            child: Icon(
              main ? Icons.list : Icons.arrow_back_ios_outlined,
              color: white,
            ),
          ),
          Expanded(
            child: Center(
              child: whiteBoldText(title, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
