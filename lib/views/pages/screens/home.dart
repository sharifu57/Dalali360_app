import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/controllers/categoryController.dart';
import 'package:dalali360_app/controllers/locationController.dart';
import 'package:dalali360_app/controllers/propertyController.dart';
import 'package:dalali360_app/partials/search.dart';
import 'package:dalali360_app/providers/NetworkManager.dart';
import 'package:dalali360_app/upload/upload_property.dart';
import 'package:dalali360_app/views/pages/category/categories.dart';
import 'package:dalali360_app/views/pages/category/view_one_category.dart';
import 'package:dalali360_app/views/pages/dalali/login.dart';
import 'package:dalali360_app/views/pages/property/add_new_property.dart';
import 'package:dalali360_app/views/pages/property/view_one_property.dart';
import 'package:dalali360_app/views/pages/request/userRequest.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class Home extends GetView<PropertyController> {
  Home({Key? key}) : super(key: key);
  CategoryController categoryController = Get.put(CategoryController());
  LocationController locationController = Get.put(LocationController());

  PropertyController propertyController = Get.put(PropertyController());
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  final SingleValueDropDownController _cnt = SingleValueDropDownController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  // late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  final box = GetStorage();
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF162945),
          child: Icon(Icons.add),
          onPressed: () {
            box.read("token") == null
                ? Get.snackbar("Sign in", "",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Color(0xFF162945),
                    duration: Duration(seconds: 3),
                    isDismissible: true,
                    forwardAnimationCurve: Curves.easeOutBack,
                    colorText: Colors.white,
                    messageText: Material(
                      child: Container(
                        color: Color(0xFF162945),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(""),
                            ),
                            Container(
                              width: double.infinity,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          Colors.white //<-- SEE HERE
                                      ),
                                  onPressed: () {
                                    Get.to(() => Login());
                                  },
                                  child: Text(
                                    "Sign In now..".toUpperCase(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ))
                : Get.to(() => PropertyUpload());
          },
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(135),
          child: Container(
            color: const Color(0xFF162945),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 30, right: 10, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/logos/logo1.png',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                        Container(
                          child: box.read("token") == null
                              ? AvatarGlow(
                                  glowColor: Color.fromARGB(255, 255, 179, 0),
                                  endRadius: 30.0,
                                  duration: Duration(milliseconds: 2000),
                                  repeat: true,
                                  showTwoGlows: true,
                                  repeatPauseDuration:
                                      Duration(milliseconds: 100),
                                  child: Material(
                                    // Replace this child with your own
                                    elevation: 10.0,
                                    shape: CircleBorder(),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey[100],
                                      radius: 18.0,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                            onPressed: () {
                                              Get.to(() => SendRequest());
                                            },
                                            icon: const Icon(
                                              Icons.telegram,
                                              size: 20,
                                            )),
                                      ),
                                    ),
                                  ),
                                )
                              : IconButton(
                                  icon: const Icon(
                                    Icons.message,
                                    size: 17,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 5),
                    height: 40,
                    child: box.read("token") == null
                        ? Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${propertyController.greeting()}",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Welcome,",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${box.read('first_name')}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                          "${box.read('last_name')}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Text(
                                      "${propertyController.greeting()}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.headline1?.fontSize,
                            color: Theme.of(context).textTheme.headline1?.color,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .headline1
                                ?.fontWeight),
                      ),
                      TextButton(
                          onPressed: () {
                            // Get.to(Categories());
                          },
                          child: const Text('View All'))
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    height: 60,
                    child: categoryController.categories.isEmpty
                        ? Container(
                            child: SpinKitChasingDots(
                            color: Color(0xFF162945),
                            size: 30.0,
                          ))
                        : Obx(() {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categoryController.categories.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(right: 0),
                                      child: GestureDetector(
                                          onTap: () {
                                            categoryController
                                                .getCategoryProperties(
                                                    int.parse(categoryController
                                                        .categories[index].id!
                                                        .toString()));
                                            Get.to(() => Category(),
                                                arguments: {
                                                  "id": categoryController
                                                      .categories[index].id,
                                                  "name": categoryController
                                                      .categories[index].name
                                                },
                                                preventDuplicates: true);
                                          },
                                          child: Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Color(0xFF11101E)
                                                  //<-- SEE HERE
                                                  ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            color: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 10, 20, 10),
                                              child: Center(
                                                child: Text(
                                                  "${categoryController.categories[index].name}",
                                                  style: const TextStyle(
                                                      color: Color(0xFF11101E)),
                                                ),
                                              ),
                                            ),
                                          )));
                                });
                          })),
                Container(
                  padding: EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          'New Added',
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.fontSize,
                              color:
                                  Theme.of(context).textTheme.headline1?.color,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.fontWeight),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 5.0,
                          crossAxisSpacing: 7.0,
                        ),
                        itemCount: propertyController.featureds.length,
                        itemBuilder: (BuildContext context, index) {
                          return IgnorePointer(
                            ignoring: true,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => ViewProperty(),
                                    arguments: {
                                      "id": propertyController
                                          .featureds[index].id,
                                      "name": propertyController
                                          .featureds[index].name,
                                      "price": propertyController
                                          .featureds[index].price,
                                      "description": propertyController
                                          .featureds[index].description,
                                      "ward": propertyController
                                          .featureds[index].ward?.name,
                                      "image": propertyController
                                          .featureds[index].image,
                                      "username": propertyController
                                          .featureds[index].user?.username,
                                      "first_name": propertyController
                                          .featureds[index].user?.first_name,
                                      "email": propertyController
                                          .featureds[index].user?.email,
                                      "user_id": propertyController
                                          .featureds[index].user?.id,
                                    },
                                    preventDuplicates: true);
                              },
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 5,
                                child: Card(
                                  elevation: 2,
                                  color: const Color(0xFF11101E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  child: propertyController
                                                              .featureds[index]
                                                              .image ==
                                                          null
                                                      ? Image.asset(
                                                          'assets/images/def.jpg',
                                                          fit: BoxFit.contain,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                        )
                                                      : Image.network(
                                                          '$path${propertyController.featureds[index].image}',
                                                          fit: BoxFit.contain,
                                                          width:
                                                              double.infinity,
                                                          height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height,
                                                        ),
                                                ),
                                                Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: Card(
                                                      color: Colors.red,
                                                      child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          child: Text(
                                                            "${propertyController.featureds[index].category?.name}",
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        10),
                                                          )),
                                                    ))
                                              ],
                                            )),
                                      )),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                10,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Card(
                                            color: const Color(0xFF11101E),
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          "price",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "${propertyController.featureds[index].price}",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 2),
                                                              child: const Text(
                                                                "Tsh",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        11),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .location_city_rounded,
                                                            color: Colors.grey,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "${propertyController.featureds[index].ward?.name}",
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        )));
  }

  showAlertDialog(BuildContext context) {
    return const AlertDialog(
      title: Text("Upload new Property"),
    );
  }

  void opeLoginSnackbar() {
    Get.snackbar(
      '',
      '',
      messageText: Material(
        child: Container(
          height: 100,
          child: Column(
            children: [
              const Text("Sign in"),
              Expanded(
                  child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Email/phone"))
                ],
              ))
            ],
          ),
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
