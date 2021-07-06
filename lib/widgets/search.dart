import 'package:estate_social_app/constant.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  SearchBox({this.searchAction, this.hint});
  final Function searchAction;
  final String hint;

  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  void search(String text) {
    if (widget.searchAction != null) widget.searchAction(text);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        color: black.withOpacity(.1),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 6),
              child: Icon(
                Icons.search,
                size: 18,
                color: black.withOpacity(0.4),
              ),
            ),
            Expanded(
              child: TextField(
                // controller: _controller,
                onChanged: (text) => search(text),
                decoration: InputDecoration(
                  hintText: widget.hint ?? "Search",
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(4),
                ),
                textAlignVertical: TextAlignVertical.top,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
