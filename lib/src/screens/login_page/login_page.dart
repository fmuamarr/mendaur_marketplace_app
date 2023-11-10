import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/controller/login_controller.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:mendaur_pilot_app/src/constants/fonts.dart';
import 'package:mendaur_pilot_app/src/screens/sign_up_screen/sign_up_screen.dart';
import 'package:mendaur_pilot_app/src/widgets/login_widgets/custom_button_login.dart';
import 'package:mendaur_pilot_app/src/widgets/login_widgets/custom_text_field.dart';

import '../../../main.dart';
import '../../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  bool _passwordVisible = true;
  final LoginController _loginController = Get.put(LoginController());

  @override
  void dispose() {
    _loginController.email.dispose();
    _loginController.password.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/logo_splash.png'),
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.2), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 10),
              child: Image.asset(
                'assets/images/logo_login.png',
                width: 200.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: CustomTextFieldLogin(
                fieldController: _loginController.email,
                hintText: "Email",
                prefixIcon: Icon(
                  CupertinoIcons.person_alt_circle_fill,
                  color: kBorderLoginSignUp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: TextField(
                style: kAthitiFontNormal.copyWith(fontSize: 16),
                controller: _loginController.password,
                obscureText: !_passwordVisible,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  prefixIcon: Icon(
                    CupertinoIcons.lock_circle_fill,
                    color: kBorderLoginSignUp,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: kBorderLoginSignUp,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
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
                  hintText: "Password",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 10,
                bottom: 0,
              ),
              child: SizedBox(
                height: 40,
                child: CustomButtonLoginPage(
                    backgroundColor: kSecondaryColor,
                    onPressedFunction: () {
                      _loginController.signInWithEmailAndPassword(
                        _loginController.email.text.trim(),
                        _loginController.password.text.trim(),
                      );
                    },
                    text: "LOGIN",
                    textColor: kWhiteColor),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.zero,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Don\'t have an account?',
            //         style: TextStyle(
            //           color: kPrimaryColor,
            //           fontFamily: GoogleFonts.athiti().fontFamily,
            //           fontSize: 12,
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const SignUpScreen()));
            //         },
            //         child: Text(
            //           'Sign up.',
            //           style: TextStyle(
            //             color: kPrimaryColor,
            //             fontFamily: GoogleFonts.athiti().fontFamily,
            //             fontWeight: FontWeight.w600,
            //             fontSize: 12,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              child: Center(
                child: Text(
                  "Or",
                  style: kAthitiFontNormal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 10,
                bottom: 0,
              ),
              child: SizedBox(
                height: 40,
                child: CustomButtonLoginPage(
                  backgroundColor: kPalleteColor,
                  text: "SIGN UP WITH GOOGLE ACCOUNT",
                  onPressedFunction: () {
                    _loginController.signInWithGoogle();
                  },
                  textColor: kWhiteColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 10,
                bottom: 0,
              ),
              child: SizedBox(
                height: 40,
                child: CustomButtonLoginPage(
                  backgroundColor: kWhiteColor,
                  text: "SIGN UP WITH PHONE NUMBER",
                  onPressedFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  textColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future signIn() async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print(e);

  //     Utils.showSnackBar("Email atau Password salah");
  //   }
  //   navigatorKey.currentState!.popUntil((route) => route.isFirst);
  // }
}
