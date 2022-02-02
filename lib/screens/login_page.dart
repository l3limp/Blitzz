import 'package:blitzz/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    OurTheme _theme = OurTheme();
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: height,
              width: width,
              child: Row(
                children: [
                  Container(
                      height: height,
                      width: width * 0.6,
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Hero(
                                  tag: 'tag',
                                  child: Material(
                                    color: Colors.transparent,
                                    child: SizedBox(
                                      height: height * 0.15,
                                      width: width * 0.4,
                                      child: Center(
                                        child: Text("BLITZZ",
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: _theme.primaryColor,
                                                  letterSpacing: .5,
                                                  fontSize: 30),
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width * 0.5,
                                  child: TextFormField(
                                    onChanged: (text) {},
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: "Email",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: TextStyle(
                                          color: _theme.secondaryColor),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: _theme.primaryColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: _theme.secondaryColor,
                                              width: 1.3)),
                                    ),
                                    cursorColor: _theme.secondaryColor,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: _theme.primaryColor,
                                          letterSpacing: .5),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: width * 0.5,
                                  child: TextFormField(
                                    onChanged: (text) {},
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: "Password",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: TextStyle(
                                          color: _theme.secondaryColor),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: _theme.primaryColor)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: _theme.secondaryColor,
                                              width: 1.3)),
                                    ),
                                    cursorColor: _theme.secondaryColor,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: _theme.primaryColor,
                                          letterSpacing: .5),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.popAndPushNamed(context, '/home');
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: _theme.primaryColor,
                                              blurRadius: 2,
                                              offset: const Offset(1, 2)),
                                        ],
                                        border: Border.all(
                                            color: _theme.primaryColor,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      width: width * 0.5,
                                      height: 60,
                                      child: Center(
                                        child: Text(
                                          "Sign In",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: _theme.primaryColor,
                                                letterSpacing: .5),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height / 8),
                          SizedBox(
                              height: height / 4,
                              child:
                                  Image.asset("assets/images/blitzz_logo.png")),
                        ],
                      )),
                  Container(
                      height: height,
                      width: width * 0.2,
                      color: _theme.secondaryColor),
                  Container(
                      height: height,
                      width: width * 0.2,
                      color: _theme.primaryColor),
                ],
              ),
            )),
      ),
    );
  }
}
