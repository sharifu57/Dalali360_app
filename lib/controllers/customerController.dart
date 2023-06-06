import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/models/customerModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class CustomerController extends GetxController {
  var customers = <Customer>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future getCustomersByDalaliId(int dalaliId) async {
    print(dalaliId);
    customers.clear();
    try {
      var response = await Dio()
          .get("${config['apiBaseUrl']}/customers_by_user_id/" "$dalaliId");

      if (response.data != null) {
        if (response.statusCode == 200) {
          for (final dynamic customer in response.data['data']) {
            print("----customer here ----");
            print(customer.toString());
            print("======customers" + customer);
            customers.add(Customer.fromJson(customer));
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
