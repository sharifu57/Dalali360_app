import 'package:dalali360_app/controllers/authController.dart';
import 'package:dalali360_app/controllers/profileController.dart';
import 'package:dalali360_app/models/wardModel.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class EditProfile extends GetView<AuthController> {
  AuthController authController = Get.put(AuthController());
  TextEditingController firstName = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  ProfileController profileController = Get.put(ProfileController());
  final SingleValueDropDownController _cnt = SingleValueDropDownController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  // late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  final _dateController = TextEditingController();
  final box = GetStorage();
  EditProfile({super.key});
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF162945),
        title: Text(
          "Edit Profile",
          // "${box.read("id")}",
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Complete your Profile",
                  style: TextStyle(
                      color: Color(0xFF162945),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Container(
              //   child: Row(
              //     children: [
              //       Container(
              //         child: Text("for "),
              //       ),
              //       Container(
              //         child: Row(
              //           children: [
              //             Container(child: Text("${box.read("first_name")}")),
              //             Container(child: Text("${box.read("last_name")}")),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Container()),
                    Expanded(
                        flex: 4,
                        child: Container(
                          child: SizedBox(
                            height: 140,
                            child: Card(
                              color: Color(0xff04172B),
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(left: 0, top: 0),
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Container(
                                      child: Text(
                                        "${box.read("username")[0]}"
                                            .toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 70,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Expanded(flex: 3, child: Container())
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: Center(
                      child: Row(
                    children: [
                      Expanded(flex: 3, child: Container()),
                      Expanded(
                          flex: 4,
                          child: Center(
                            child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 13),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 5),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${box.read("first_name")}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${box.read("last_name")}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    )
                                  ],
                                )),
                          )),
                      Expanded(flex: 3, child: Container())
                    ],
                  ))),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Form(
                      key: authController.formKey,
                      child: Column(
                        children: [
                          Container(
                            child: TextFormField(
                              controller: firstName,
                              decoration: InputDecoration(
                                label: Text("Phone Number"),
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                    color: Color(0xFF11101E),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Color(0xFF11101E),
                                  size: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {},
                              onSaved: (value) {},
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              readOnly: true,
                              controller: _textEditingController,
                              decoration: InputDecoration(
                                label: Text("Date of Birth"),
                                hintText: "Date of Birth",
                                hintStyle: TextStyle(
                                    color: Color(0xFF11101E),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                                prefixIcon: Icon(
                                  Icons.calendar_month,
                                  color: Color(0xFF11101E),
                                  size: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: TextInputType.datetime,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onTap: () async {
                                selectDate(context);
                              },
                              validator: (value) {
                                profileController.dateTimeValidator(value!);
                              },
                              onSaved: (value) {},
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: DropDownTextField(
                              textFieldDecoration: InputDecoration(
                                label: Text("Select Location"),
                                hintText: "Select Location",
                                prefixIcon: Icon(
                                  Icons.location_city_sharp,
                                  color: Color(0xFF11101E),
                                  size: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              controller: _cnt,
                              clearOption: true,
                              enableSearch: true,
                              dropDownItemCount: 6,
                              clearIconProperty:
                                  IconProperty(color: Colors.green),
                              searchDecoration: const InputDecoration(
                                  hintText: "enter your custom hint text here"),
                              dropDownList: [
                                for (var val in profileController.wards)
                                  DropDownValueModel(
                                      name: "${val.name}", value: val)
                              ],
                              onChanged: (val) {
                                profileController.onSelected(val.toString());
                              },
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: ElevatedButton(
                                      onPressed: () {}, child: Text("Update")),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final now = DateTime.now().obs;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1200),
      lastDate: DateTime(2040),
      // builder: ((context, child) {
      //   return Theme(
      //       data: ThemeData.dark().copyWith(
      //         colorScheme: ColorScheme.dark(
      //           primary: Colors.deepPurple,
      //           onPrimary: Colors.white,
      //           surface: Colors.blueGrey,
      //           onSurface: Colors.yellow,
      //         ),
      //         dialogBackgroundColor: Colors.blue[500],
      //       ),
      //       child: Container());
      // }
    );
    if (picked != null) {
      selectedDate = picked;
      _textEditingController
        ..text = DateFormat.yMMMEd().format(selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}
