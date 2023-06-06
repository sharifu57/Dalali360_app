import 'package:dalali360_app/models/userModel.dart';

class Customer {
  int? id;
  String? name;
  String? email;
  String? phone;
  User? user;

  Customer(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.user});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['user'] = user;
    return data;
  }
}
