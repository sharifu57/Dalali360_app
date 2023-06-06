import 'package:dio/dio.dart';

import '../config.dart';

headers() async {
  Options(contentType: "application/json");
}

updload(request, endpoint) async {
  Dio dio = Dio();

  dio
      .post("${config['apiBaseUrl']!}/$endpoint", data: request
          // options: headers(),
          )
      .then((response) {
    print(response);
  });
}
