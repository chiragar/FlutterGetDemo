import 'package:flutter/material.dart';
import 'package:flutterlivedemo/src/controller/home_controller.dart';
import 'package:flutterlivedemo/src/core/assets.dart';
import 'package:flutterlivedemo/src/ui/screen/auth/login/login_screen.dart';
import 'package:flutterlivedemo/src/ui/widget/gradient_divider.dart';
import 'package:flutterlivedemo/src/ui/screen/home/detail_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends GetView<HomeController> {
  final TextEditingController startDateEditingController =
      TextEditingController();
  final TextEditingController endDateEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Obx(() {
              return Scaffold(
                  appBar: AppBar(
                    title: Row(
                      children: [
                        SizedBox(
                          width: size.width*0.2,
                          child: TextField(
                            readOnly: true, // Make the text field read-only
                            controller: TextEditingController(text: DateFormat('yyyy-MM-dd').format( controller.startselectedDate.value)),
                            onTap: ()=>controller.startPickDate(), // Call chooseDate on tap
                            decoration: InputDecoration(
                              labelText: 'From Date',
                              icon: Icon(Icons.calendar_today),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: size.width*0.2,
                          child: TextField(
                            readOnly: true, // Make the text field read-only
                            controller: TextEditingController(text:DateFormat('yyyy-MM-dd').format( controller.endselectedDate.value)),
                            onTap: ()=>controller.endPickDate(), // Call chooseDate on tap
                            decoration: InputDecoration(
                              labelText: 'To Date',
                              icon: Icon(Icons.calendar_today),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: size.width*0.2,
                          child: ElevatedButton(
                             onPressed: ()=>{}, // Call chooseDate on tap
                           child: Text("Filter"),
                          ),
                        ),
                      ],
                    ),
                    elevation: 0,
                    actions: [
                      IconButton(
                          onPressed: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.clear();
                            Get.offAll(const LoginScreen());
                          },
                          icon: const Icon(Icons.logout))
                    ],
                  ),
                  body: Column(
                    children: [
                      Expanded(
                          child: controller.userModel.length == 0
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  itemCount: controller.groupedUsers.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final year = controller.groupedUsers.keys
                                        .toList()[index];
                                    final months = controller
                                        .groupedUsers[year]!.keys
                                        .toList();

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildContainer(year),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: months.map((month) {
                                            final candidates = controller
                                                .groupedUsers[year]![month]!;
                                            final monthName =
                                                getMonthName(month);

                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GradientDivider(),
                                                buildContainer(monthName),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: candidates
                                                      .map((users) => InkWell(
                                                            onTap: () => Get.to(
                                                                DetailScreen(
                                                                    datas:
                                                                        users)),
                                                            child: Card(
                                                              elevation: 1,
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(4),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      CustomAssets
                                                                          .gallery,
                                                                      width: size
                                                                              .width *
                                                                          0.15,
                                                                      height: size
                                                                              .width *
                                                                          0.15,
                                                                    ),
                                                                    SizedBox(
                                                                        width: size.width *
                                                                            0.02),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "Name ${users.name ?? ""}",
                                                                          style:
                                                                              const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                size.height * 0.005),
                                                                        Text(
                                                                            "Email  ${users.email ?? ""}"),
                                                                        SizedBox(
                                                                            height:
                                                                                size.height * 0.005),
                                                                        Text(
                                                                            "Hire Dt  ${users.hireDt ?? ""}"),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    );
                                  },
                                ))
                    ],
                  ));
            }));
  }

  Container buildContainer(titleText) => Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple], // Define your gradient colors
            begin: Alignment.topLeft, // Starting point of the gradient
            end: Alignment.bottomRight, // Ending point of the gradient
          ),
        ),
        child: Text(
          titleText.toString(),
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white, // Adjust text color for better visibility
          ),
        ),
      );

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
