import 'package:estate_social_app/widgets/home/filter.dart';
import 'package:estate_social_app/widgets/home/header.dart';
import 'package:estate_social_app/widgets/home/map.dart';
import 'package:estate_social_app/widgets/home/slider.dart';
import 'package:estate_social_app/widgets/core/menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool navigateMode = false;
  int selectedIndex = -1;

  void initState() {
    super.initState();
  }

  void setFilterMode() => setState(() {
        navigateMode = false;
      });

  void setNavMode() => setState(() {
        navigateMode = true;
      });

  void openMenu(context) => Scaffold.of(context).openDrawer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: Menu(),
      body: Builder(
        builder: (context) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            EstateMap(markerTap: setNavMode),
            Header(
              onBack: setFilterMode,
              onMenu: () => openMenu(context),
              navMode: navigateMode,
            ),
            navigateMode ? EstateSlider() : EstateFilter(),
          ],
        ),
      ),
    );
  }
}
