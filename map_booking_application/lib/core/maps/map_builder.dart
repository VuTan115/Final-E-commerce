import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wemapgl/wemapgl.dart';

class MapBuilder extends StatelessWidget {
  MapBuilder({Key? key, this.place, required CameraPosition position})
      : _position = position,
        super(key: key);
  WeMapPlace? place;
  late WeMapController mapController;
  int searchType = 1; //Type of search bar

  final CameraPosition _position;
  static const double zoomSizeDefault = 16.0;
  @override
  Widget build(BuildContext context) {
    return WeMap(
      onMapClick: (point, latlng, _place) async {
        place = _place;
      },
      destinationIcon: "assets/icons/placeholder.png",
      initialCameraPosition: _position,
    );
  }
}
