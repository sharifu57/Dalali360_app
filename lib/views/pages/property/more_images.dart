import 'package:dalali360_app/controllers/propertyController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Images extends GetView<PropertyController> {
  PropertyController propertyController = Get.put(PropertyController());
  Images({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                child: Text("More Images"),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.red,
                child: Obx(() => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 7.0,
                    ),
                    itemCount: propertyController.images.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_box,
                                size: 30,
                                color: Colors.white,
                              )),
                        ),
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
