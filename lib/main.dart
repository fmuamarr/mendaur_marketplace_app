import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:mendaur_pilot_app/src/screens/berita_page/berita_page.dart';
import 'package:mendaur_pilot_app/src/screens/berita_page/berita_rss.dart';
import 'package:mendaur_pilot_app/src/screens/bottom_navbar/bottom_navbar.dart';
import 'package:mendaur_pilot_app/src/screens/login_page/login_page.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/notification_page.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/profile_page.dart';
import 'package:mendaur_pilot_app/src/screens/splash_screen/splash_screen.dart';
import 'package:mendaur_pilot_app/src/utils/utils.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
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
      // theme: ThemeData(
      //     colorScheme: ColorScheme.fromSwatch().copyWith(
      //   primary: Colors.grey[900],
      //   secondary: Colors.grey[800],
      // )),
      home: const SplashScreen(),
    );
  }
}
