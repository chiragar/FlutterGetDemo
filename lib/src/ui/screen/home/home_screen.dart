import 'package:flutter/material.dart';
import 'package:flutterlivedemo/src/controller/home_controller.dart';
import 'package:flutterlivedemo/src/core/assets.dart';
import 'package:flutterlivedemo/src/ui/screen/auth/login/login_screen.dart';
import 'package:flutterlivedemo/src/ui/screen/home/detail_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller)=>Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  prefs.clear();
                  Get.offAll(LoginScreen());
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Obx(() {
          return Column(
            children: [
              Expanded(
                  child: controller.userModel.length == 0
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : ListView.builder(
                    itemCount: controller.userModel.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      var data=controller.userModel[index];
                      return InkWell(
                        onTap: () => Get.to(DetailScreen(datas: data)),
                        child: Card(
                          elevation: 1,
                          margin: EdgeInsets.all(4),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  CustomAssets.gallery,
                                  width: size.width * 0.15,
                                  height: size.width * 0.15,
                                ),
                                SizedBox(width: size.width * 0.02),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name ${data.name??""}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    Text("Email  ${data.email??""}"),
                                    SizedBox(height: size.height * 0.005),
                                    Text("Hire Dt  ${data.hireDt??""}"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ))
            ],
          );
        })));
  }
}
