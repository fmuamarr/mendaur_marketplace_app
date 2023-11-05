import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonLoginPage extends StatelessWidget {
  const CustomButtonLoginPage({
    Key? key,
    required this.backgroundColor,
    required this.text,
    required this.onPressedFunction,
    required this.textColor,
  }) : super(key: key);

  final Color backgroundColor;
  final String text;
  final void Function() onPressedFunction;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressedFunction,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: GoogleFonts.athiti().fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
