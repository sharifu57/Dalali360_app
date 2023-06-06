import 'package:dalali360_app/models/userModel.dart';
import 'package:dalali360_app/models/wardModel.dart';
import 'package:dalali360_app/views/pages/category/view_one_category.dart';

class Profile {
  int? id;
  int? gender;
  String? dob;
  String? whatsap;
  String? instagram;
  String? facebook;
  String? phone_number;
  String? picture;
  String? dalali_number;
  String? about;
  User? user;
  Ward? ward;

  Profile(
      {required this.id,
      required this.dob,
      required this.phone_number,
      required this.gender,
      required this.picture,
      required this.user,
      required this.facebook,
      required this.instagram,
      required this.dalali_number,
      required this.about,
      required this.whatsap,
      required this.ward});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      dob: json['dob'],
      phone_number: json['phone_number'],
      gender: json['gender'],
      about: json['about'],
      facebook: json['facebook'],
      instagram: json['instagram'],
      whatsap: json['whatsap'],
      dalali_number: json['dalali_number'],
      picture: json['picture'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      ward: json['ward'] != null ? Ward.fromJson(json['ward']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dob'] = dob;
    data['phone_number'] = phone_number;
    data['gender'] = gender;
    data['about'] = about;
    data['picture'] = picture;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['whatsap'] = whatsap;
    data['user'] = user;
    data['ward'] = ward;
    data['dalali_number'] = dalali_number;

    return data;
  }
}
