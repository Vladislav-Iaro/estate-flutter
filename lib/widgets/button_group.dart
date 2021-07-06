import 'package:estate_social_app/constant.dart';
import 'package:flutter/material.dart';

class ButtonGroup extends StatefulWidget {
  final List<String> items;
  final int selectedIndex;
  final Function selectHandler;
  ButtonGroup({this.items, this.selectedIndex, this.selectHandler});

  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  int selectedIndex = 0;

  List<Widget> buildButtons() {
    return List.generate(
      widget.items.length,
      (index) => Expanded(
        child: InkWell(
          onTap: () => widget.selectHandler(index),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: index == 0 ? transparent : grey,
                ),
                bottom: BorderSide(
                  color: index == widget.selectedIndex
                      ? primaryColor
                      : transparent,
                  width: 2.0,
                ),
              ),
            ),
            child: paddingVBox(
              child: index == widget.selectedIndex
                  ? Center(child: primaryText(widget.items[index], size: 16))
                  : Center(child: mainText(widget.items[index], size: 16)),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(color: grey)),
      child: Row(
        children: buildButtons(),
      ),
    );
  }
}
