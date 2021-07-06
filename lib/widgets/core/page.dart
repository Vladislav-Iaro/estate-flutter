import 'package:estate_social_app/widgets/core/header.dart';
import 'package:estate_social_app/widgets/core/menu.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final String title;
  final Widget child;
  MainPage({this.title, this.child});

  void openMenu(context) => Scaffold.of(context).openDrawer();

  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: Menu(),
      body: Builder(
        builder: (context) => Column(
          children: [
            Header(title: title, action: () => openMenu(context)),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
