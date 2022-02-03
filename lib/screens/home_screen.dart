import 'package:blitzz/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = OurTheme();
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    late CollectionReference _users;
    String _userID = "";
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? _user = FirebaseAuth.instance.currentUser;
    _users = FirebaseFirestore.instance.collection('users');
    _userID = _auth.currentUser!.uid;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: _theme.primaryColor,
                        blurRadius: 1,
                        offset: const Offset(1, 1)),
                  ],
                  border: Border.all(color: _theme.primaryColor, width: 2),
                ),
                height: _height * 0.44,
                width: _width * 0.93,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "RECENT",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: _theme.primaryColor,
                          letterSpacing: 2,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      height: _height * 0.28,
                      width: _width * 0.82,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ListTile(
                            onTap: () {
                              print("List tile pressed");
                            },
                            leading: Text(
                              "Bla Bla Bla Bla",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: _theme.primaryColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              print("List tile pressed");
                            },
                            leading: Text(
                              "Bla Bla Bla Bla",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: _theme.primaryColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              print("List tile pressed");
                            },
                            leading: Text(
                              "Bla Bla Bla Bla",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: _theme.primaryColor,
                                  fontSize: 20,
                                ),
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
                      Navigator.pushNamed(context, '/upload_a_picture');
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "UPLOAD A PICTURE",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
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
                      height: _height * 0.195,
                      width: _width * 0.45,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/take_a_picture');
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "TAKE A PICTURE",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
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
                      height: _height * 0.195,
                      width: _width * 0.45,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        _user!.email.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: _theme.primaryColor,
                            letterSpacing: 1,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: _theme.primaryColor,
                            blurRadius: 1,
                            offset: const Offset(1, 1)),
                      ],
                      border: Border.all(color: _theme.primaryColor, width: 2),
                    ),
                    height: _height * 0.1,
                    width: _width * 0.6,
                  ),
                  InkWell(
                    onTap: () async {
                      await _auth.signOut();
                      Navigator.pushNamed(context, '/');
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "Sign Out",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: _theme.primaryColor,
                              letterSpacing: 1,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
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
                      height: _height * 0.1,
                      width: _width * 0.25,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
