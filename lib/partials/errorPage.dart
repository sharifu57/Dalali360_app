import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: fullHeight,
        child: Column(
          children: [
            Container(
              height: fullHeight / 2,
              child: Center(
                child: Icon(
                  Icons.running_with_errors,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Container(
              child: Text("Sorry no Network"),
            )
          ],
        ),
      ),
    );
  }
}
