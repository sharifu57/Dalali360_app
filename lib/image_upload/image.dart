import 'dart:developer';
import 'dart:io';
import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/controllers/upload.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map _formData = {};

  File? imageFile;
  XFile? image;

  final ImagePicker _picker = ImagePicker();

  selectImage(imageSource) async {
    image = await _picker.pickImage(source: imageSource);
    setState(() {
      imageFile = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text("Image File"),
          TextButton(
              onPressed: () {
                selectImage(ImageSource.gallery);
              },
              child: const Text("Gallery")),
          TextButton(
              onPressed: () {
                selectImage(ImageSource.camera);
              },
              child: const Text("Camera")),
          imageFile == null
              ? Container()
              : Container(
                  child: Image.file(
                    imageFile!,
                    height: 300,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
                ),
          Container(
            padding: const EdgeInsets.only(bottom: 20, top: 20),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Property(Owner name)",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    enabled: true,
                    decoration: const InputDecoration(
                      hintText: "eg: nyumba za zungu",
                      hintStyle: TextStyle(
                          color: Color(0xFF11101E),
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        Icons.money,
                        color: Color(0xFF11101E),
                        size: 14,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Name";
                      }
                    },
                    onSaved: (value) {
                      _formData['name'] = value.toString();
                    },
                  ),
                ),
                TextButton(
                    onPressed: () {
                      uploadData();
                    },
                    child: Text("Uploading..."))
              ],
            ),
          )
        ],
      ),
    );
  }

  var responseData;
  uploadData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState?.save();

    FormData data = FormData.fromMap({
      "name": _formData['name'].toString(),
      "image": imageFile == null
          ? null
          : await MultipartFile.fromFile(imageFile!.path),
    });

    print(data);

    // responseData = await updload(data, "properties");
    Dio dio = Dio();
    Response response =
        await Dio().post("${config['apiBaseUrl']!}/properties", data: data);

    log(response.toString());

    print(response);
  }
}
