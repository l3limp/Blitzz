import 'package:blitzz/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    OurTheme _theme = OurTheme();
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/login_page');
        },
        child: Scaffold(
            body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "THINK\n",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: _theme.secondaryColor,
                                    letterSpacing: .5,
                                    fontSize: 30),
                              ),
                            ),
                            Text(
                              "TRAVEL?\n",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: _theme.primaryColor,
                                    letterSpacing: .5,
                                    fontSize: 30),
                              ),
                            ),
                            Text(
                              "THINK\n",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: _theme.secondaryColor,
                                    letterSpacing: .5,
                                    fontSize: 30),
                              ),
                            ),
                            Hero(
                              tag: 'tag',
                              child: Material(
                                color: Colors.transparent,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Center(
                                    child: Text(
                                      "BLITZZ\n",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: _theme.primaryColor,
                                            letterSpacing: .5,
                                            fontSize: 30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 8),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          child: Image.asset("assets/images/blitzz_logo.png")),
                    ],
                  )),
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: _theme.secondaryColor),
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.2,
                  color: _theme.primaryColor),
            ],
          ),
        )),
      ),
    );
  }
}
