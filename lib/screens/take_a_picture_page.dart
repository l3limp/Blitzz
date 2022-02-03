import 'package:blitzz/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TakeAPicture extends StatefulWidget {
  const TakeAPicture({Key? key}) : super(key: key);

  @override
  _TakeAPictureState createState() => _TakeAPictureState();
}

class _TakeAPictureState extends State<TakeAPicture> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    OurTheme _theme = OurTheme();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: _theme.primaryColor),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text("TAKE A PICTURE",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: _theme.primaryColor,
                    letterSpacing: .5,
                  ),
                )),
          ),
          body: SingleChildScrollView(
            physics: const RangeMaintainingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.05, 10, width * 0.05, 15),
                  child: Container(
                    height: height * 0.47,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: _theme.primaryColor, width: 3),
                        borderRadius: BorderRadius.circular(12)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/address.jpeg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(width * 0.2, 0, 0, 0),
                      child: Text(
                        "TEXT",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: _theme.secondaryColor,
                              letterSpacing: .5,
                              fontSize: 24),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, width * 0.05, 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/directions');
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
                                  color: _theme.primaryColor, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: width * 0.4,
                            height: 60,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "BLITZZ",
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: _theme.secondaryColor,
                                          letterSpacing: .5,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Icon(
                                      Icons.arrow_right_rounded,
                                      color: _theme.secondaryColor,
                                      size: 42,
                                    ),
                                  )
                                ])),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.05, 10, width * 0.05, 25),
                  child: SizedBox(
                    width: width * 0.9,
                    height: height * 0.22,
                    child: TextFormField(
                      onChanged: (text) {},
                      maxLines: 10,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(color: _theme.secondaryColor),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: _theme.primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: _theme.secondaryColor, width: 2)),
                      ),
                      cursorColor: _theme.secondaryColor,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: _theme.primaryColor, letterSpacing: .5),
                      ),
                    ),
                  ),
                ),
                Text("DELETE THE UNREQUIRED TEXT",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: _theme.primaryColor,
                          letterSpacing: .5,
                          fontSize: 15),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
