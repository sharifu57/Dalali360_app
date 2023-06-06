import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/controllers/customerController.dart';
import 'package:dalali360_app/models/customerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ViewDalali extends StatelessWidget {
  ViewDalali({super.key});
  CustomerController customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                          child: SizedBox(
                              width: double.infinity,
                              height: 140,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    child: Get.arguments['picture'] == null
                                        ? Container(
                                            child: Center(
                                              child: Text("N"),
                                            ),
                                          )
                                        : Image.network(
                                            '$path${Get.arguments['picture']}',
                                            fit: BoxFit.cover,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                          ),
                                  ))),
                        )),
                    Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child:
                                      // ignore: unnecessary_null_comparison
                                      Text("${Get.arguments['first_name']}") ==
                                              null
                                          ? Text(
                                              "${Get.arguments['username']}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          : Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            " ${Get.arguments['first_name']}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          Text(" "),
                                                          Text(
                                                            "${Get.arguments['last_name']}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 5),
                              child: Text("${Get.arguments['location_name']}"),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              child: Container(
                                padding: EdgeInsets.only(left: 5, bottom: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${Get.arguments['dalali_number']}",
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "About",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text("${Get.arguments['about']}")),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Contact Details ",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Phone Number: ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('${Get.arguments['phone']}'),
                              Container(
                                child: IconButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                              text:
                                                  "${Get.arguments['phone']}"))
                                          .then((value) =>
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                backgroundColor:
                                                    Colors.blueAccent,
                                                content: const Text(
                                                  'Phone number copied!',
                                                ),
                                                action: SnackBarAction(
                                                  label: 'Undo',
                                                  onPressed: () {},
                                                ),
                                              )));
                                    },
                                    icon: Icon(
                                      Icons.copy,
                                      color: Colors.black,
                                      size: 18,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text('${Get.arguments['email']}')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
