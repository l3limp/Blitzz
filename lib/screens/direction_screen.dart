import 'package:blitzz/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionScreen extends StatelessWidget {
  const DirectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = OurTheme();
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
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
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: _theme.secondaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: _theme.primaryColor,
                            blurRadius: 2,
                            offset: const Offset(1, 2)),
                      ],
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    width: _width * 0.38,
                    height: _height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 35.0,
                        ),
                        Text(
                          "HOME",
                          style: TextStyle(
                              fontFamily: _theme.font,
                              color: Colors.white,
                              fontSize: 24.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: _theme.secondaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: _theme.primaryColor,
                            blurRadius: 2,
                            offset: const Offset(1, 2)),
                      ],
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    width: _width * 0.54,
                    height: _height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.directions,
                          color: Colors.white,
                          size: 35.0,
                        ),
                        Text(
                          "DIRECTIONS",
                          style: TextStyle(
                              fontFamily: _theme.font,
                              color: Colors.white,
                              fontSize: 24.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600),
                        )
                      ],
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
}
