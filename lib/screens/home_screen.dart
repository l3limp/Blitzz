import 'package:blitzz/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = OurTheme();
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: _theme.primaryColor,
                ),
                height: _height / 2 - 70.0,
                width: _width - 20.0,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "RECENT",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: _theme.font,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.0),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: _theme.secondaryColor,
                      ),
                      height: _height / 4 + 20.0,
                      width: _width - 70.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ListTile(
                            onTap: () {
                              print("List tile pressed");
                            },
                            leading: Text(
                              "Bla Bla Bla Bla",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: _theme.font,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              print("List tile pressed");
                            },
                            leading: Text(
                              "Bla Bla Bla Bla",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: _theme.font,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              print("List tile pressed");
                            },
                            leading: Text(
                              "Bla Bla Bla Bla",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: _theme.font,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      print("pressed");
                    },
                    child: Container(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB((_width / 3 + 50.0) / 9,
                              0.0, (_width / 3 + 50.0) / 9, 0.0),
                          child: Text(
                            "UPLOAD A PICTURE",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: _theme.font,
                                fontWeight: FontWeight.w600,
                                fontSize: 30.0),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: _theme.primaryColor,
                      ),
                      height: _height / 5 - 7.0,
                      width: _width / 3 + 50.0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("pressed");
                    },
                    child: Container(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB((_width / 3 + 50.0) / 6,
                              0.0, (_width / 3 + 50.0) / 6, 0.0),
                          child: Text(
                            "TAKE A PICTURE",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: _theme.font,
                                fontWeight: FontWeight.w600,
                                fontSize: 30.0),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: _theme.primaryColor,
                      ),
                      height: _height / 5 - 7.0,
                      width: _width / 3 + 50.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: _height / 5,
                  child: const Image(
                    image: AssetImage("assets/images/blitz_logo.png"),
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
