import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../counter.dart';

final counter = Counter();

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  late Position currentLocation;
  late GoogleMapController mapController;

  LatLng _center = const LatLng(6.576421, 3.365344);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    print('center $_center');
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
                    zoom: 15.0,
                  ),
                ),
                TrackButton(),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
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

class TrackButton extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TrackButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              width: 130,
              child: Card(
                color: Colors.deepOrange,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text('AlertDialog Title'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('This is a demo alert dialog.'),
                                    Text(
                                        'Would you like to approve of this message?'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Approve'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ));
                  },
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
    );
  }
}
