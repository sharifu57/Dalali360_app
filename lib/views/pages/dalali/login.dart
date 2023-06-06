import 'package:dalali360_app/controllers/authController.dart';
import 'package:dalali360_app/views/pages/dalali/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetView<AuthController> {
  Login({Key? key}) : super(key: key);
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double fullHeight = size.height;
    final double halfHeight = size.height / 2.8;
    final double logoWidth = size.width / 1.2;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: fullHeight,
          color: Color(0xFF162945),
          child: Column(
            children: [
              Container(
                height: halfHeight,
                child: Center(
                  child: Image.asset(
                    'assets/logos/logo1.png',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width / 2.4,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 20, top: 25),
                          child: Center(
                            child: Text("Login to Dalali360",
                                style: TextStyle(
                                    color: Color(0xFF162945),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ),
                        ),
                        Form(
                            key: authController.loginKey,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: "Username",
                                          hintStyle: TextStyle(
                                              color: Color(0xFF11101E),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Color(0xFF11101E),
                                            size: 14,
                                          )),
                                      keyboardType: TextInputType.emailAddress,
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        return authController
                                            .nameValidator(value!);
                                      },
                                      onSaved: (value) {
                                        authController.formData['username'] =
                                            value!;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Color(0xFF11101E),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                          prefixIcon: Icon(
                                            Icons.security,
                                            color: Color(0xFF11101E),
                                            size: 14,
                                          )),
                                      keyboardType: TextInputType.emailAddress,
                                      // autovalidateMode:
                                      //     AutovalidateMode.onUserInteraction,
                                      obscureText: true,
                                      validator: (value) {
                                        return authController
                                            .passwordValidator(value!);
                                      },
                                      onSaved: (value) {
                                        authController.formData['password'] =
                                            value!;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          authController.isLoading.value == true
                                              ? Container(
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 1,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              : Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 45,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0, bottom: 10),
                                                  child: OutlinedButton.icon(
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFF162945) //<-- SEE HERE
                                                              ),
                                                      onPressed: () {
                                                        authController
                                                            .LoginDalali();
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .lock_person_rounded,
                                                        color: Colors.white,
                                                        size: 13,
                                                      ),
                                                      label: Text(
                                                        "Login",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ))),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Forgot Password?",
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                ),
                                                Container(
                                                  child: TextButton(
                                                      onPressed: () {
                                                        Get.to(Register());
                                                      },
                                                      child: Text(
                                                        "Register Account",
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      )),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
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
              )),
              Container(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
