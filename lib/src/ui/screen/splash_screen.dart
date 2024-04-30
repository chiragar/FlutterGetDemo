import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlivedemo/src/controller/splash_controler.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WelcomeController>(
        init: WelcomeController(),
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlutterLogo(size: 70),
                SizedBox(height: 8),
                CircularProgressIndicator()
              ],
            ),
          );
        },
      ),
    );
  }
}