import 'package:dalali360_app/views/pages/mail/contacts.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'uniqueTag',
        label: Row(
          children: [Icon(Icons.add), Text('chat')],
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Contacts()));
        },
      ),
    );
  }
}
