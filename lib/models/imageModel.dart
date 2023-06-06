import 'package:dalali360_app/models/propertyModel.dart';

class Media {
  String? image_path;
  Property? property;

  Media({required this.image_path, required this.property});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      image_path: json['image_path'],
      property:
          json['property'] != null ? Property.fromJson(json['property']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['image_path'] = image_path;
    data['property'] = property;

    return data;
  }
}
