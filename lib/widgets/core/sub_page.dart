import 'package:estate_social_app/widgets/core/header.dart';
import 'package:flutter/material.dart';

class SubPage extends StatelessWidget {
  final String title;
  final Widget child;
  SubPage({this.title, this.child});

  void openMenu(context) => Scaffold.of(context).openDrawer();

  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: Builder(
        builder: (context) => Column(
          children: [
            Header(
              title: title,
              main: false,
              action: () => Navigator.of(context).pop(),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
