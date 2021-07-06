import 'package:estate_social_app/constant.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final List<MenuItem> mainMenuItems = [
    MenuItem(icon: "bed", text: "Home", link: "/home"),
    MenuItem(icon: "bed", text: "Messages", link: "/chat"),
    MenuItem(icon: "bed", text: "Favorite", link: "/favorite"),
    MenuItem(icon: "bed", text: "Profile", link: "/profiles"),
    MenuItem(icon: "bed", text: "New Development", link: "/development"),
    MenuItem(icon: "bed", text: "My offers", link: "/offers"),
  ];

  final MenuItem settingItem =
      MenuItem(icon: "bed", text: "Settings", link: "/");

  Widget signMenu(context) => Container(
        width: getWindowWidth(context),
        height: getWindowHeight(context) * .2,
        padding: EdgeInsets.only(bottom: 20),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: primaryColor,
        ),
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed('/account/new'),
          child: Text(
            "Sign in / Sign up",
            style: TextStyle(color: white, fontSize: 20, letterSpacing: 1.4),
          ),
        ),
      );

  Widget buildMenuItem(context, MenuItem item) => InkWell(
        onTap: () => Navigator.of(context).pushNamed(item.link),
        child: paddingSmBox(
          child: Row(
            children: [
              imageIcon(icon: item.icon),
              hMdSBox,
              Text(item.text),
            ],
          ),
        ),
      );

  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: getWindowHeight(context),
        child: Column(
          children: [
            signMenu(context),
            vLgSBox,
            Column(
              children: List.generate(
                mainMenuItems.length,
                (index) => buildMenuItem(context, mainMenuItems[index]),
              ),
            ),
            Expanded(child: SizedBox()),
            buildMenuItem(context, settingItem),
            vLgSBox,
            vMdSBox
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String icon, text, link;
  MenuItem({this.icon, this.text, this.link});
}
