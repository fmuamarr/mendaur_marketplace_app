import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';

class SubHeaderWithTitle extends StatelessWidget {
  const SubHeaderWithTitle({
    Key? key,
    required this.title,
    required this.press,
    required this.buttonText,
  }) : super(key: key);

  final String title;
  final String buttonText;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: GoogleFonts.athiti().fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF06316B),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            press();
          },
          child: Text(
            buttonText,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xA6000000),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
