import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/widgets/core/page.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List favorites;

  void initState() {
    super.initState();
    favorites = [1, 2, 3];
  }

  Widget _buildFavoriteItem(context, index) {
    var favoriteItem = favorites[index];

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
      title: 'Favorite',
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return _buildFavoriteItem(context, index);
        },
      ),
    );
  }
}
