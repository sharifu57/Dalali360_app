import 'dart:convert';

import 'package:dalali360_app/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contacts extends StatefulWidget {
  const Contacts({super.key});
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  Map<String, dynamic> contacts = {};
  var dio = Dio();

  @override
  void initState() {
    super.initState();
    getDalaliContacts();
  }

  Future getDalaliContacts() async {
    var url = Uri.parse("${config['apiBaseUrl']!}/users");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);
        print(decodedResponse);

        setState(() {
          contacts = decodedResponse;
        });

        print("-------------contacts");
        print(contacts);
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (error) {
      print("Error occurred: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: ListView.separated(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                "${contacts[index]?['id']}",
                style: TextStyle(color: Colors.black),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.grey,
              height: 1.0,
            );
          },
        ),
      ),
    );
  }
}
