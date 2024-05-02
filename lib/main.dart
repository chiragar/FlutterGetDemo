import 'package:flutter/material.dart';
import 'package:flutterlivedemo/src/controller/home_controller.dart';
import 'package:flutterlivedemo/src/controller/splash_controler.dart';
import 'package:flutterlivedemo/src/ui/screen/splash_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chirag Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(elevation: 0, centerTitle: true),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white))),
      home: SplashScreen(),
    );
  }
}
