import 'package:dalali360_app/bindings/splashBinding.dart';

import 'package:get/get.dart';

import '../views/pages/splash.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();
  // static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(name: '/splash', page: () => Splash(), binding: SplashBinding()),
  ];
}
