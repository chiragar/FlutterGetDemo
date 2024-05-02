import 'dart:async';

import 'package:flutterlivedemo/src/ui/screen/auth/login/login_screen.dart';
import 'package:flutterlivedemo/src/ui/screen/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeController extends GetxController{

  @override
  void onInit() {
    Timer(Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var keys = await prefs.getString('key');
      if (keys == "abc1234") {
        Get.offAll(HomeScreen());
      } else {
        Get.offAll(LoginScreen());
      }
    });
    super.onInit();
  }

}