import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/widgets/detail/header.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
      height: getWindowHeight(context) * 0.6,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paddingBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AED 2,000,00",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  vSBox,
                  Text(
                    "Quick address of the prapely",
                    style: TextStyle(color: Colors.black26),
                  ),
                ],
              ),
            ),
            divider,
            paddingBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Type",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        vSBox,
                        Row(
                          children: [
                            imageIcon(icon: 'bed'),
                            hSBox,
                            Text('Rooms'),
                          ],
                        ),
                        vSBox,
                        Row(
                          children: [
                            imageIcon(icon: 'user'),
                            hSBox,
                            Text('Age'),
                          ],
                        ),
                        vSBox,
                        Row(
                          children: [
                            imageIcon(icon: 'home'),
                            hSBox,
                            Text('Maid Room'),
                          ],
                        ),
                        vSBox,
                        Row(
                          children: [
                            imageIcon(icon: 'yard'),
                            hSBox,
                            Text('Yard'),
                          ],
                        ),
                        vSBox,
                        Row(
                          children: [
                            imageIcon(icon: 'parking'),
                            hSBox,
                            Text('Parking'),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Purpose",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        vSBox,
                        Row(
                          children: [
                            imageIcon(icon: 'bath'),
                            hSBox,
                            Text('Baths'),
                          ],
                        ),
                        vSBox,
                        Row(
                          children: [
                            imageIcon(icon: 'street'),
                            hSBox,
                            Text('Street Size'),
                          ],
                        ),
                        vSBox,
                        Row(
                          children: [
                            imageIcon(icon: 'fire'),
                            hSBox,
                            Text('Fire Place'),
                          ],
                        ),
                        vSBox,
                        Row(
                          children: [
                            imageIcon(icon: 'basement'),
                            hSBox,
                            Text('Basement'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            vSBox,
            divider,
            paddingBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Features",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  vSBox,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            imageIcon(size: 40, icon: 'swimming'),
                            Text(
                              'Swimming',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      hSBox,
                      Expanded(
                        child: Column(
                          children: [
                            imageIcon(size: 40, icon: 'balcony'),
                            Text(
                              'Balcony',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      hSBox,
                      Expanded(
                        child: Column(
                          children: [
                            imageIcon(size: 40, icon: 'air-con'),
                            Text(
                              'Central AC',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      hSBox,
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '+8',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
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
                  Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  vSBox,
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                  ),
                ],
              ),
            ),
            divider,
            paddingBox(
              child: Row(
                children: [
                  imageIcon(
                    icon: 'offeree',
                    size: 40,
                  ),
                  hLgSBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name of offeree',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      vSBox,
                      Text(
                        'Relation to property',
                        style: TextStyle(color: Colors.black45),
                      ),
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

  Widget bottomButtons() {
    return Container(
      height: getWindowHeight(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    imageIcon(icon: "bed"),
                    vSBox,
                    Text('Report'),
                  ],
                ),
              ),
              hSBox,
              Expanded(
                child: Column(
                  children: [
                    imageIcon(icon: "bed"),
                    vSBox,
                    Text('Share'),
                  ],
                ),
              ),
              hSBox,
              Expanded(
                child: Column(
                  children: [
                    imageIcon(icon: "bed"),
                    vSBox,
                    Text('Contact'),
                  ],
                ),
              ),
              hSBox,
              Expanded(
                child: Column(
                  children: [
                    imageIcon(icon: "bed"),
                    vSBox,
                    Text('Favorite'),
                  ],
                ),
              ),
            ],
          ),
          vSBox
        ],
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
          ),
          Column(
            children: [
              SizedBox(height: getWindowWidth(context) * .45),
              _buildCarouselBullets(),
              vSBox,
              _buildProperties(),
            ],
          ),
          bottomButtons()
        ],
      ),
    );
  }
}
