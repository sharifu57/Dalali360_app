import 'package:dalali360_app/models/locationModel.dart';
import 'package:dalali360_app/views/pages/dalali/register.dart';
import 'package:dalali360_app/views/pages/screens/home.dart';
import 'package:dalali360_app/views/pages/screens/location.dart';
import 'package:dalali360_app/views/pages/screens/screen.dart';
import 'package:dalali360_app/views/pages/splash.dart';
import 'package:flutter/cupertino.dart';

import '../views/pages/dalali/login.dart';

final route = {
  // '/': (BuildContext context) => Splash(),
  // '/login': (BuildContext context) => Login(),
  // '/register': (BuildContext context) => Register(),
  // '/screen': (BuildContext context) => Screen(),
  // '/location': (BuildContext context) => LocationView(),
  // '/home': (BuildContext context) => Home()
  '/home': (context) => Home(),
  '/screen': (context) => Screen()
};
