// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';

import 'package:dalali360_app/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClientLogin extends StatefulWidget {
  const ClientLogin({Key? key}) : super(key: key);

  @override
  State<ClientLogin> createState() => _ClientLoginState();
}

class _ClientLoginState extends State<ClientLogin> {
  final Map<String, dynamic> _userFormData = {};
  final GlobalKey<FormState> _userFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController =
        TextEditingController(text: '255');
    return Scaffold(
      backgroundColor: Color(0xFF11101E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 3.0,
                  child: Center(
                    child: Image.asset(
                      'assets/logos/logo1.png',
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width / 2.4,
                    ),
                  )),
              Expanded(
                  child: Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    color: Colors.white,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 27,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text(
                                "Client ClientLogin",
                                style: TextStyle(
                                    color: Color(0xFF11101E),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Form(
                                      key: _userFormKey,
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: TextFormField(
                                                controller:
                                                    phoneNumberController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText:
                                                            "Phone Number",
                                                        labelStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(
                                                                    255, 0, 0, 0)),
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0)) //<-- SEE HERE
                                                            ),
                                                        border: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                width: 1,
                                                                color: Color.fromARGB(
                                                                    255, 0, 0, 0)),
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(10.0)) //<-- SEE HERE
                                                            ),
                                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 0, 0, 0)), borderRadius: BorderRadius.all(Radius.circular(10.0)) //<-- SEE HERE
                                                            ),
                                                        errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(10.0))
                                                            //<-- SEE HERE
                                                            ),
                                                        prefixIcon: Icon(
                                                          Icons.call,
                                                          color:
                                                              Color(0xFF11101E),
                                                          size: 14,
                                                        )),
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                enableSuggestions: false,
                                                autocorrect: false,
                                                maxLength: 10,
                                                validator: (phoneNumber) {
                                                  if (phoneNumber == 0 ||
                                                      phoneNumber == null ||
                                                      phoneNumber != 10) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                          backgroundColor:
                                                              (Colors.red),
                                                          content: Text(
                                                              'Please enter valid Phone Number')),
                                                    );
                                                  }
                                                  return null;
                                                },
                                                onSaved: (phoneNumber) {
                                                  _userFormData['phoneNumber'] =
                                                      phoneNumber;
                                                },
                                              ))
                                        ],
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        print("-----ClientLogin");
                                        _ClientLogin();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(
                                            0xFF11101E), // Background color
                                      ),
                                      child: Container(
                                        child: Text("Proceed"),
                                      )),
                                )
                              ],
                            ),
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 0),
                              child: Center(
                                child: Container(
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Continue as Dalali',
                                        style:
                                            TextStyle(color: Color(0xFF11101E)),
                                      )),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        )),
      ),
    );
  }

  late Map clientResponse;

  Future _ClientLogin() async {
    if (_userFormKey.currentState!.validate()) {
      return;
    }
    _userFormKey.currentState!.save();

    setState(() {
      isLoading = true;
    });

    var clientLogin = json.encode({
      "phoneNumber": _userFormData['phoneNumber'],
    });

    try {
      Dio dio = Dio();
      Response response =
          await dio.post(config['apiBaseUrl']! + '', data: clientLogin);

      setState(() {
        clientResponse = response.data;
      });

      if (clientResponse['status'] == 'success') {
        print("============== success");
      } else {
        print("===============failed");

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something is not okay!"),
          backgroundColor: (Colors.black12),
          action: SnackBarAction(label: 'Dismis', onPressed: () {}),
        ));
      }
    } on DioError catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
