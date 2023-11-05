import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mendaur_pilot_app/src/constants/fonts.dart';
import 'package:mendaur_pilot_app/src/constants/styles.dart';
import 'package:mendaur_pilot_app/src/widgets/login_widgets/custom_button_login.dart';
import 'package:mendaur_pilot_app/src/widgets/login_widgets/custom_text_field.dart';

import '../../../main.dart';
import '../../Utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
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
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 7.5),
                child: CustomTextFieldLogin(
                  fieldController: nameController,
                  hintText: "Full Name",
                  prefixIcon: Icon(
                    CupertinoIcons.person_alt_circle_fill,
                    color: kBorderLoginSignUp,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 7.5),
                child: TextFormField(
                  controller: emailController,
                  enableInteractiveSelection: true,
                  style: kAthitiFontNormal.copyWith(fontSize: 16),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Masukkan format email yang benar'
                          : null,
                  decoration: kFormInputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.phone_fill,
                        color: kBorderLoginSignUp,
                      ),
                      suffixIcon: null,
                      hintText: "Phone Number"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 7.5),
                child: TextFormField(
                  style: kAthitiFontNormal.copyWith(fontSize: 16),
                  obscureText: !_passwordVisible,
                  controller: passwordController,
                  // enableInteractiveSelection: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length < 8
                      ? 'Password minimal 8 karakter'
                      : null,
                  decoration: kFormInputDecoration(
                    hintText: "Password",
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
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 7.5),
                child: TextFormField(
                  obscureText: !_passwordVisible,
                  controller: confirmpasswordController,
                  enableInteractiveSelection: true,
                  style: kAthitiFontNormal.copyWith(fontSize: 16),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Password tidak sama';
                    }
                    return null;
                  },
                  decoration: kFormInputDecoration(
                    hintText: "Password",
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
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
                  left: 50,
                  right: 50,
                  top: 10,
                  bottom: 0,
                ),
                child: SizedBox(
                  height: 45,
                  child: CustomButtonLoginPage(
                    backgroundColor: kPalleteColor,
                    text: "SIGN UP",
                    onPressedFunction: () {
                      signIn();
                    },
                    textColor: kWhiteColor,
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
