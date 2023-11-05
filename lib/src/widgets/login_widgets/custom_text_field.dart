import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:mendaur_pilot_app/src/constants/fonts.dart';

class CustomTextFieldLogin extends StatelessWidget {
  const CustomTextFieldLogin({
    Key? key,
    required this.fieldController,
    required this.hintText,
    required this.prefixIcon,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String hintText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      autofocus: false,
      enableInteractiveSelection: true,
      style: kAthitiFontNormal.copyWith(fontSize: 16),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 2,
            color: kBorderLoginSignUp,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1.5,
            color: kBorderLoginSignUp,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
