import 'package:dalali360_app/models/wardModel.dart';

class UserRequest {
  int? id;
  String? full_name;
  String? email;
  String? phone;
  String? price_from;
  String? price_to;
  String? message;
  Ward? location;

  UserRequest(
      {required this.id,
      required this.full_name,
      required this.email,
      required this.phone,
      required this.price_from,
      required this.price_to,
      required this.message,
      required this.location});

  factory UserRequest.fromJson(Map<String, dynamic> json) {
    return UserRequest(
      id: json['id'],
      full_name: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      price_from: json['price_from'],
      price_to: json['price_to'],
      message: json['message'],
      location: json['location'] != null ? Ward.fromJson(json['ward']) : null,
    );
  }
}
