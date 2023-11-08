import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:mendaur_pilot_app/controller/otp_controller.dart';
import 'package:mendaur_pilot_app/src/screens/bottom_navbar/bottom_navbar.dart';
import 'package:mendaur_pilot_app/repository/authentication/authentication_repository.dart';
import 'package:mendaur_pilot_app/src/screens/splash_screen/splash_screen.dart';
import 'package:mendaur_pilot_app/src/utils/utils.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
  // Get.put(OTPController());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}
