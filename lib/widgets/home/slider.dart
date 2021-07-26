import 'package:carousel_slider/carousel_slider.dart';
import 'package:estate_social_app/constant.dart';
import 'package:flutter/material.dart';

class EstateSlider extends StatefulWidget {
  _EstateSliderState createState() => _EstateSliderState();
}

class _EstateSliderState extends State<EstateSlider> {
  int _currentIndex = 0;

  List<Widget> _buildItems() {
    return List.generate(
      3,
      (index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: _buildCard(index),
      ),
    );
  }

  Widget _buildCard(int index) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/detail'),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 24),
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
                Text(
                  index.toString(),
                  style: TextStyle(color: primaryColor, fontSize: 16),
                ),
                hSBox,
                Text(
                  'Appartment near you',
                  style: TextStyle(color: Colors.black45, fontSize: 16),
                ),
                exHSBox,
                Icon(Icons.favorite_border, color: primaryColor)
              ],
            ),
            vMdSBox,
            Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
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
                        Text("1,000.00 AD"),
                        hSBox,
                        Text('2'),
                        hSBox,
                        Text('3'),
                      ],
                    ),
                    vSBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.pin_drop_outlined,
                          color: Colors.black45,
                        ),
                        hSBox,
                        Text(
                          '7744 Mill Pond, Damam St.',
                          overflow: TextOverflow.fade,
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                    vSBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: yellow,
                        ),
                        hSBox,
                        Text('4.5'),
                        hSBox,
                        Text(
                          '( 164 reviews )',
                          style: TextStyle(color: Colors.black45),
                        ),
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
    final width = getWindowWidth(context) * .86;
    final height = 166;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: .86,
          enlargeCenterPage: true,
          aspectRatio: width / height,
          initialPage: _currentIndex,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        items: _buildItems(),
      ),
    );
  }
}
