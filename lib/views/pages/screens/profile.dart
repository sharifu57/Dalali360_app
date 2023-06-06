import 'package:dalali360_app/controllers/profileController.dart';
import 'package:dalali360_app/views/pages/dalali/login.dart';
import 'package:dalali360_app/views/pages/dalali/register.dart';
import 'package:dalali360_app/views/pages/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import "string_extension.dart";

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final box = GetStorage();
  ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    // final box = GetStorage();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
      ),
    );
    // return Container(
    //     height: MediaQuery.of(context).size.height,
    //     color: Colors.white,
    //     child: box.read("token") == null
    //         ? Container(
    //             child: Column(
    //               children: [
    //                 Container(
    //                   height: MediaQuery.of(context).size.height / 3.8,
    //                 ),
    //                 Container(
    //                   child: Container(
    //                     child: Center(
    //                       child: Image.asset(
    //                         'assets/logos/logo.png',
    //                         fit: BoxFit.contain,
    //                         width: MediaQuery.of(context).size.width / 2.4,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   // height: MediaQuery.of(context).size.height / 3,
    //                   child: Column(
    //                     children: [
    //                       Container(
    //                         padding: EdgeInsets.only(
    //                             top: 20, right: 20, left: 20, bottom: 10),
    //                         child: Text(
    //                           "Register/Login as Dalali ",
    //                           style: TextStyle(
    //                               fontWeight: FontWeight.bold, fontSize: 14),
    //                         ),
    //                       ),
    //                       Container(
    //                         padding:
    //                             EdgeInsets.only(left: 15, right: 15, top: 20),
    //                         child: Column(
    //                           children: [
    //                             Container(
    //                                 width: MediaQuery.of(context).size.width,
    //                                 height: 60,
    //                                 padding: EdgeInsets.only(top: 20),
    //                                 child: OutlinedButton.icon(
    //                                     style: OutlinedButton.styleFrom(
    //                                       backgroundColor:
    //                                           Color(0xFF11101E), //<-- SEE HERE
    //                                     ),
    //                                     onPressed: () {
    //                                       Get.to(Login());
    //                                     },
    //                                     icon: Icon(
    //                                       Icons.lock_person_rounded,
    //                                       color: Colors.white,
    //                                     ),
    //                                     label: Text(
    //                                       "Login",
    //                                       style: TextStyle(
    //                                           fontSize: 13,
    //                                           color: Colors.white,
    //                                           fontWeight: FontWeight.bold),
    //                                     ))),
    //                             Container(
    //                                 height: 60,
    //                                 width: MediaQuery.of(context).size.width,
    //                                 padding: EdgeInsets.only(top: 15),
    //                                 child: OutlinedButton.icon(
    //                                     style: OutlinedButton.styleFrom(
    //                                       backgroundColor:
    //                                           Color(0xFF11101E), //<-- SEE HERE
    //                                     ),
    //                                     onPressed: () {
    //                                       Get.to(Register());
    //                                     },
    //                                     icon: Icon(
    //                                       Icons.lock_open_rounded,
    //                                       color: Colors.white,
    //                                     ),
    //                                     label: Text(
    //                                       "Register",
    //                                       style: TextStyle(
    //                                           fontSize: 13,
    //                                           color: Colors.white,
    //                                           fontWeight: FontWeight.bold),
    //                                     )))
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           )
    //         : Container(
    //             child: Scaffold(
    //                 appBar: AppBar(
    //                   backgroundColor: Color(0xFF162945),
    //                   leading: IconButton(
    //                       onPressed: () {
    //                         Get.to(Screen());
    //                       },
    //                       icon: Icon(
    //                         Icons.arrow_back_ios_new,
    //                         size: 14,
    //                       )),
    //                   title: Center(
    //                     child: Text(
    //                       "Profile",
    //                       style: TextStyle(fontSize: 13),
    //                     ),
    //                   ),
    //                   actions: [
    //                     TextButton(onPressed: () {}, child: Text("Edit"))
    //                   ],
    //                 ),
    //                 body: SingleChildScrollView(
    //                   physics: BouncingScrollPhysics(),
    //                   child: Container(
    //                     color: Colors.white,
    //                     height: MediaQuery.of(context).size.height,
    //                     child: Column(
    //                       children: [
    //                         Container(
    //                           padding: EdgeInsets.only(top: 60),
    //                         ),
    //                         Container(
    //                           child: Row(
    //                             children: [
    //                               Expanded(flex: 3, child: Container()),
    //                               Expanded(
    //                                   flex: 4,
    //                                   child: Column(
    //                                     children: [
    //                                       Container(
    //                                         child: Container(
    //                                             child: Container(
    //                                           child: SizedBox(
    //                                             height: 160,
    //                                             child: Card(
    //                                               color: Color(0xff04172B),
    //                                               shape: RoundedRectangleBorder(
    //                                                 borderRadius:
    //                                                     const BorderRadius.all(
    //                                                   Radius.circular(100.0),
    //                                                 ),
    //                                               ),
    //                                               child: Container(
    //                                                 padding: EdgeInsets.only(
    //                                                     left: 0, top: 0),
    //                                                 child: Center(
    //                                                   child: ClipRRect(
    //                                                     borderRadius:
    //                                                         BorderRadius
    //                                                             .circular(
    //                                                                 100.0),
    //                                                     child: Container(
    //                                                       child: Text(
    //                                                         "${box.read("username")[0]}"
    //                                                             .toUpperCase(),
    //                                                         style: TextStyle(
    //                                                           color:
    //                                                               Colors.white,
    //                                                           fontSize: 70,
    //                                                         ),
    //                                                       ),
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                           ),
    //                                         )),
    //                                       ),
    //                                       Container(
    //                                         padding: EdgeInsets.only(top: 10),
    //                                         child: Center(
    //                                           child: Row(
    //                                             children: [
    //                                               Container(
    //                                                 padding: EdgeInsets.only(
    //                                                     right: 5),
    //                                                 child: Text(
    //                                                   "${box.read("first_name")}",
    //                                                   style: TextStyle(
    //                                                       color:
    //                                                           Color(0xff04172B),
    //                                                       fontWeight:
    //                                                           FontWeight.bold,
    //                                                       fontSize: 25),
    //                                                 ),
    //                                               ),
    //                                               Container(
    //                                                 padding: EdgeInsets.only(
    //                                                     left: 5),
    //                                                 child: Text(
    //                                                   "${box.read("last_name")}",
    //                                                   style: TextStyle(
    //                                                       color:
    //                                                           Color(0xff04172B),
    //                                                       fontWeight:
    //                                                           FontWeight.bold,
    //                                                       fontSize: 25),
    //                                                 ),
    //                                               )
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       Container(
    //                                         padding: EdgeInsets.only(top: 5),
    //                                         child: Text(
    //                                           "${box.read("email")}",
    //                                           style: TextStyle(fontSize: 12),
    //                                         ),
    //                                       ),
    //                                       Container(
    //                                         child: TextButton.icon(
    //                                             style: OutlinedButton.styleFrom(
    //                                               backgroundColor: Colors.red,
    //                                               //<-- SEE HERE
    //                                             ),
    //                                             onPressed: () {
    //                                               // box.remove("token");
    //                                               // Get.to(Screen());

    //                                               showDialog(
    //                                                   context: context,
    //                                                   builder: (BuildContext
    //                                                       context) {
    //                                                     return AlertDialog(
    //                                                       title: Container(
    //                                                         alignment: Alignment
    //                                                             .center,
    //                                                         child: Text(
    //                                                           'Are you sure you want to proceed?',
    //                                                           style: TextStyle(
    //                                                             fontSize: 12,
    //                                                           ),
    //                                                         ),
    //                                                       ),
    //                                                       content: Container(
    //                                                         child:
    //                                                             SingleChildScrollView(
    //                                                           physics:
    //                                                               BouncingScrollPhysics(),
    //                                                           child: Column(
    //                                                             children: [],
    //                                                           ),
    //                                                         ),
    //                                                       ),
    //                                                       actions: [
    //                                                         TextButton(
    //                                                             onPressed: () =>
    //                                                                 Navigator.pop(
    //                                                                     context,
    //                                                                     'OK'),
    //                                                             child:
    //                                                                 const Text(
    //                                                               "CANCEL",
    //                                                               style: TextStyle(
    //                                                                   color: Colors
    //                                                                       .red),
    //                                                             )),
    //                                                         TextButton(
    //                                                             onPressed: () {
    //                                                               Get.to(
    //                                                                   Screen());
    //                                                               box.remove(
    //                                                                   "token");
    //                                                             },
    //                                                             child:
    //                                                                 const Text(
    //                                                               "CONTINUE",
    //                                                               style: TextStyle(
    //                                                                   color: Colors
    //                                                                       .green),
    //                                                             ))
    //                                                       ],
    //                                                     );
    //                                                   });
    //                                             },
    //                                             icon: const Icon(
    //                                               Icons.logout_rounded,
    //                                               size: 12,
    //                                               color: Colors.white,
    //                                             ),
    //                                             label: const Text(
    //                                               "Sign Out",
    //                                               style: TextStyle(
    //                                                   color: Colors.white),
    //                                             )),
    //                                       )
    //                                     ],
    //                                   )),
    //                               Expanded(flex: 3, child: Container())
    //                             ],
    //                           ),
    //                         ),
    //                         Container(
    //                             width: double.infinity,
    //                             padding: EdgeInsets.all(20),
    //                             child: Obx(() => Card(
    //                                   color: Color(0xff04172B),
    //                                   child: Padding(
    //                                     padding: EdgeInsets.all(10),
    //                                     child: Container(
    //                                       child: Row(
    //                                         mainAxisAlignment:
    //                                             MainAxisAlignment.spaceBetween,
    //                                         children: [
    //                                           Container(
    //                                             child: Column(
    //                                               children: [
    //                                                 Container(
    //                                                   child: const Text(
    //                                                     "PROPERTIES",
    //                                                     style: TextStyle(
    //                                                       color: Colors.white,
    //                                                       fontWeight:
    //                                                           FontWeight.w400,
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                                 Container(
    //                                                   padding: EdgeInsets.only(
    //                                                       top: 15),
    //                                                   child: Text(
    //                                                     "${profileController.properties.length}",
    //                                                     style: TextStyle(
    //                                                         color: Colors.white,
    //                                                         fontSize: 35),
    //                                                   ),
    //                                                 )
    //                                               ],
    //                                             ),
    //                                           ),
    //                                           Container(
    //                                             child: Column(
    //                                               children: [
    //                                                 Container(
    //                                                   child: const Text(
    //                                                     "CUSTOMERS",
    //                                                     style: TextStyle(
    //                                                       color: Colors.white,
    //                                                       fontWeight:
    //                                                           FontWeight.w400,
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                                 Container(
    //                                                   padding: EdgeInsets.only(
    //                                                       top: 15),
    //                                                   child: Text(
    //                                                     "${profileController.customers.length}",
    //                                                     style: TextStyle(
    //                                                         color: Colors.white,
    //                                                         fontSize: 35),
    //                                                   ),
    //                                                 )
    //                                               ],
    //                                             ),
    //                                           ),
    //                                           Column(
    //                                             children: [
    //                                               Container(
    //                                                 child: const Text(
    //                                                   "REQUESTS",
    //                                                   style: TextStyle(
    //                                                     color: Colors.white,
    //                                                     fontWeight:
    //                                                         FontWeight.w400,
    //                                                   ),
    //                                                 ),
    //                                               ),
    //                                               Container(
    //                                                 padding: EdgeInsets.only(
    //                                                     top: 15),
    //                                                 child: const Text(
    //                                                   "11",
    //                                                   style: TextStyle(
    //                                                       color: Colors.white,
    //                                                       fontSize: 35),
    //                                                 ),
    //                                               )
    //                                             ],
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 )))
    //                       ],
    //                     ),
    //                   ),
    //                 )),
    //           ));
  }
}
