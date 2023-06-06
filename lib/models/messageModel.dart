import 'package:dalali360_app/models/customerModel.dart';
import 'package:dalali360_app/models/userModel.dart';

class Message {
  String? id;
  Customer? sender;
  User? receiver;
  String? subject;
  String? message;
  String? duration;

  Message(
      {required this.id,
      required this.sender,
      required this.receiver,
      required this.subject,
      required this.message,
      required this.duration});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      sender: json['sender'] != null ? Customer.fromJson(json['sender']) : null,
      subject: json['subject'],
      message: json['message'],
      duration: json['duration'],
      receiver:
          json['receiver'] != null ? User.fromJson(json['receiver']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender'] = sender;
    data['subject'] = subject;
    data['message'] = message;
    data['duration'] = duration;
    data['receiver'] = receiver;

    return data;
  }
}
