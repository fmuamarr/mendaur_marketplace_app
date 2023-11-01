import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:email_validator/email_validator.dart';

import '../../../main.dart';
import '../../Utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo_login.png',
                    width: 250.0,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2.5),
                child: TextFormField(
                  controller: emailController,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                    fontFamily: GoogleFonts.athiti().fontFamily,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Masukkan format email yang benar'
                          : null,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      CupertinoIcons.person_alt_circle_fill,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: kPrimaryColor),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: kPrimaryColor,
                      ),
                    ),
                    hintText: "Email",
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2.5),
                child: TextFormField(
                  obscureText: !_passwordVisible,
                  controller: passwordController,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                    fontFamily: GoogleFonts.athiti().fontFamily,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 6
                      ? 'Password minimal 6 karakter'
                      : null,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      CupertinoIcons.lock_circle_fill,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: kBGGreyColor,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: kPrimaryColor,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: kPrimaryColor,
                      ),
                    ),
                    hintText: "Password",
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 2.5),
                child: TextFormField(
                  obscureText: !_passwordVisible,
                  controller: confirmpasswordController,
                  enableInteractiveSelection: true,
                  style: TextStyle(
                    fontFamily: GoogleFonts.athiti().fontFamily,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Password tidak sama';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      CupertinoIcons.lock_circle_fill,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: kBGGreyColor,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: kPrimaryColor,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: kPrimaryColor,
                      ),
                    ),
                    hintText: "Confirm Password",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  'By signing up, you are agree to our Terms & Conditions and Privacy Policy',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: GoogleFonts.athiti().fontFamily,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 20,
                  bottom: 0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPalleteColor,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: signIn,
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontFamily: GoogleFonts.athiti().fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFFFFFFFD),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: confirmpasswordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
