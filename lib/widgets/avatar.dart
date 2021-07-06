import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/widgets/color_dot.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({Key key, this.image, this.size}) : super(key: key);
  final String image;
  final double size;

  Widget build(BuildContext context) {
    return Container(
      height: size ?? 60,
      width: size ?? 60,
      decoration: BoxDecoration(
        color: black,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: getAssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TextAvatar extends StatelessWidget {
  TextAvatar({Key key, this.color, this.name, this.size, this.active})
      : super(key: key);
  final String name;
  final double size;
  final Color color;
  final bool active;

  Widget build(BuildContext context) {
    var avImg = this.name.length == 1 ? this.name : getAvatarName(this.name);
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? Colors.amber,
        shape: BoxShape.circle,
      ),
      child: whiteBoldText(avImg, size: 24),
    );
  }
}

class ChatAvatar extends StatelessWidget {
  ChatAvatar({Key key, this.size, this.image, this.name, this.online = false})
      : super(key: key);
  final String image, name;
  final double size;
  final bool online;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            this.image != null
                ? Avatar(size: size ?? 60, image: image)
                : TextAvatar(color: primaryColor, size: 60, name: name),
            ColorDotWhiteBorder(color: online ? green : grey, size: 16)
          ],
        ),
        SizedBox(height: 4),
      ],
    );
  }
}
