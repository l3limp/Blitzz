import 'dart:convert';
import 'dart:io';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:http/http.dart' as http;
import 'package:blitzz/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;
  final _theme = OurTheme();
  late Stream<QuerySnapshot> _recentsStream;
  late QuerySnapshot eventsQuery;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? _user = FirebaseAuth.instance.currentUser;
    _recentsStream = FirebaseFirestore.instance
        .collection('recent_locations')
        .doc(_user!.uid)
        .collection('recents')
        .orderBy('timestamp', descending: true)
        .limit(3)
        .snapshots();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
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
                        child: StreamBuilder<QuerySnapshot>(
                          stream: _recentsStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              return ListView(
                                children: _getRecentList(snapshot),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     eventsQuery.docs.isNotEmpty
                        //         ? _buildListTiles()
                        //         : const SizedBox()
                        //   ],
                        // ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await pickImage(context, ImageSource.gallery);
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
                        pickImage(context, ImageSource.camera);
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
                SizedBox(
                  height: _height * 0.045,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          _user.email.toString(),
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
                        border: Border.all(
                          color: _theme.primaryColor,
                          width: 2,
                        ),
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
      ),
    );
  }

  Future pickImage(BuildContext _context, ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
    await compressImage(image);
  }

  // Future clickImage(BuildContext _context) async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (image == null) return;

  //   final imageTemp = File(image.path);
  //   setState(() => this.image = imageTemp);
  //   await compressImage(image);
  // }
  compressImage(XFile image) async {
    File compressedFile =
        await FlutterNativeImage.compressImage(image.path, quality: 25);
    XFile test = XFile(compressedFile.path);
    await decodeImage(test);
  }

  decodeImage(XFile _image) async {
    var stream = http.ByteStream(_image.openRead());
    var length = await _image.length();
    var url = Uri.parse('https://api.ocr.space/parse/image');
    var request = http.MultipartRequest("POST", url);
    request.fields['apikey'] = 'K87516539188957';
    request.fields['language'] = 'eng';
    var multiPartFile =
        http.MultipartFile("files", stream, length, filename: _image.path);
    request.files.add(multiPartFile);
    var response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) {
      Map data = jsonDecode(value);
      Navigator.pushNamed(context, '/picture_page', arguments: {
        'image': image,
        'address': data['ParsedResults'][0]['ParsedText'] ??
            data['ParsedResults'][0]['ErrorMessage']
      });
    });
  }

  _getRecentList(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/directions',
                arguments: {'address': data['address']});
          },
          leading: Text(
            data['address'].toString().length > 67
                ? data['address'].toString().substring(0, 68) + "..."
                : data['address'],
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                color: _theme.primaryColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
