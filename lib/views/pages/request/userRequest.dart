import 'dart:convert';

import 'package:dalali360_app/config.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendRequest extends StatefulWidget {
  const SendRequest({super.key});

  @override
  State<SendRequest> createState() => _SendRequest();
}

class _SendRequest extends State<SendRequest> {
  final GlobalKey<FormState> _requestKey = GlobalKey<FormState>();
  final SingleValueDropDownController _cnt = SingleValueDropDownController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  List locations = [];
  String? dropdownValue;

  @override
  void initState() {
    gefetchLoations();
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

  Map _formData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff04172B),
        centerTitle: true,
        title: Text("Request Form"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 17,
            )),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: Text(
                  "Submit your request now",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Form(
                        key: _requestKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Full Name',
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff04172b),
                                  ),
                                  hintText: "John Smith",
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: 15,
                                  ),
                                  errorStyle: TextStyle(fontSize: 14.0),
                                ),
                                keyboardType: TextInputType.text,
                                enableSuggestions: false,
                                autocorrect: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter your Name';
                                  }
                                },
                                onSaved: (value) {
                                  _formData['full_name'] = value.toString();
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff04172b),
                                  ),
                                  hintText: "john@gmail.com",
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    size: 15,
                                  ),
                                  errorStyle: TextStyle(fontSize: 14.0),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                enableSuggestions: false,
                                autocorrect: false,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.contains('@')) {
                                    return 'Email is not Right';
                                  }
                                },
                                onSaved: (value) {
                                  _formData['email'] = value.toString();
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff04172b),
                                  ),
                                  hintText: "7*******",
                                  prefixIcon: Icon(
                                    Icons.phone_android,
                                    size: 15,
                                  ),
                                  errorStyle: TextStyle(fontSize: 14.0),
                                ),
                                initialValue: '255',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                enableSuggestions: false,
                                autocorrect: false,
                                maxLength: 12,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length > 12 ||
                                      value.length < 12) {
                                    return 'Phone Number is not Right';
                                  }
                                },
                                onSaved: (value) {
                                  _formData['phone'] = value.toString();
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        padding: EdgeInsets.only(right: 4),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Price From',
                                            labelStyle: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff04172b),
                                            ),
                                            hintText: "123",
                                            prefixIcon: Icon(
                                              Icons.money,
                                              size: 15,
                                            ),
                                            errorStyle:
                                                TextStyle(fontSize: 14.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          enableSuggestions: false,
                                          autocorrect: false,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Provide this Info';
                                            }
                                          },
                                          onSaved: (value) {
                                            _formData['price_from'] =
                                                value.toString();
                                          },
                                        ),
                                      )),
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 4),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Price To',
                                            labelStyle: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff04172b),
                                            ),
                                            hintText: "123",
                                            prefixIcon: Icon(
                                              Icons.money,
                                              size: 15,
                                            ),
                                            errorStyle:
                                                TextStyle(fontSize: 14.0),
                                          ),
                                          keyboardType: TextInputType.number,
                                          enableSuggestions: false,
                                          autocorrect: false,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please provide this field data';
                                            }
                                          },
                                          onSaved: (value) {
                                            _formData['price_to'] =
                                                value.toString();
                                          },
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 0),
                                child: TextFormField(
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    labelText:
                                        'What Type of Property Do you want',
                                    hintText:
                                        "What Type of Property Do you want",
                                    hintStyle: TextStyle(
                                      color: Color(0xFF11101E),
                                      fontSize: 10,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.text_fields_rounded,
                                      color: Color(0xFF11101E),
                                      size: 14,
                                    ),
                                    // border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please provide some information';
                                    }
                                  },
                                  onSaved: (value) {
                                    _formData['message'] = value.toString();
                                  },
                                )),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 15),
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
                                width: MediaQuery.of(context).size.width,
                                height: 35,
                                padding: EdgeInsets.only(top: 0, bottom: 0),
                                child: OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            Color(0xFF11101E) //<-- SEE HERE
                                        ),
                                    onPressed: () {
                                      sendRequest();
                                    },
                                    icon: const Icon(
                                      Icons.telegram,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      "Submit Request",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ))),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  bool _isSendRequest = false;

  void sendRequest() async {
    setState(() {
      _isSendRequest = true;
    });

    if (!_requestKey.currentState!.validate()) {
      return;
    }
    _requestKey.currentState?.save();

    var createRequest = jsonEncode({
      "full_name": _formData['full_name'],
      "email": _formData['email'],
      "phone": _formData['phone'],
      "price_from": _formData['price_from'],
      "price_to": _formData['price_to'],
      "location": dropdownValue,
      "message": _formData['message'],
    });

    var response = await Dio().post(
      "${config['apiBaseUrl']!}/create_request",
      data: createRequest,
    );
    print("****request submit");
    print(createRequest);
  }
}
