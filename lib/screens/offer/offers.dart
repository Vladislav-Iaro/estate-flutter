import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/widgets/button_group.dart';
import 'package:estate_social_app/widgets/core/page.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List currentOffers, pastOffers;
  bool isCurrent;
  int selectedTab;

  void initState() {
    super.initState();
    currentOffers = [1, 2, 3, 4];
    pastOffers = [1, 2];
    selectedTab = 0;
  }

  void selectHandler(index) {
    setState(() {
      selectedTab = index;
    });
  }

  Widget tabBar() {
    return ButtonGroup(
      items: [
        'Current Offers',
        'Past Offers',
      ],
      selectedIndex: selectedTab,
      selectHandler: selectHandler,
    );
  }

  Widget _buildOffersItem(context, index) {
    var offerItem = selectedTab == 0 ? currentOffers[index] : pastOffers[index];

    return paddingSmBox(
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

  Widget build(BuildContext context) {
    return MainPage(
      title: 'Offers',
      child: Stack(
        children: [
          Column(
            children: [
              paddingBox(
                child: tabBar(),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 0),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: selectedTab == 0
                      ? currentOffers.length
                      : pastOffers.length,
                  itemBuilder: (context, index) {
                    return _buildOffersItem(context, index);
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: SizedBox(
              width: 48,
              height: 48,
              child: FloatingActionButton(
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.add,
                  color: white,
                ),
                onPressed: () => Navigator.of(context).pushNamed('/offers/new'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
