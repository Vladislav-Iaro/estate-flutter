import 'package:estate_social_app/constant.dart';
import 'package:estate_social_app/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:estate_social_app/extensions/button.dart';

class EstateFilter extends StatefulWidget {
  _EstateFilterState createState() => _EstateFilterState();
}

class _EstateFilterState extends State<EstateFilter> {
  bool isCommercial = false;
  bool isBuy;
  BuildingType buildingType = BuildingType.none;
  RentFrequency rentFrequency = RentFrequency.none;
  RangeValues _priceRangeValues = const RangeValues(2200, 10000);
  RangeValues _spaceRangeValues = const RangeValues(300, 1000);
  Bedrooms rooms = Bedrooms.none;
  bool minimized = true;

  void initState() {
    super.initState();
  }

  ElevatedButton residentialButton() => ButtonExtension.builder(
        active: !isCommercial,
        onPressed: () => setState(() {
          isCommercial = false;
        }),
        text: "Residential",
      );

  ElevatedButton commercialButton() => ButtonExtension.builder(
        active: isCommercial,
        onPressed: () => setState(() {
          isCommercial = true;
        }),
        text: "Commercial",
      );

  ElevatedButton buyButton() => ButtonExtension.builder(
        active: isBuy != null && isBuy,
        onPressed: () => setState(() {
          isBuy = true;
        }),
        text: "Buy",
      );

  ElevatedButton rentButton() => ButtonExtension.builder(
        active: isBuy != null && !isBuy,
        onPressed: () => setState(() {
          isBuy = false;
        }),
        text: "Rent",
      );

  ElevatedButton houseButton() => ButtonExtension.builder(
        active: buildingType == BuildingType.house,
        onPressed: () => setState(() {
          buildingType = BuildingType.house;
        }),
        size: 10.0,
        text: "House",
      );

  ElevatedButton apartmentButton() => ButtonExtension.builder(
        active: buildingType == BuildingType.apartment,
        onPressed: () => setState(() {
          buildingType = BuildingType.apartment;
        }),
        size: 10.0,
        text: "Apartment",
      );

  ElevatedButton fiwnhouseButton() => ButtonExtension.builder(
        active: buildingType == BuildingType.fiwnhouse,
        onPressed: () => setState(() {
          buildingType = BuildingType.fiwnhouse;
        }),
        size: 10.0,
        text: "Fiwnhouse",
      );

  ElevatedButton villaButton() => ButtonExtension.builder(
        active: buildingType == BuildingType.villa,
        onPressed: () => setState(() {
          buildingType = BuildingType.villa;
        }),
        size: 10.0,
        text: "Villa",
      );

  ElevatedButton anyFrequencyButton() => ButtonExtension.builder(
        active: buildingType == BuildingType.none,
        onPressed: () => setState(() {
          buildingType = BuildingType.none;
        }),
        text: "Any",
      );

  ElevatedButton anyPriceButton() => ButtonExtension.builder(
        active: buildingType == BuildingType.none,
        onPressed: () => setState(() {
          buildingType = BuildingType.none;
        }),
        text: "Any",
      );

  ElevatedButton anySpaceButton() => ButtonExtension.builder(
        active: buildingType == BuildingType.none,
        onPressed: () => setState(() {
          buildingType = BuildingType.none;
        }),
        text: "Any",
      );

  ElevatedButton anyRoomButton() => ButtonExtension.builder(
        active: rooms == Bedrooms.none,
        onPressed: () => setState(() {
          rooms = Bedrooms.none;
        }),
        text: "Any",
      );

  ElevatedButton yearButton() => ButtonExtension.builder(
        active: rentFrequency == RentFrequency.year,
        onPressed: () => setState(() {
          rentFrequency = RentFrequency.year;
        }),
        size: 12.0,
        text: "Yearly",
      );

  ElevatedButton monthButton() => ButtonExtension.builder(
        active: rentFrequency == RentFrequency.month,
        onPressed: () => setState(() {
          rentFrequency = RentFrequency.month;
        }),
        size: 12.0,
        text: "Monthly",
      );

  ElevatedButton weekButton() => ButtonExtension.builder(
        active: rentFrequency == RentFrequency.week,
        onPressed: () => setState(() {
          rentFrequency = RentFrequency.week;
        }),
        size: 12.0,
        text: "Weekly",
      );

  ElevatedButton dayButton() => ButtonExtension.builder(
        active: rentFrequency == RentFrequency.day,
        onPressed: () => setState(() {
          rentFrequency = RentFrequency.day;
        }),
        size: 12.0,
        text: "Daily",
      );

  ElevatedButton room1Button() => ButtonExtension.builder(
        active: rooms == Bedrooms.one,
        onPressed: () => setState(() {
          rooms = Bedrooms.one;
        }),
        size: 12.0,
        text: "1",
      );

  ElevatedButton room2Button() => ButtonExtension.builder(
        active: rooms == Bedrooms.two,
        onPressed: () => setState(() {
          rooms = Bedrooms.two;
        }),
        size: 12.0,
        text: "2",
      );

  ElevatedButton room3Button() => ButtonExtension.builder(
        active: rooms == Bedrooms.three,
        onPressed: () => setState(() {
          rooms = Bedrooms.three;
        }),
        size: 12.0,
        text: "3",
      );

  ElevatedButton room4Button() => ButtonExtension.builder(
        active: rooms == Bedrooms.four,
        onPressed: () => setState(() {
          rooms = Bedrooms.four;
        }),
        size: 12.0,
        text: "4",
      );

  RangeSlider priceRange() => RangeSlider(
        values: _priceRangeValues,
        min: 0,
        max: 15000,
        divisions: 100,
        labels: RangeLabels(
          _priceRangeValues.start.round().toString(),
          _priceRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _priceRangeValues = values;
          });
        },
      );

  Widget priceTitle() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Price Range",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2),
            ),
            priceRangeText(),
          ],
        ),
      );

  Text priceRangeText() => Text(
        "\$${_priceRangeValues.start.round().toString()} - \$${_priceRangeValues.end.round().toString()}",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          letterSpacing: 1.2,
          color: primaryColor,
        ),
      );

  RangeSlider spaceRange() => RangeSlider(
        values: _spaceRangeValues,
        min: 0,
        max: 2000,
        labels: RangeLabels(
          _spaceRangeValues.start.round().toString(),
          _spaceRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _spaceRangeValues = values;
          });
        },
      );

  Widget spaceTitle() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Space",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2),
            ),
            spaceRangeText()
          ],
        ),
      );

  Text spaceRangeText() => Text(
        "${_spaceRangeValues.start.round().toString()}m - ${_spaceRangeValues.end.round().toString()}m",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          letterSpacing: 1.2,
          color: primaryColor,
        ),
      );

  Widget filterType() => Row(
        children: [
          hMdSBox,
          Expanded(
            child: residentialButton(),
          ),
          hMdSBox,
          Expanded(
            child: commercialButton(),
          ),
          hMdSBox,
        ],
      );

  Widget filterBuyOrRent() => Row(
        children: [
          hMdSBox,
          Expanded(
            child: buyButton(),
          ),
          hMdSBox,
          Expanded(
            child: rentButton(),
          ),
          hMdSBox,
        ],
      );

  Widget filterBuildingType() => Row(
        children: [
          hMdSBox,
          houseButton(),
          exHSBox,
          apartmentButton(),
          exHSBox,
          fiwnhouseButton(),
          exHSBox,
          villaButton(),
          hMdSBox,
        ],
      );

  Widget filterPeriod() => Row(
        children: [
          hMdSBox,
          yearButton(),
          exHSBox,
          monthButton(),
          exHSBox,
          weekButton(),
          exHSBox,
          dayButton(),
          hMdSBox,
        ],
      );

  Widget filterRooms() => Row(
        children: [
          hMdSBox,
          anyRoomButton(),
          hMdSBox,
          SizedBox(width: 50, child: room1Button()),
          hMdSBox,
          SizedBox(width: 50, child: room2Button()),
          hMdSBox,
          SizedBox(width: 50, child: room3Button()),
          hMdSBox,
          SizedBox(width: 50, child: room4Button()),
          hMdSBox
        ],
      );

  Widget moreFilterOption() {
    return Column(
      children: [
        vSBox,
        divider,
        Row(
          children: [
            hMdSBox,
            Text(
              "Rent Freequency",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2),
            ),
            hMdSBox,
          ],
        ),
        vSBox,
        filterPeriod(),
        vSBox,
        SizedBox(
          width: getWindowWidth(context) * .35,
          child: anyFrequencyButton(),
        ),
        divider,
        priceTitle(),
        vSBox,
        priceRange(),
        vSBox,
        SizedBox(
          width: getWindowWidth(context) * .35,
          child: anyPriceButton(),
        ),
        vSBox,
        spaceTitle(),
        vSBox,
        spaceRange(),
        vSBox,
        SizedBox(
          width: getWindowWidth(context) * .35,
          child: anySpaceButton(),
        ),
        Row(
          children: [
            hMdSBox,
            Text(
              "Bed rooms",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2),
            ),
            hMdSBox,
          ],
        ),
        vSBox,
        filterRooms(),
        vSBox,
      ],
    );
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        int sensitivity = 10;
        if (details.delta.dy > sensitivity && !minimized) {
          setState(() {
            minimized = true;
          });
        } else if (details.delta.dy < -sensitivity && minimized) {
          setState(() {
            minimized = false;
          });
        }
      },
      child: Container(
        width: getWindowWidth(context),
        height: minimized
            ? getWindowHeight(context) * .3
            : getWindowHeight(context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              filterType(),
              divider,
              filterBuyOrRent(),
              divider,
              filterBuildingType(),
              minimized ? SizedBox() : moreFilterOption(),
            ],
          ),
        ),
      ),
    );
  }
}
