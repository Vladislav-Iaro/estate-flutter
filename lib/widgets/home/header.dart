import 'package:flutter/material.dart';

import 'package:estate_social_app/constant.dart';

class Header extends StatefulWidget {
  final Function onBack, onMenu;
  final bool navMode;
  Header({Key key, this.onBack, this.onMenu, this.navMode}) : super(key: key);
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Widget menuButton() => headerButton(
        tag: 'menu',
        icon: Icons.list,
        action: widget.onMenu,
      );

  Widget backButton() => headerButton(
        tag: 'back',
        icon: Icons.arrow_back_ios_outlined,
        action: widget.onBack,
      );

  Widget filterModeButton() => headerButton(
        tag: 'filter',
        icon: Icons.filter_list_alt,
        action: () => {},
      );

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      height: getWindowHeight(context),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.navMode ? backButton() : menuButton(),
          widget.navMode ? filterModeButton() : SizedBox()
        ],
      ),
    );
  }
}
