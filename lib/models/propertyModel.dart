import 'package:dalali360_app/models/categoryModel.dart';
import 'package:dalali360_app/models/userModel.dart';
import 'package:dalali360_app/models/wardModel.dart';

class Property {
  int? id;
  String? price;
  String? name;
  String? image;
  String? distance;
  String? description;
  // String? status;
  bool? parking;
  bool? fence;
  int? luku;
  bool? ulinzi;
  User? user;
  Ward? ward;
  CategoryModel? category;

  Property({
    required this.id,
    required this.name,
    required this.price,
    required this.distance,
    required this.parking,
    required this.user,
    required this.fence,
    required this.description,
    // required this.status,
    required this.luku,
    required this.ulinzi,
    required this.ward,
    required this.image,
    required this.category,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        distance: json['distance'],
        parking: json['parking'],
        // status: json['status'],
        description: json['description'],
        image: json['image'],
        fence: json['fence'],
        luku: json['luku'],
        ulinzi: json['ulinzi'],
        ward: json['ward'] != null ? Ward.fromJson(json['ward']) : null,
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        category: json['category'] != null
            ? CategoryModel.fromJson(json['category'])
            : null);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['price'] = price;
  //   data['distance'] = distance;
  //   data['parking'] = parking;
  //   data['status'] = status;
  //   data['image'] = image;
  //   data['fence'] = fence;
  //   data['ward'] = ward;

  //   return data;
  // }
}
