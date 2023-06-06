import 'package:dalali360_app/controllers/propertyController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Success extends GetView<PropertyController> {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Expanded(
                child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Center(
                      child: Icon(
                        Icons.add_task,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("Property DEtails"),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
