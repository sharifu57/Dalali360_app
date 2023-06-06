import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dalali360_app/models/wardModel.dart';
import 'package:dalali360_app/partials/failed.dart';
import 'package:dalali360_app/partials/success.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../config.dart';

class PropertyUpload extends StatefulWidget {
  const PropertyUpload({super.key});

  @override
  State<PropertyUpload> createState() => _PropertyUploadState();
}

class _PropertyUploadState extends State<PropertyUpload> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SingleValueDropDownController _cnt = SingleValueDropDownController();
  final SingleValueDropDownController _ccnt = SingleValueDropDownController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  Map _formData = {};

  File? imageFile;
  XFile? image;

  List locations = [];
  List categories = [];
  final box = GetStorage();
  String? selectedValue;

  final ImagePicker _picker = ImagePicker();

  selectImage(imageSource) async {
    image = await _picker.pickImage(source: imageSource);

    setState(() {
      imageFile = File(image!.path);
    });

    print(imageFile);
  }

  @override
  void initState() {
    // TODO: implement initState
    gefetchLoations();
    getCategories();
    box.read("id");
    super.initState();
  }

  gefetchLoations() async {
    try {
      Response response = await Dio().get("${config['apiBaseUrl']!}/wards",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));

      setState(() {
        locations = response.data['data'];
      });
    } catch (e) {
    } finally {}
  }

  getCategories() async {
    try {
      Response response =
          await Dio().get("${config['apiBaseUrl']!}/categories");

      setState(() {
        categories = response.data['data'];
      });
    } catch (e) {
      print(e);
    }
  }

  String? dropdownValue; //for location
  String? selectedCategory;
  bool _isSubmit = false;
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff04172B),
        centerTitle: true,
        title: Center(
          child: Text("Upload Property"),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 17,
            )),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 25, bottom: 20),
                              child: Center(
                                  child: Text(
                                "Choose your file destination",
                                style: TextStyle(fontSize: 14),
                              ))),
                          Container(
                            // padding: EdgeInsets.only(left: 0, right: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: IconButton(
                                            onPressed: () {
                                              selectImage(ImageSource.camera);
                                            },
                                            icon: Icon(Icons.camera)),
                                      ),
                                      Container(
                                        child: Text("Camera"),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: IconButton(
                                            onPressed: () {
                                              selectImage(ImageSource.gallery);
                                            },
                                            icon: Icon(Icons.photo)),
                                      ),
                                      Container(
                                        child: Text("Gallery"),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.camera_enhance_outlined,
                size: 20,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                FutureBuilder(builder: (context, snapshot) {
                  return Container(
                      child: imageFile == null
                          ? Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(bottom: 20),
                              child: Text(
                                "No Image Selected",
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : Container(
                              child: _isVisible == true
                                  ? Row(
                                      children: [
                                        Image.file(
                                          imageFile!,
                                          fit: BoxFit.contain,
                                          height: 50,
                                          width: 50,
                                        ),
                                        Container(
                                            child: IconButton(
                                                onPressed: () {
                                                  removeImage();
                                                },
                                                icon: Icon(
                                                  Icons.cancel,
                                                  color: Colors.red,
                                                )))
                                      ],
                                    )
                                  : Container(),
                            ));
                }),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Property Owner",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
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
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Name";
                                          }
                                        },
                                        onSaved: (value) {
                                          _formData['name'] = value.toString();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Price",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      child: TextFormField(
                                        enabled: true,
                                        decoration: const InputDecoration(
                                          hintText: "200000",
                                          hintStyle: TextStyle(
                                              color: Color(0xFF11101E),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                          prefixIcon: Icon(
                                            Icons.currency_bitcoin,
                                            color: Color(0xFF11101E),
                                            size: 14,
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Name";
                                          }
                                        },
                                        onSaved: (value) {
                                          _formData['price'] = value.toString();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Description",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      child: TextFormField(
                                        enabled: true,
                                        decoration: const InputDecoration(
                                          hintText: "eg: describe the property",
                                          hintStyle: TextStyle(
                                              color: Color(0xFF11101E),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                          prefixIcon: Icon(
                                            Icons.text_fields_rounded,
                                            color: Color(0xFF11101E),
                                            size: 14,
                                          ),
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Describe the House";
                                          }
                                        },
                                        onSaved: (value) {
                                          _formData['description'] =
                                              value.toString();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: DropDownTextField(
                                  textFieldDecoration: const InputDecoration(
                                    label: Text("Select Location"),
                                    hintText: "Select Location",
                                    hintStyle: TextStyle(fontSize: 13),
                                    prefixIcon: Icon(
                                      Icons.location_city_sharp,
                                      color: Color(0xFF11101E),
                                      size: 14,
                                    ),
                                  ),
                                  controller: _cnt,
                                  clearOption: false,
                                  enableSearch: true,
                                  dropDownItemCount: locations.length,
                                  clearIconProperty:
                                      IconProperty(color: Colors.green),
                                  searchDecoration: const InputDecoration(
                                      hintText: "Search Category",
                                      hintStyle: TextStyle(fontSize: 13)),
                                  dropDownList: [
                                    for (var location in locations)
                                      DropDownValueModel(
                                          name: "${location['name']}",
                                          value: location['id'])
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      dropdownValue = value?.value.toString();
                                      print("selected value----");
                                      print(
                                          "Selected value ID: $dropdownValue");
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return "Required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: DropDownTextField(
                                  textFieldDecoration: const InputDecoration(
                                    label: Text("Select Category"),
                                    hintText: "Select Category",
                                    hintStyle: TextStyle(fontSize: 13),
                                    prefixIcon: Icon(
                                      Icons.category,
                                      color: Color(0xFF11101E),
                                      size: 14,
                                    ),
                                  ),
                                  controller: _ccnt,
                                  clearOption: false,
                                  enableSearch: true,
                                  dropDownItemCount: categories.length,
                                  clearIconProperty:
                                      IconProperty(color: Colors.green),
                                  searchDecoration: const InputDecoration(
                                      hintText: "Search Category",
                                      hintStyle: TextStyle(fontSize: 13)),
                                  dropDownList: [
                                    for (var category in categories)
                                      DropDownValueModel(
                                          name: "${category['name']}",
                                          value: category['id'])
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCategory =
                                          value?.value.toString();
                                      print("selected value----");
                                      print(
                                          "Selected value category ID: $selectedCategory");
                                    });
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return "Required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: _isSubmit == true
                                    ? Container(
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 45,
                                        padding:
                                            EdgeInsets.only(top: 0, bottom: 10),
                                        child: OutlinedButton.icon(
                                            style: OutlinedButton.styleFrom(
                                                backgroundColor: Color(
                                                    0xFF11101E) //<-- SEE HERE
                                                ),
                                            onPressed: () {
                                              uploadData();
                                            },
                                            icon: const Icon(
                                              Icons.upload,
                                              color: Colors.white,
                                            ),
                                            label: const Text(
                                              "Upload Property",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                              ),
                            ],
                          ))
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  var responseData;

  void uploadData() async {
    // _isSubmit == true;
    setState(() {
      _isSubmit = true;
    });
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    var formData = FormData.fromMap({
      "name": _formData['name'].toString(),
      "price": _formData['price'].toString(),
      "description": _formData['description'].toString(),
      "ward": dropdownValue,
      "category": selectedCategory,
      "user": box.read("id"),
      "image": imageFile == null
          ? null
          : await MultipartFile.fromFile(imageFile!.path),
    });

    print(formData);
    try {
      Response response = await Dio()
          .post("${config['apiBaseUrl']!}/upload_property", data: formData);

      if (response.data != null) {
        if (response.statusCode == 201) {
          setState(() {
            _isSubmit = false;
          });
          showSuccessDialog(context, 'Property Successfully Created');
        }
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 500 || e.response?.statusCode == 400) {
        setState(() {
          _isSubmit = false;
        });
        failedDialog(context, 'Failed to Create');
        print(e.response?.data);
      }
    }
  }

  void removeImage() {
    setState(() {
      this._isVisible == false;
    });
  }
}
