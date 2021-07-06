import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/extensions/button.dart';
import 'package:estate_social_app/widgets/avatar.dart';
import 'package:estate_social_app/widgets/core/sub_page.dart';
import 'package:flutter/material.dart';

class CompanyDetailScreen extends StatefulWidget {
  _CompanyDetailScreenState createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> {
  List favorites;
  Profile profile;

  void initState() {
    super.initState();
    favorites = [1, 2, 3];
    profile =
        Profile(name: 'Khalil Ahmed', position: 'Position', avatar: 'avatar1');
  }

  Widget _buildFavoriteItem(context, index) {
    var favoriteItem = favorites[index];
    return paddingVBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
          children: [
            Row(
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Image(
                      image: AssetImage('assets/images/home.png'),
                    ),
                  ),
                ),
                hSBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        mainBoldText("1,000.00 AD", size: 16),
                      ],
                    ),
                    vXSBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.pin_drop_outlined,
                          color: Colors.black45,
                        ),
                        hSBox,
                        greyText('7744 Mill Pond, Damam St.')
                      ],
                    ),
                    vXSBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        imageIcon(icon: 'bed'),
                        hXSBox,
                        greyText('2'),
                        hMdSBox,
                        imageIcon(icon: 'bed'),
                        hXSBox,
                        greyText('3'),
                        hMdSBox,
                        imageIcon(icon: 'bed'),
                        hXSBox,
                        greyText('110m'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalItem() {
    return paddingSmBox(
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
    );
  }

  Widget _buildDescription() {
    return paddingSmBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainBoldText('Description', size: 16),
          vMdSBox,
          greyText(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
        ],
      ),
    );
  }

  Widget _buildContact() {
    return paddingBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: OutlineButtonExt.iconButton(
              text: 'Text',
              icon: Icons.sms_outlined,
              onPressed: () => {},
            ),
          ),
          hLgSBox,
          SizedBox(
            width: 100,
            child: OutlineButtonExt.iconButton(
              text: 'Call',
              icon: Icons.call,
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return SubPage(
      title: 'Company Details',
      child: paddingSmBox(
        child: Column(
          children: [
            _buildPersonalItem(),
            divider,
            _buildDescription(),
            divider,
            _buildContact(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return _buildFavoriteItem(context, index);
                },
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
