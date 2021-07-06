import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/widgets/avatar.dart';
import 'package:estate_social_app/widgets/core/page.dart';
import 'package:estate_social_app/widgets/search.dart';
import 'package:flutter/material.dart';

class ProfilesScreen extends StatefulWidget {
  _ProfilesScreenState createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  List<Profile> profiles = [
    Profile(name: 'Khalil Ahmed', position: 'Position', avatar: 'avatar1'),
    Profile(name: 'Khalil Ahmed', position: 'Position', avatar: 'avatar1'),
    Profile(name: 'Khalil Ahmed', position: 'Position', avatar: 'avatar1'),
    Profile(name: 'Khalil Ahmed', position: 'Position', avatar: 'avatar1'),
  ];

  Widget _buildProfileItem(context, index) {
    var profile = profiles[index];
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/profiles/company'),
      child: paddingSmBox(
        child: Row(
          children: [
            Avatar(
              image: profile.avatar,
              size: 68,
            ),
            hMdSBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                boldText(profile.name, size: 16),
                vSBox,
                greyText(profile.position)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainPage(
      title: 'Profiles',
      child: Container(
        child: Column(
          children: [
            paddingBox(child: SearchBox()),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 0, right: 20),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  return _buildProfileItem(context, index);
                },
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: divider,
                ),
              ),
            ),
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
