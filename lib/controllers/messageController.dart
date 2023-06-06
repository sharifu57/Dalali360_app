import 'package:dalali360_app/models/messageModel.dart';
import 'package:dio/dio.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MessageController extends GetxController {
  final dio = Dio();

  // dio.options.contentType = Headers.formUrlEncodedContentType;

  FormData formData = FormData.fromMap({
    'name': 'John Doe',
    'email': 'johndoe@example.com',
  });

  Future getWards() async {
    var dio = Dio();

    try {
      var response = await dio.get("", data: formData);
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future allmessages() async {
    // ignore: empty_catches
    try {} catch (e) {}
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
