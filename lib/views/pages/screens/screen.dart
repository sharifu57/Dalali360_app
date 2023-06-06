import 'package:dalali360_app/views/pages/mail/messages.dart';
import 'package:dalali360_app/views/pages/screens/home.dart';
import 'package:dalali360_app/views/pages/screens/location.dart';

import 'package:dalali360_app/views/pages/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Screen extends StatefulWidget {
  Screen({Key? key}) : super(key: key);
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int _selectedIndex = 0;
  final box = GetStorage();
  @override
  void initState() {
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Center(
        child: Home(),
      ),
      Center(child: LocationView()),
      Center(
        child: Messages(),
      ),
      Center(
        child: Settings(),
      )
    ];
    return Scaffold(
        body: Center(
          child: tabs.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 0, blurRadius: 20),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              child: BottomNavigationBar(
                //  type: BottomNavigationBarType.shifting,
                unselectedItemColor: Colors.black54,
                backgroundColor: Colors.white,
                elevation: 10,
                iconSize: 15,

                selectedIconTheme:
                    const IconThemeData(color: Color(0xff04172B), size: 15),
                selectedItemColor: const Color(0xFF11101E),
                mouseCursor: SystemMouseCursors.grab,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w600),
                unselectedIconTheme: const IconThemeData(
                  color: Colors.black54,
                ),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.share_location_sharp),
                    label: 'Location',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message_outlined),
                    label: 'Messages',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
                currentIndex: _selectedIndex, //New
                onTap: _onItemTapped,
              ),
            )));
  }
}
