import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final keyboardType;
  final String? hintext;
  final bool ispassword;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.keyboardType,
      required this.validator,
      required this.hintext,
      this.ispassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: ispassword,
      validator: validator,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintext,
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Colors.white30, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Colors.white30, width: 1),
        ),
        
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}
