import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';

InputDecoration kFormInputDecoration({
  Icon? prefixIcon,
  required hintText,
  IconButton? suffixIcon,
}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: kWhiteColor,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: kBorderLoginSignUp,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: kBorderLoginSignUp,
      ),
    ),
    hintText: hintText,
  );
}
