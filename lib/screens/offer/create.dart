import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/extensions/button.dart';
import 'package:estate_social_app/widgets/core/page.dart';
import 'package:flutter/material.dart';

class CreateOfferScreen extends StatefulWidget {
  _CreateOfferScreenState createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  void typeChanged(value) {}

  void purposeChanged(value) {}

  List restButtons = ['Amenty Park', 'Amenty', 'Amenty Park', 'Amenty'];

  Widget _buildSelectors() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Dropdown.builder(
                  hint: 'Type',
                  items: ["type1", "type2", "type3"],
                  onChanged: typeChanged),
            ),
            hMdSBox,
            Expanded(
              child: Dropdown.builder(
                hint: 'Purpose',
                items: ["type1", "type2", "type3"],
              ),
            ),
          ],
        ),
        vMdSBox,
        Row(
          children: [
            Expanded(
              child: TextFieldExt.builder(
                  hint: 'Space', onChanged: typeChanged, suffix: '㎡'),
            ),
            hMdSBox,
            Expanded(
              child: Dropdown.builder(
                hint: 'Rooms',
                items: ["type1", "type2", "type3"],
              ),
            ),
          ],
        ),
        vMdSBox,
        Row(
          children: [
            Expanded(
              child: Dropdown.builder(
                  hint: 'Baths',
                  items: ["type1", "type2", "type3"],
                  onChanged: typeChanged),
            ),
            hMdSBox,
            Expanded(
              child: Dropdown.builder(
                hint: 'Age',
                items: ["type1", "type2", "type3"],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget restBuilder() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: restButtons.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 20),
          child: OutlineButtonExt.iconButton(
            text: restButtons[index],
            icon: Icons.sms_outlined,
            onPressed: () => {},
          ),
        );
      },
    );
  }

  Widget btnViewMore() {
    return Center(
      child: InkWell(
        onTap: () => {},
        child: Row(
          children: [
            greyText('View more', size: 16),
            hSBox,
            Icon(
              Icons.keyboard_arrow_down,
              color: black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearByWidget() {
    return paddingBox(
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
    );
  }

  Widget _buildDescriptionWidget() {
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
      child: paddingSmBox(
        child: TextField(
          maxLines: 4,
          decoration: InputDecoration.collapsed(hintText: "Description"),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MainPage(
      title: 'Create a new offer',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paddingBox(
              child: Center(
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: FloatingActionButton(
                    backgroundColor: white,
                    onPressed: () => {},
                    child: Icon(Icons.camera_alt_rounded, color: grey),
                  ),
                ),
              ),
            ),
            paddingHBox(
              child: _buildSelectors(),
            ),
            divider,
            _buildNearByWidget(),
            divider,
            paddingBox(
              child: _buildDescriptionWidget(),
            ),
            paddingBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mainBoldText('Ways to rest', size: 16),
                  vSBox,
                  Container(
                    height: 90,
                    child: restBuilder(),
                  ),
                  vSBox,
                  // btnViewMore(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
