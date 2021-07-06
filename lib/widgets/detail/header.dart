import 'package:flutter/material.dart';
import 'package:estate_social_app/constant.dart';

class Header extends StatelessWidget {
  final Function onBack, onFav;
  final bool hideFav;
  Header({Key key, this.onBack, this.onFav, this.hideFav = true})
      : super(key: key);

  Widget backButton() => headerButton(
        tag: 'back',
        icon: Icons.arrow_back_ios_outlined,
        action: onBack,
      );

  Widget favButton() => headerButton(
        tag: 'fav',
        icon: Icons.favorite_border_outlined,
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
          backButton(),
          !hideFav ? favButton() : SizedBox(),
        ],
      ),
    );
  }
}
