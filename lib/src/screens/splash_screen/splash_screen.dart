import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mendaur_pilot_app/repository/authentication/authentication_repository.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:mendaur_pilot_app/src/screens/bottom_navbar/bottom_navbar.dart';
import 'package:mendaur_pilot_app/src/screens/login_page/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          // Check if the widget is still mounted
          AuthenticationRepository.instance.firebaseUser.value != null
              ? Get.offAll(() => BottomNavbar())
              : Get.offAll(() => LoginPage());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_splash.png',
              width: 350.0,
            ),
            const Text(
              "Presented by",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/mendaur_splash.png',
              // height: 350.0,
              // width: 350.0,
            ),
            // const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
