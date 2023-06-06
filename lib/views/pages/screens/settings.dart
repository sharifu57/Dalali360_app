import 'package:dalali360_app/controllers/settingsController.dart';
import 'package:dalali360_app/views/pages/dalali/login.dart';
import 'package:dalali360_app/views/pages/dalali/register.dart';
import 'package:dalali360_app/views/pages/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Settings extends GetView<SettingsController> {
  Settings({super.key});
  final box = GetStorage();

  SettingsController settingsControlller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    double fullWidth = MediaQuery.of(context).size.width;

    return box.read("token") == null
        ? Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    Container(
                      child: Image.asset(
                        'assets/logos/logo.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 2.6,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
                      alignment: Alignment.center,
                      child: Text(
                          "The most popular and simplest approach for all agents and users who needs to get the property"),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: GestureDetector(
                        onTap: () {
                          print("===facebook login");
                        },
                        child: Card(
                          color: Colors.blue[700],
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.facebook,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 50),
                                  alignment: Alignment.center,
                                  child: Center(
                                    child: Text(
                                      "CONTINUE WITH FACEBOOK",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: OutlinedButton(
                                  onPressed: () {
                                    Get.to(Login());
                                  },
                                  child: Text(
                                    "SIGN IN",
                                    style: TextStyle(
                                        color: Color(0xFF162945),
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: OutlinedButton(
                                  onPressed: () {
                                    Register();
                                  },
                                  child: Text(
                                    "REGISTER",
                                    style: TextStyle(
                                        color: Color(0xFF162945),
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                color: Colors.white,
                height: fullHeight,
                width: double.infinity,
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/logos/logo1.png'),
                              radius: 60,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Expanded(flex: 3, child: Container()),
                                Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: 2),
                                            child: Text(
                                              '${box.read("first_name")}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 2),
                                            child: Text(
                                              '${box.read("last_name")}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Expanded(flex: 3, child: Container())
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text("${box.read("email")}"),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: ActionChip(
                                onPressed: () {
                                  print("profile edti**");
                                },
                                backgroundColor: Color(0xFF162945),
                                label: Text(
                                  'Edit Profile',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        children: [
                          Card(
                            elevation: 0,
                            child: GestureDetector(
                              onTap: () {
                                print("---- show Card clieck");
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: 12),
                                            child: Icon(
                                              Icons.settings,
                                              size: 25,
                                            ),
                                          ),
                                          Container(
                                            child: Text('Settings'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 0,
                            child: GestureDetector(
                              onTap: () {
                                print("---- show Card clieck");
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: 12),
                                            child: Icon(
                                              Icons.local_activity_rounded,
                                              size: 25,
                                            ),
                                          ),
                                          Container(
                                            child: Text('Activities'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 0,
                            child: GestureDetector(
                              onTap: () {
                                print("---- show Card clieck");
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: 12),
                                            child: Icon(
                                              Icons.people_outline_rounded,
                                              size: 25,
                                            ),
                                          ),
                                          Container(
                                            child: Text('Customers'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 0,
                            child: GestureDetector(
                              onTap: () {
                                print("---- show Card clieck");
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: 12),
                                            child: Icon(
                                              Icons.private_connectivity,
                                              size: 25,
                                            ),
                                          ),
                                          Container(
                                            child: Text('Privacy & Policies'),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Card(
                            elevation: 0,
                            child: GestureDetector(
                              onTap: () {
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: const Text(
                                      'Are you sure you want to logout?'),
                                  action: SnackBarAction(
                                    label: 'Yes',
                                    onPressed: () {
                                      print("yeeeees");
                                      Get.to(Screen());
                                      box.remove("token");
                                    },
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(right: 12),
                                            child: Icon(
                                              Icons.restart_alt_sharp,
                                              size: 25,
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'Logout',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
  }
}
