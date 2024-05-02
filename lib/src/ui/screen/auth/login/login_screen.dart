import 'package:flutter/material.dart';
import 'package:flutterlivedemo/src/controller/login_controller.dart';
import 'package:flutterlivedemo/src/core/assets.dart';
import 'package:flutterlivedemo/src/ui/screen/home/home_screen.dart';
import 'package:flutterlivedemo/src/ui/widget/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: const Offset(0.0, 3.0),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: size.height*0.1),

                    CustomTextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintext: 'Email Address',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Email Address Is Require";
                          } else if (!RegExp(
                              r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                              .hasMatch(value)) {
                            return "Email Address Not Correct";
                          } else {
                            return null;
                          }
                        }),
                     SizedBox(height: size.height*0.02),
                    CustomTextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Password is required!";
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          } else if (value.length >= 15) {
                            return 'Password Not More then 15 Character';
                          }
                          return null;
                        },
                        hintext: 'Password'),
                    SizedBox(height: size.height*0.04),

                    SizedBox(
                      width: size.width*0.8,
                      height: size.height*0.07,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;
                            if (_emailController.text.toString().trim() ==
                                    "admin@gmail.com" &&
                                _passwordController.text.toString().trim() ==
                                    "admin123") {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('key', 'abc123');
                              Get.offAll(
                                  HomeScreen()); // Replace with your home screen route
                            } else {
                              Get.snackbar(
                                'Login Error',
                                'Invalid username or password \nEmail:admin@gmail.com \nPassword:admin123',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                          child: const Text("Login")),
                    ),
                    SizedBox(height: size.height*0.04),

                  ],
                ),
              ),
            ),
            Positioned(
                top: -10,
                left: 0,
                right: 0,
                child: Image.asset(CustomAssets.gallery,width: 80,height: 80,)),
          ],
        ),
      ),
    );
  }
}
