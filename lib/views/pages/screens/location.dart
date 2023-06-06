import 'package:dalali360_app/controllers/locationController.dart';
import 'package:dalali360_app/controllers/searchController.dart';
import 'package:dalali360_app/views/pages/location/properties_by_location_id.dart';
import 'package:dalali360_app/views/pages/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationView extends GetView<LocationController> {
  LocationView({Key? key}) : super(key: key);
  LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF162945),
          leading: Icon(
            Icons.table_chart,
            size: 14,
          ),
          title: Text(
            "Location",
            style: TextStyle(fontSize: 13),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => Screen());
                },
                icon: const Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.white,
                ))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            locationController.getWards();
            await Future.delayed(const Duration(seconds: 2));
          },
          child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 0),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        child: Card(
                          child: TextField(
                            onChanged: locationController.search,
                            decoration: const InputDecoration(
                              hintText: 'Search...',
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Visibility(
                            visible: locationController.isLoaded.value,
                            replacement: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: Obx(() => ListView.builder(
                                itemCount: locationController.wards.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: locationController.wards.isEmpty
                                          ? Center(
                                              child: Column(
                                                children: const [
                                                  Icon(
                                                    Icons
                                                        .hourglass_empty_rounded,
                                                    color: Color(0xFF162945),
                                                    size: 30,
                                                  ),
                                                  Text(
                                                    "No wards found",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                locationController
                                                    .dalaliByWardId(int.parse(
                                                        locationController
                                                            .wards[index].id!
                                                            .toString()));
                                                locationController
                                                    .PropertiesByLocationId(
                                                        int.parse(
                                                            locationController
                                                                .wards[index]
                                                                .id!
                                                                .toString()));
                                                Get.to(() => ViewLocation(),
                                                    arguments: {
                                                      "id": locationController
                                                          .wards[index].id,
                                                      "name": locationController
                                                          .wards[index].name,
                                                      "index":
                                                          locationController
                                                              .wards[index]
                                                    },
                                                    preventDuplicates: true);
                                              },
                                              child: Card(
                                                elevation: 3,
                                                color: Color(0xFF162945),
                                                child: Container(
                                                  padding: EdgeInsets.all(3),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                              child: Container(
                                                            child: SizedBox(
                                                              height: 60,
                                                              width: 1,
                                                              child: Card(
                                                                color: const Color(
                                                                    0xff04172B),
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius.circular(
                                                                        100.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 0,
                                                                      top: 0),
                                                                  child: Center(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                      child:
                                                                          Text(
                                                                        "${locationController.wards[index].name?[0]}"
                                                                            .toUpperCase(),
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ))),
                                                      Expanded(
                                                          flex: 7,
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Text(
                                                              "${locationController.wards[index].name}"
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12),
                                                            ),
                                                          )),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    locationController.dalaliByWardId(int.parse(locationController
                                                                        .wards[
                                                                            index]
                                                                        .id!
                                                                        .toString()));
                                                                    locationController.PropertiesByLocationId(int.parse(locationController
                                                                        .wards[
                                                                            index]
                                                                        .id!
                                                                        .toString()));
                                                                    Get.to(
                                                                        () =>
                                                                            ViewLocation(),
                                                                        arguments: {
                                                                          "id": locationController
                                                                              .wards[index]
                                                                              .id,
                                                                          "name": locationController
                                                                              .wards[index]
                                                                              .name
                                                                        },
                                                                        preventDuplicates:
                                                                            true);
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_forward_ios_rounded,
                                                                    size: 12,
                                                                    color: Color(
                                                                        0xFFEB1510),
                                                                  )))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ));
                                })),
                          )))
                ],
              )),
        ));
  }
}
