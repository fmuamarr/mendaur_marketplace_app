import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static bool isPhoneNumber(String input) {
    final regExp = RegExp(
        r'^\d{10,15}$'); // Sesuaikan dengan format nomor handphone yang diinginkan
    return regExp.hasMatch(input);
  }
}
