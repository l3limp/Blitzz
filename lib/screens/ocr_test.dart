import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class OcrTest extends StatefulWidget {
  const OcrTest({Key? key}) : super(key: key);

  @override
  State<OcrTest> createState() => _OcrTestState();
}

class _OcrTestState extends State<OcrTest> {
  File? image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
    decodeImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: InkWell(
          onTap: () => pickImage(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image != null
                  ? Image.file(
                      image!,
                      width: 160.0,
                      height: 160.0,
                    )
                  : const FlutterLogo(
                      size: 160.0,
                    ),
              Container(
                child: const Text(
                  "Pick Image",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  decodeImage(XFile image) async {
    var stream = http.ByteStream(image.openRead());
    var length = await image.length();
    final payload = {
      'apikey': "helloworld",
      'language': "eng",
    };
    var url = Uri.parse('https://api.ocr.space/parse/image');
    var request = http.MultipartRequest("POST", url);
    request.fields['apikey'] = 'helloworld';
    request.fields['language'] = 'eng';
    var multiPartFile =
        http.MultipartFile("files", stream, length, filename: image.path);
    request.files.add(multiPartFile);
    print("test message");
    var response = await request.send();
      print(response.statusCode);
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
  }
}
