import 'package:dalali360_app/controllers/propertyController.dart';
import 'package:dalali360_app/image_upload/image.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// import 'package:radio_button_form_field/radio_button_form_field.dart';

class AddNewProperty extends StatelessWidget {
  final PropertyController propertyController = Get.put(PropertyController());
  final SingleValueDropDownController _cnt = SingleValueDropDownController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  File? pickFile;
  ImagePicker imagePicker = ImagePicker();

  AddNewProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF0B2239),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 0, top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Fill the Details Below",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 0),
                child: Form(
                  key: propertyController.propertyKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration.collapsed(hintText: ''),
                          onSaved: (value) {
                            propertyController.formData['image'] =
                                propertyController.image.value;
                          },
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                        child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ImageUpload()));
                                        // print("==press onPress");
                                        // showModalBottomSheet(
                                        //     context: context,
                                        //     builder: (context) =>
                                        //         bottomSheet(context));
                                      },
                                      child: const SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Card(
                                          color:
                                              Color.fromARGB(255, 17, 0, 254),
                                          child: Center(
                                              child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                                        ),
                                      ),
                                    )),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Text('Upload Image'),
                                  )
                                ],
                              ),
                            ),
                            Obx(() => propertyController.isVisible.value == true
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 50,
                                        child: Obx(() => propertyController
                                                    .image.value ==
                                                ''
                                            ? const Text(
                                                'Select image from camera/gallery')
                                            : Image.file(File(propertyController
                                                .image.value))),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Obx(() => Text(propertyController
                                                  .selectedImageSize.value ==
                                              ''
                                          ? ''
                                          : propertyController
                                              .selectedImageSize.value)),
                                      Container(
                                          child: IconButton(
                                              onPressed: () {
                                                propertyController
                                                    .removeImage();
                                              },
                                              icon: Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              )))
                                    ],
                                  )
                                : Text('')),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 20, top: 20),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Property(Owner name)",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 0),
                                child: TextFormField(
                                  enabled: true,
                                  decoration: const InputDecoration(
                                    hintText: "eg: nyumba za zungu",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF11101E),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: Icon(
                                      Icons.money,
                                      color: Color(0xFF11101E),
                                      size: 14,
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return propertyController
                                        .nameValidator(value!);
                                  },
                                  onSaved: (value) {
                                    propertyController.formData['name'] =
                                        value!;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Price",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 0),
                                child: TextFormField(
                                  enabled: true,
                                  decoration: const InputDecoration(
                                    hintText: "ex: 150000",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF11101E),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    prefixIcon: Icon(
                                      Icons.money,
                                      color: Color(0xFF11101E),
                                      size: 14,
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return propertyController
                                        .priceValidator(value!);
                                  },
                                  onSaved: (value) {
                                    propertyController.formData['price'] =
                                        value!;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: DropDownTextField(
                            textFieldDecoration: const InputDecoration(
                              label: Text("Select Location"),
                              hintText: "Select Location",
                              prefixIcon: Icon(
                                Icons.location_city_sharp,
                                color: Color(0xFF11101E),
                                size: 14,
                              ),
                            ),
                            controller: _cnt,
                            clearOption: true,
                            enableSearch: true,
                            dropDownItemCount: 6,
                            clearIconProperty:
                                IconProperty(color: Colors.green),
                            searchDecoration: const InputDecoration(
                                hintText: "Search Location"),
                            dropDownList: [
                              for (var ward in propertyController.wards)
                                DropDownValueModel(
                                  name: "${ward.name}",
                                  value: ward.id,
                                )
                            ],
                            validator: (value) {
                              return propertyController.nameValidator(value!);
                            },
                            onChanged: (value) {
                              propertyController.formData['ward'] =
                                  value?.value;
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: DropDownTextField(
                            textFieldDecoration: const InputDecoration(
                              label: Text("Select Category"),
                              hintText: "Select Category",
                              hintStyle: TextStyle(fontSize: 13),
                              prefixIcon: Icon(
                                Icons.location_city_sharp,
                                color: Color(0xFF11101E),
                                size: 14,
                              ),
                            ),
                            controller: _cnt,
                            clearOption: true,
                            enableSearch: true,
                            dropDownItemCount: 6,
                            clearIconProperty:
                                IconProperty(color: Colors.green),
                            searchDecoration: const InputDecoration(
                                hintText: "Search Category",
                                hintStyle: TextStyle(fontSize: 13)),
                            dropDownList: [
                              for (var category
                                  in propertyController.categories)
                                DropDownValueModel(
                                    name: "${category.name}",
                                    value: category.id)
                            ],
                            validator: (value) {
                              return propertyController.nameValidator(value!);
                            },
                            onChanged: (value) {
                              propertyController.formData['category'] =
                                  value?.value;
                              // propertyController.formData['category'] =
                              //     value ?? '';
                            },
                          ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(top: 20),
                        //   child: DropDownTextField(
                        //     textFieldDecoration: const InputDecoration(
                        //       label: Text("Luku Meter"),
                        //       hintText: "Luku Meter",
                        //       hintStyle: TextStyle(fontSize: 13),
                        //       prefixIcon: Icon(
                        //         Icons.location_city_sharp,
                        //         color: Color(0xFF11101E),
                        //         size: 14,
                        //       ),
                        //     ),
                        //     controller: _cnt,
                        //     clearOption: true,
                        //     enableSearch: true,
                        //     dropDownItemCount: 5,
                        //     clearIconProperty:
                        //         IconProperty(color: Colors.green),
                        //     searchDecoration: const InputDecoration(
                        //         hintText: "Search Option",
                        //         hintStyle: TextStyle(fontSize: 13)),
                        //     dropDownList: const [
                        //       DropDownValueModel(name: "Single", value: 1),
                        //       DropDownValueModel(
                        //           name: "2 Rooms Shared", value: 2),
                        //       DropDownValueModel(
                        //           name: "3 Rooms share", value: 3),
                        //       DropDownValueModel(
                        //           name: "4 Rooms share", value: 4),
                        //       DropDownValueModel(
                        //           name: "More than 4 Rooms", value: 5),
                        //     ],
                        //     validator: (value) {
                        //       return propertyController.nameValidator(value!);
                        //     },
                        //     onChanged: (value) {
                        //       propertyController.formData['luku'] =
                        //           value?.value;
                        //     },
                        //   ),
                        // ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 20, top: 20),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: TextFormField(
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      labelText: '',
                                      hintText: "describe your property",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF11101E),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                      prefixIcon: Icon(
                                        Icons.text_fields_rounded,
                                        color: Color(0xFF11101E),
                                        size: 14,
                                      ),
                                      // border: OutlineInputBorder(),
                                    ),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      return propertyController
                                          .priceValidator(value!);
                                    },
                                    onSaved: (value) {
                                      propertyController
                                          .formData['description'] = value!;
                                    },
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          //                             // ignore: unrelated_type_equality_checks
                          child: propertyController.isLoading == true
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                  strokeWidth: 2,
                                )
                              : Container(
                                  width: double.infinity,
                                  child: OutlinedButton.icon(
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor:
                                              Color(0xFF162945) //<-- SEE HERE
                                          ),
                                      onPressed: () {
                                        propertyController.createProperty();
                                      },
                                      icon: Icon(
                                        Icons.upload,
                                        color: Colors.white,
                                        size: 13,
                                      ),
                                      label: Text(
                                        "Upload Property",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * 0.2,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 35),
                child: Text(
                  "Chosse Photo",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline1?.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.headline1?.fontWeight),
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        // selectPhoto(ImageSource.gallery);
                        propertyController.getImage(ImageSource.gallery);
                      },
                      child: Container(
                        child: Column(children: [
                          Container(
                              child: Icon(
                            Icons.image,
                            size: 40,
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Gallery')
                        ]),
                      )),
                  InkWell(
                      onTap: () {
                        // selectPhoto(ImageSource.camera);
                        propertyController.getImage(ImageSource.camera);
                      },
                      child: Container(
                        child: Column(children: [
                          Container(
                              child: Icon(
                            Icons.camera,
                            size: 40,
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Camera')
                        ]),
                      ))
                ],
              ),
            )
          ],
        ));
  }

  Future<void> selectPhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickFile = File(pickedImage!.path);
  }
}
