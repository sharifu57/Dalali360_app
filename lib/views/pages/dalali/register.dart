import 'package:dalali360_app/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Register extends GetView<AuthController> {
  Register({Key? key}) : super(key: key);
  TextEditingController phoneNumberController =
      TextEditingController(text: '255');
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double fullHeight = size.height;
    final double halfHeight = size.height / 2.0;
    final double logoWidth = size.width / 1.2;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: fullHeight,
          color: Color(0xFF11101E),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
                child: Center(
                  child: Image.asset(
                    'assets/logos/logo1.png',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width / 2.4,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: SizedBox(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 2,
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
                              child: Column(
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.only(bottom: 20, top: 10),
                                      child: Text(
                                        "Register New Account",
                                        style: TextStyle(
                                            color: Color(0xFF11101E),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )),
                                  Form(
                                    key: authController.formKey,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          bottom: 10, left: 10, right: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "First Name",
                                                            hintStyle: TextStyle(
                                                                color: Color(
                                                                    0xFF11101E),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .personal_injury,
                                                              color: Color(
                                                                  0xFF11101E),
                                                              size: 14,
                                                            )),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    validator: (value) {
                                                      return authController
                                                          .nameValidator(
                                                              value!);
                                                    },
                                                    onSaved: (value) {
                                                      authController.formData[
                                                              'first_name'] =
                                                          value!;
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  child: TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "Last Name",
                                                            hintStyle: TextStyle(
                                                                color: Color(
                                                                    0xFF11101E),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            prefixIcon: Icon(
                                                              Icons.person,
                                                              color: Color(
                                                                  0xFF11101E),
                                                              size: 14,
                                                            )),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    validator: (value) {
                                                      return authController
                                                          .nameValidator(
                                                              value!);
                                                    },
                                                    onSaved: (value) {
                                                      authController.formData[
                                                          'last_name'] = value!;
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  child: TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "User Name",
                                                            hintStyle: TextStyle(
                                                                color: Color(
                                                                    0xFF11101E),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .person_add_disabled_sharp,
                                                              color: Color(
                                                                  0xFF11101E),
                                                              size: 14,
                                                            )),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    validator: (value) {
                                                      return authController
                                                          .nameValidator(
                                                              value!);
                                                    },
                                                    onSaved: (value) {
                                                      authController.formData[
                                                          'username'] = value!;
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText: "Email",
                                                            hintStyle: TextStyle(
                                                                color: Color(
                                                                    0xFF11101E),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .mark_email_read_rounded,
                                                              color: Color(
                                                                  0xFF11101E),
                                                              size: 14,
                                                            )),
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    // autovalidateMode:
                                                    //     AutovalidateMode
                                                    //         .onUserInteraction,
                                                    validator: (value) {
                                                      return authController
                                                          .emailValidator(
                                                              value!);
                                                    },
                                                    onSaved: (value) {
                                                      authController.formData[
                                                          'email'] = value!;
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "Password",
                                                            hintStyle: TextStyle(
                                                                color: Color(
                                                                    0xFF11101E),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            prefixIcon: Icon(
                                                              Icons.security,
                                                              color: Color(
                                                                  0xFF11101E),
                                                              size: 14,
                                                            )),
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    // autovalidateMode:
                                                    //     AutovalidateMode
                                                    //         .onUserInteraction,
                                                    obscureText: true,
                                                    validator: (value) {
                                                      return authController
                                                          .passwordValidator(
                                                              value!);
                                                    },
                                                    onSaved: (value) {
                                                      authController.formData[
                                                          'password'] = value!;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child:
                                                authController
                                                            .isLoading.value ==
                                                        true
                                                    ? Container(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              Color(0xFF11101E),
                                                          strokeWidth: 2,
                                                        ),
                                                      )
                                                    : Container(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 50,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 0,
                                                                        bottom:
                                                                            10),
                                                                child: OutlinedButton
                                                                    .icon(
                                                                        style: OutlinedButton.styleFrom(
                                                                            backgroundColor: Color(
                                                                                0xFF11101E) //<-- SEE HERE
                                                                            ),
                                                                        onPressed:
                                                                            () {
                                                                          Get.showSnackbar(
                                                                            GetSnackBar(
                                                                              title: 'Success!',
                                                                              message: 'User Registered Successfully',
                                                                              icon: const Icon(Icons.refresh),
                                                                              duration: const Duration(seconds: 3),
                                                                            ),
                                                                          );
                                                                          authController
                                                                              .CreateDalali();
                                                                        },
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .lock_person_rounded,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        label:
                                                                            Text(
                                                                          "Register",
                                                                          style: TextStyle(
                                                                              fontSize: 13,
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold),
                                                                        ))),
                                                          ],
                                                        ),
                                                      ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

class CustomContainerShapeBorder extends CustomPainter {
  final double height;
  final double width;
  final Color fillColor;
  final double radius;
  CustomContainerShapeBorder({
    this.height: 400.0,
    this.width: 300.0,
    this.fillColor: Colors.white,
    this.radius: 50.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    path.moveTo(0.0, -radius);
    path.lineTo(0.0, -(height - radius));
    path.conicTo(0.0, -height, radius, -height, 1);
    path.lineTo(width - radius, -height);
    path.conicTo(width, -height, width, -(height + radius), 1);
    path.lineTo(width, -(height - radius));
    path.lineTo(width, -radius);

    path.conicTo(width, 0.0, width - radius, 0.0, 1);
    path.lineTo(radius, 0.0);
    path.conicTo(0.0, 0.0, 0.0, -radius, 1);
    path.close();
    canvas.drawPath(path, Paint()..color = fillColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
