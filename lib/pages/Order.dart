import 'package:flutter/material.dart';
import 'package:hello/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Order extends StatelessWidget {
  String api_key = 'AIzaSyD8jUPxpWCjjotMbXnK5oYmRHxAgpONORk';
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
