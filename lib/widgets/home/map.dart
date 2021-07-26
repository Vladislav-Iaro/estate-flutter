import 'dart:async';
import 'dart:typed_data';
import 'package:estate_social_app/models/estate.dart';
import 'package:estate_social_app/widgets/map/marker.dart';
import 'package:estate_social_app/widgets/map/marker_generator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EstateMap extends StatefulWidget {
  final Function markerTap;
  EstateMap({this.markerTap});
  _MapScreenState createState() => _MapScreenState();
}

const LatLng _kMapCenter = LatLng(52.4478, -3.5402);

class _MapScreenState extends State<EstateMap> {
  Completer<GoogleMapController> _controller = Completer();
  List<MapMarker> mapMarkers = [];
  List<Marker> customMarkers = [];
  List<Estate> locations;
  int selectedIndex = -1;

  void mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    customMarkers.clear();
    bitmaps.asMap().forEach((mid, bmp) {
      customMarkers.add(Marker(
        markerId: MarkerId("$mid"),
        position: locations[mid].coordinates,
        icon: BitmapDescriptor.fromBytes(bmp),
        onTap: () {
          setState(() {
            selectedIndex = mid;
            setMarkerIcons();
          });
          widget.markerTap();
        },
      ));
    });
  }

  void initState() {
    super.initState();
    locations = [
      Estate(coordinates: LatLng(52.4400, -3.5450), image: 'home', count: 4),
      Estate(coordinates: LatLng(52.4480, -3.5400), image: 'home', count: 5),
      Estate(coordinates: LatLng(52.4560, -3.5504), image: 'home', count: 6),
    ];
    setMarkerIcons();
  }

  void setMarkerIcons() {
    MarkerGenerator(markerWidgets(), (bitmaps) {
      setState(() {
        mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);
  }

  void updateMarkerIcons() {}

  List<Widget> markerWidgets() {
    List<Widget> _markers = [];
    locations.asMap().forEach((index, loc) =>
        _markers.add(MapMarker(estate: loc, selected: selectedIndex == index)));
    return _markers;
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: _kMapCenter,
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      markers: customMarkers.toSet(),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      zoomControlsEnabled: false
    );
  }
}
