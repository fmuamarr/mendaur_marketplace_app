import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/controller/otp_controller.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:mendaur_pilot_app/src/widgets/login_widgets/custom_button_login.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Code OTP",
            style: GoogleFonts.athiti(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          Text(
            "Masukkan code OTP",
            style: GoogleFonts.athiti(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OtpTextField(
            numberOfFields: 6,
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            cursorColor: Colors.black,
            focusedBorderColor: kSecondaryColor,
            onSubmit: (code) {
              otp = code;
              OTPController.instance.verifyOTP(otp);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            // width: double.infinity,
            child: CustomButtonLoginPage(
              backgroundColor: kSecondaryColor,
              text: "Submit",
              onPressedFunction: () {
                OTPController.instance.verifyOTP(otp);
                // Get.to(OTPScreen());
                // signIn();
              },
              textColor: kWhiteColor,
            ),
          ),
        ],
      ),
    ));
  }
}
