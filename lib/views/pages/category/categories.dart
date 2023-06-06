import 'package:dalali360_app/config.dart';
import 'package:dalali360_app/controllers/categoryController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Categories extends GetView<CategoryController> {
  Categories({super.key});
  CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Select Category"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 115,
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                    child: Container(
                                  child: SizedBox(
                                    height: 90,
                                    width: 2,
                                    child: Card(
                                      // color: Color(0xff04172B),
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100.0),
                                        ),
                                      ),
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 0, top: 0),
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            child: Container(
                                                child: Icon(
                                              Icons.all_inbox,
                                              size: 30,
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))),
                            Expanded(
                                flex: 4,
                                child: Container(
                                  child: Container(
                                    child: Text(
                                      "All".toUpperCase(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                )),
                            Expanded(flex: 3, child: Container())
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                child: categoryController.categories.isEmpty
                    ? Container(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                    : Obx(() => ListView.builder(
                        itemCount: categoryController.categories.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            child: GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: 115,
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                                child: Container(
                                              child: SizedBox(
                                                height: 90,
                                                width: 2,
                                                child: Card(
                                                  color: Color(0xff04172B),
                                                  elevation: 0,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(100.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 0, top: 0),
                                                    child: Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                        child: categoryController
                                                                .categories[
                                                                    index]
                                                                .icon!
                                                                .isEmpty
                                                            ? Container(
                                                                child: Center(
                                                                  child:
                                                                      Text("!"),
                                                                ),
                                                              )
                                                            : Container(
                                                                child: Image
                                                                    .network(
                                                                '$path${categoryController.categories[index].icon}',
                                                                fit: BoxFit
                                                                    .contain,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    2,
                                                              )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ))),
                                        Expanded(
                                            flex: 4,
                                            child: Container(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                "${categoryController.categories[index].name}"
                                                    .toUpperCase(),
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            )),
                                        Expanded(flex: 3, child: Container())
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
