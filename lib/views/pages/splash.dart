import 'dart:async';

import 'package:dalali360_app/controllers/splashController.dart';
import 'package:dalali360_app/routes/routes.dart';
import 'package:dalali360_app/views/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final getStorage = GetStorage();
  startTime() async {
    var duration = Duration(milliseconds: 2000);
    return Timer(duration, nextPage);
  }

  void nextPage() async {
    if (getStorage.read("token") != null) {
      print("--------- token");
      Get.offNamed('/screen');
    } else {
      print("----------- no token");
      Get.offNamed('/screen');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF162945),
      body: SafeArea(
          child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                child: Center(
                  child: Image.asset(
                    'assets/logos/logo1.png',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width / 2.4,
                  ),
                ),
              )),
              Center(
                child: Column(
                  children: [
                    Container(
                      child: SpinKitChasingDots(
                        color: Colors.white, // Set the color of the spinner
                        size: 30.0, // Set the size of the spinner
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 5),
                      child: Center(
                        child: Text(
                          "www.dalali360.co.tz",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
