import 'package:dalali360_app/bindings/networkBinding.dart';
import 'package:dalali360_app/controllers/connectivityController.dart';
import 'package:dalali360_app/routes/app_pages.dart';
import 'package:dalali360_app/routes/routes.dart';
import 'package:dalali360_app/views/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  // WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize(
  //     debug: true // optional: set false to disable printing logs to console
  //     );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF0B2239),
    statusBarColor: Color(0xFF0B2239),
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ConnectivityController _connectivityController =
      Get.put(ConnectivityController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: route,
      debugShowCheckedModeBanner: false,
      // initialRoute: AppPages.INITIAL,
      initialBinding: NetworkBinding(),
      // routes: route,
      theme: ThemeData(
          // 4AD295
          backgroundColor: Color(0xFF0B2239),
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B2239))),
          fontFamily: 'Raleway',
          primaryColor: Color(0xFF0B2239),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          inputDecorationTheme: const InputDecorationTheme()),
      home: Scaffold(
        body: Obx(() => Center(
              child: _connectivityController.isConnected.value
                  ? Splash()
                  : Text("no Internet"),
            )),
      ),
    );
  }
}
