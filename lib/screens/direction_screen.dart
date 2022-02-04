import 'package:blitzz/theme.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectionScreen extends StatefulWidget {
  const DirectionScreen({Key? key}) : super(key: key);

  @override
  State<DirectionScreen> createState() => _DirectionScreenState();
}

late GoogleMapController _controller;
late List<Marker> _markers = [];
List<Location> locations = [];
late Map arguments;

class _DirectionScreenState extends State<DirectionScreen> {
  @override
  Widget build(BuildContext context) {
    final _theme = OurTheme();
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: _theme.primaryColor,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  goToPlace(arguments['address']);
                },
                icon: const Icon(Icons.location_on))
          ],
          title: Text(
            "BLITZZ",
            style: TextStyle(
                color: _theme.primaryColor,
                fontSize: 25.0,
                letterSpacing: 2.0,
                fontFamily: _theme.font,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: _height * 0.72,
                width: _width * 0.93,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    border: Border.all(color: _theme.primaryColor, width: 2.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: GoogleMap(
                    compassEnabled: false,
                    zoomControlsEnabled: false,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(15.3911, 73.8782),
                      zoom: 16,
                      tilt: 20,
                    ),
                    onMapCreated: onMapCreated,
                    mapType: MapType.normal,
                    markers: Set.from(_markers),
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: _theme.primaryColor,
                              blurRadius: 2,
                              offset: const Offset(1, 2)),
                        ],
                        border:
                            Border.all(color: _theme.primaryColor, width: 2),
                      ),
                      width: _width * 0.38,
                      height: _height * 0.08,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.home,
                            color: _theme.primaryColor,
                            size: 35.0,
                          ),
                          Text(
                            "HOME",
                            style: TextStyle(
                                fontFamily: _theme.font,
                                color: _theme.primaryColor,
                                fontSize: 24.0,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (arguments['address'].toString().isNotEmpty) {
                        _launchMaps(locations[0].latitude.toString(),
                            locations[0].longitude.toString());
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: _theme.primaryColor,
                              blurRadius: 2,
                              offset: const Offset(1, 2)),
                        ],
                        border:
                            Border.all(color: _theme.primaryColor, width: 2),
                      ),
                      width: _width * 0.54,
                      height: _height * 0.08,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.directions,
                            color: _theme.primaryColor,
                            size: 35.0,
                          ),
                          Text(
                            "DIRECTIONS",
                            style: TextStyle(
                                fontFamily: _theme.font,
                                color: _theme.primaryColor,
                                fontSize: 24.0,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  onMapCreated(controller) {
    _controller = controller;
    goToPlace(arguments['address']);
  }

  goToPlace(String address) async {
    if (address.isNotEmpty) {
      locations = await locationFromAddress(address);
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(locations[0].latitude, locations[0].longitude),
            zoom: 15,
            tilt: 15,
            bearing: 10,
          ),
        ),
      );

      setState(() {
        _markers.add(Marker(
            markerId: const MarkerId("MarkerID"),
            draggable: false,
            infoWindow: InfoWindow(
                title: "Your Destination", snippet: arguments['address']),
            position: LatLng(locations[0].latitude, locations[0].longitude)));
      });
    }
  }

  _launchMaps(String lat, String long) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    String appleUrl = 'https://maps.apple.com/?sll=$lat,$long';
    if (!await launch(
      googleUrl,
    )) {
      if (!await launch(
        appleUrl,
      )) {
        throw 'Could not launch $appleUrl';
      }
      throw 'Could not launch $googleUrl';
    }
  }
}
