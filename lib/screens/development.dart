import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/widgets/core/page.dart';
import 'package:estate_social_app/widgets/search.dart';
import 'package:flutter/material.dart';

class DevelopmentScreen extends StatefulWidget {
  _DevelopmentScreenState createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  Widget _buildDevCard(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/detail'),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 6,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image(
                image: getAssetImage('development'),
                fit: BoxFit.cover,
              ),
            ),
            vSBox,
            paddingSmBox(child: mainText('Name of project', size: 14)),
            paddingSmBox(child: mainText('City, Location', size: 14)),
            paddingSmBox(child: mainText('Starting price AED', size: 14)),
            paddingSmBox(child: mainText('Starting size', size: 14)),
            vSBox,
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainPage(
      title: 'New Development',
      child: Container(
        child: Column(
          children: [
            paddingBox(child: SearchBox(hint: 'New off-plan project')),
            paddingHBox(child: _buildDevCard(context)),
          ],
        ),
      ),
    );
  }
}

class Profile {
  final String avatar;
  final String name;
  final String position;
  Profile({this.name, this.avatar, this.position});
}
