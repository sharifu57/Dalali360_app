// ignore_for_file: non_constant_identifier_names

import 'package:flutter/src/material/dropdown.dart';

class Ward {
  int? id;
  String? name;
  Ward({
    required this.id,
    required this.name,
  });

  factory Ward.fromJson(Map<String, dynamic> json) {
    return Ward(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    return data;
  }

  toLowerCase() {}

  contains(String value) {}

  static map(DropdownMenuItem<String> Function(dynamic item) param0) {}
}
