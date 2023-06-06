import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ApiRequest {
  final String url;
  final Map data;

  ApiRequest({
    required this.url,
    required this.data,
  });

  Dio dio() {
    return Dio(BaseOptions(headers: {
      'Authorization': 'NJWqljx5l9LOaYeHFo0yFwyZFuk97NSpLqNly4ko'
    }));
  }

  void get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    // ignore: unnecessary_this
    dio()
        .get(
      this.url,
    )
        .then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((onError) {
      if (onError != null) onError(Error);
    });
  }
}
