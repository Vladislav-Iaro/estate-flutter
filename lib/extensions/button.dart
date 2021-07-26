import 'package:flutter/material.dart';
import 'package:estate_social_app/constant.dart';

extension ButtonExtension on ElevatedButton {
  static ElevatedButton builder({onPressed, text, active = false, size}) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: active ? primaryColor : Colors.white, // background
          onPrimary: active ? Colors.white : Colors.black87,
          side: BorderSide(color: active ? Colors.transparent : Colors.black12),
          textStyle: TextStyle(fontSize: size ?? 16, letterSpacing: 1.2),
          // elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(text),
        ),
      );
}

extension OutlineButtonExt on OutlinedButton {
  static OutlinedButton builder({onPressed, text, size}) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black12),
          textStyle: TextStyle(fontSize: size ?? 16, letterSpacing: 1.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(text),
        ),
      );

  static OutlinedButton iconButton({onPressed, text, icon}) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Icon(icon, color: primaryColor),
              vSBox,
              Text(
                text,
                style: TextStyle(
                  color: black,
                  fontSize: 16,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      );

  static OutlinedButton imageButton({onPressed, image}) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Image(
                  width: 40,
                  height: 40,
                  image: getIcon(image),
                  fit: BoxFit.cover)
            ],
          ),
        ),
      );
}

extension Dropdown on DropdownButton {
  static Widget builder({hint, items, onChanged}) {
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
      child: paddingSmHBox(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: darkGreyText(hint, size: 14),
            icon: Icon(Icons.keyboard_arrow_down_outlined, color: black),
            iconSize: 28,
            onChanged: onChanged,
            items: List.generate(
              items.length,
              (index) => DropdownMenuItem(
                value: items[index],
                child: mainText(
                  items[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension TextFieldExt on TextField {
  static Widget builder({hint, onChanged, suffix}) {
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
      child: paddingSmHBox(
        child: TextField(
          // controller: _controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: darkGrey),
            suffix: suffix != null ? mainText(suffix, size: 16) : null,
            isDense: false,
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(4),
          ),
          textAlignVertical: TextAlignVertical.top,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
