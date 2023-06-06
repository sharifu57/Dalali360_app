import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/models/profileModel.dart';
import 'package:dalali360_app/models/propertyModel.dart';
import 'package:dalali360_app/models/wardModel.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class LocationController extends GetxController {
  var wards = <Ward>[].obs;
  var properties = <Property>[].obs;
  var profiles = <Profile>[].obs;
  var isLoading = false.obs;
  var isLoaded = true.obs;
  var itemList = List<String>.empty(growable: true).obs;

  RxString query = ''.obs;
  RxList results = <String>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getWards();
    // filteredData;
    super.onInit();
  }

  void onClose() {
    void filterLocation(String location) {
      List<Map<String, dynamic>> results = [];
      if (location.isEmpty) {
        results = wards as List<Map<String, dynamic>>;
      } else {}
    }
  }

  Rx<List<Map<String, dynamic>>> foundLocations =
      Rx<List<Map<String, dynamic>>>([]);

  Future getWards() async {
    wards.clear();
    var dio = Dio();
    Response response;
    try {
      isLoaded(false);
      Response response = await dio.get("${config['apiBaseUrl']!}/wards",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.data != null) {
        if (response.statusCode == 200) {
          for (var ward in response.data['data']) {
            wards.add(Ward.fromJson(ward));
          }
        }
      }
    } catch (e) {
      isLoading.value = false;
    } finally {
      isLoaded(true);
    }
  }

  Future PropertiesByLocationId(int wardId) async {
    properties.clear();
    try {
      Response response = await Dio().get(
          "${config['apiBaseUrl']!}/wards/" "$wardId",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.data);
        for (var property in response.data['data']) {
          properties.add(Property.fromJson(property));
        }
      }
    } catch (e) {}
  }

  Future dalaliByWardId(int wardId) async {
    profiles.clear();
    try {
      Response response = await Dio().get(
          "${config['apiBaseUrl']!}/profiles_by_ward_id/" "$wardId",
          options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
      if (response.statusCode == 200) {
        for (var profile in response.data['data']) {
          profiles.add(Profile.fromJson(profile));
        }
      }
    } catch (e) {}
  }

  void filterLocation(query) {
    wards.value = wards
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  search(String value) {
    if (value.isEmpty) {
      // query = wards.obs;
      print("Searching Empty =====");
      return wards.obs;
    } else {
      wards.value = wards
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList()
          .obs;
    }
  }
}
