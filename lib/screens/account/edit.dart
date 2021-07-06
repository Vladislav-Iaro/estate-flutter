import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/screens/development.dart';
import 'package:estate_social_app/widgets/avatar.dart';
import 'package:estate_social_app/widgets/core/page.dart';
import 'package:flutter/material.dart';

class EditAccountScreen extends StatefulWidget {
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  Profile profile;
  List currentOffers;

  void initState() {
    super.initState();
    currentOffers = [1, 2, 3];
    profile =
        Profile(name: 'Khalil Ahmed', position: 'Position', avatar: 'avatar1');
  }

  Widget _buildPersonalItem() {
    return Row(
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
    );
  }

  Widget _buildDescriptionWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 6,
          )
        ],
        color: white,
      ),
      child: paddingSmBox(
        child: TextField(
          maxLines: 4,
          decoration: InputDecoration.collapsed(
            hintText: "Description",
            hintStyle: TextStyle(color: darkGrey),
          ),
        ),
      ),
    );
  }

  Widget _buildOffersItem(context, index) {
    var offerItem = currentOffers[index];

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/offers/plan'),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
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
                        mainText(" 1,000.00 AD", size: 16),
                      ],
                    ),
                    vXSBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: yellow,
                        ),
                        hSBox,
                        mainText('4.5'),
                        hSBox,
                        greyText('( 164 reviews )'),
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

  Widget build(BuildContext context) {
    return MainPage(
      title: 'Offers',
      child: SingleChildScrollView(
        child: paddingBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPersonalItem(),
              vSBox,
              divider,
              vSBox,
              _buildDescriptionWidget(),
              vMdSBox,
              mainBoldText('New offers', size: 18),
              vSBox,
              Column(
                children: List.generate(
                  currentOffers.length,
                  (index) => _buildOffersItem(context, index),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
