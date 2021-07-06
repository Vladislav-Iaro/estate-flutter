import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF31A6E2);
const Color transparent = Colors.transparent;
const Color black = Color(0xFF364041);
const Color white = Colors.white;
const Color grey = Color(0xFFBCBCBC);
const Color darkGrey = Color(0xFF8F9BB3);
const Color green = Color(0xFF169E48);
const Color yellow = Color(0xFFFFBF00);

const hXSBox = SizedBox(width: 6);
const hSBox = SizedBox(width: 10);
const hMdSBox = SizedBox(width: 20);
const hLgSBox = SizedBox(width: 40);

const vXSBox = SizedBox(height: 6);
const vSBox = SizedBox(height: 10);
const vMdSBox = SizedBox(height: 20);
const vLgSBox = SizedBox(height: 40);

const exHSBox = Expanded(child: SizedBox());
const divider = Divider(color: Colors.black26, height: 3.0);

Widget paddingBox({child}) =>
    Padding(padding: EdgeInsets.all(20), child: child);

Widget paddingSmBox({child}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: child,
    );

Widget paddingVBox({child}) => Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: child,
    );

Widget paddingHBox({child}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: child,
    );

Widget paddingSmHBox({child}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: child,
    );

double getWindowWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getWindowHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Text whiteText(text, {double size, bold}) =>
    _text(text, color: white, size: size, bold: bold);

Text whiteBoldText(text, {double size}) =>
    boldText(text, color: white, size: size);

Text mainText(text, {double size, bold}) =>
    _text(text, color: black, size: size, bold: bold);

Text mainBoldText(text, {double size}) =>
    boldText(text, color: black, size: size);

Text greyText(text, {double size, bold}) =>
    _text(text, color: grey, size: size, bold: bold);

Text greyBoldText(text, {double size}) =>
    boldText(text, color: grey, size: size);

Text darkGreyText(text, {double size, bold}) =>
    _text(text, color: darkGrey, size: size, bold: bold);

Text darkGreyBoldText(text, {double size}) =>
    boldText(text, color: darkGrey, size: size);

Text primaryText(text, {double size, bold}) =>
    _text(text, size: size, color: primaryColor, bold: bold);

Text primaryBoldText(text, {double size}) =>
    boldText(text, size: size, color: primaryColor);

Text boldText(text, {double size, color}) =>
    _text(text, size: size, color: color, bold: true);

Text _text(
  text, {
  double size,
  color,
  bool bold,
}) =>
    Text(
      text,
      style: TextStyle(
        color: color ?? black,
        fontSize: size ?? 12.0,
        fontWeight: bold != null && bold ? FontWeight.bold : FontWeight.normal,
      ),
      overflow: TextOverflow.clip,
    );

Widget imageIcon({icon, double size = 30.0}) => SizedBox(
      width: size,
      height: size,
      child: Image(
        image: AssetImage("assets/icons/$icon.png"),
        fit: BoxFit.contain,
      ),
    );

Widget headerButton({
  tag,
  icon,
  action,
}) =>
    SizedBox(
      width: 40,
      height: 40,
      child: FloatingActionButton(
        heroTag: tag,
        backgroundColor: white,
        child: Icon(
          icon,
          color: primaryColor,
          size: 20,
        ),
        elevation: 0.1,
        onPressed: action,
      ),
    );

String getAvatarName(name) {
  List<String> names = name.split(" ");
  String initials = "";

  for (var i = 0; i < names.length; i++) {
    if (names[i][0] == names[i][0].toUpperCase()) initials += '${names[i][0]}';
  }
  if (initials.length < 2) return initials;
  return initials.substring(0, 2);
}

AssetImage getIcon(String image) {
  return AssetImage('assets/icons/$image.png');
}

AssetImage getAssetImage(String image) {
  return AssetImage('assets/images/$image.png');
}

Iterable<E> mapIndexed<E, T>(
    Iterable<T> items, E Function(int index, T item) f) sync* {
  var index = 0;

  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}
