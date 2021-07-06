import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/widgets/detail/header.dart';
import 'package:flutter/material.dart';

class OfferPlanScreen extends StatefulWidget {
  _OfferPlanScreenState createState() => _OfferPlanScreenState();
}

class _OfferPlanScreenState extends State<OfferPlanScreen> {
  void onBack() => Navigator.of(context).pop();
  void onFav() => {};
  int _currentImageIndex = 0;
  List<String> images = ["home1", "home2", "home3"];

  List<Widget> _buildImages() {
    return List.generate(
      images.length,
      (index) => Image(
        image: AssetImage("assets/images/${images[index]}.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildImageSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        aspectRatio: 1.517,
        enlargeCenterPage: true,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (index, reason) {
          setState(() {
            _currentImageIndex = index;
          });
        },
      ),
      items: _buildImages(),
    );
  }

  Widget _buildCarouselBullets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        images.length,
        (index) => Container(
          width: index == _currentImageIndex ? 16.0 : 10.0,
          height: index == _currentImageIndex ? 16.0 : 10.0,
          margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: white,
          ),
        ),
      ),
    );
  }

  Widget _buildProperties() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: getWindowHeight(context) * 0.68,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paddingBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mainBoldText("New Development Name", size: 16),
                  vSBox,
                  greyText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    size: 14,
                  ),
                ],
              ),
            ),
            divider,
            paddingBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mainBoldText("Overview", size: 16),
                  vMdSBox,
                  greyText('Starting price'),
                  vMdSBox,
                  greyText('Price per staff form'),
                  vMdSBox,
                  greyText('Area start from '),
                  vMdSBox,
                  greyText('Type'),
                  vMdSBox,
                  greyText('Bedrooms'),
                  vMdSBox,
                  greyText('Est. completion')
                ],
              ),
            ),
            vSBox,
            divider,
            paddingBox(
              child: Row(
                children: [
                  Icon(
                    Icons.pin_drop,
                    color: primaryColor,
                  ),
                  hLgSBox,
                  Text(
                    'Location & Services nearby',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            divider,
            paddingBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mainBoldText('Extendable map', size: 16),
                  vSBox,
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                  ),
                ],
              ),
            ),
            divider,
            paddingBox(
              child: Column(
                children: [
                  mainBoldText('Viewing house', size: 16),
                  vSBox,
                  Row(
                    children: [
                      greyText('Saturday - Sunday'),
                      exHSBox,
                      greyText('10.00 am - 11.50 pm'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          _buildImageSlider(),
          Header(
            onBack: onBack,
            onFav: onFav,
            hideFav: true,
          ),
          Column(
            children: [
              SizedBox(height: getWindowWidth(context) * .5),
              _buildCarouselBullets(),
              vSBox,
              _buildProperties(),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 60),
            child: Text(
              'Off-Plan',
              style: TextStyle(
                  color: black, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
