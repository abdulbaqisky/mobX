import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(6.576421, 3.365344);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Order Status',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 25,
                ),
                Text('place sha',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
        // Wrapping in the Observer will automatically re-render on changes to counter.value
        Expanded(
          child: Container(
            child: Stack(
              children: [
                GoogleMap(
                  //onTap: _goToPlace,
                  trafficEnabled: true,
                  compassEnabled: true,
                  onMapCreated: _onMapCreated,
                  zoomControlsEnabled: false,
                  //myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 50,
                          width: 130,
                          child: Card(
                            color: Colors.deepOrange,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Details',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
          ),
        ),
      ],
    );
  }

  /*Future<void> _goToPlace() async {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(LatLng(latitude, longitude)));
  }*/
}
