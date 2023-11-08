// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/controller/signup_controller.dart';
import 'package:mendaur_pilot_app/main.dart';
import 'package:mendaur_pilot_app/model/user_model.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mendaur_pilot_app/src/constants/fonts.dart';
import 'package:mendaur_pilot_app/src/constants/styles.dart';
import 'package:mendaur_pilot_app/src/screens/sign_up_screen/otp_screen.dart';
import 'package:mendaur_pilot_app/src/utils/utils.dart';
import 'package:mendaur_pilot_app/src/widgets/login_widgets/custom_button_login.dart';
import 'package:mendaur_pilot_app/src/widgets/login_widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final nameController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final confirmpasswordController = TextEditingController();
  bool _passwordVisible = true;
  // final controller = Get.put(SignUpController());

  @override
  void dispose() {
    // emailController.dispose();
    // passwordController.dispose();
    // nameController.dispose();
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
    final controller = Get.put(SignUpController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo_login.png',
                    width: 200.0,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 7.5),
                child: CustomTextFieldLogin(
                  fieldController: controller.fullName,
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
                  controller: controller.email,
                  enableInteractiveSelection: true,
                  style: kAthitiFontNormal.copyWith(fontSize: 16),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (email) =>
                  //     email != null && !EmailValidator.validate(email)
                  //         ? 'Masukkan format email yang benar'
                  //         : null,
                  decoration: kFormInputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        color: kBorderLoginSignUp,
                      ),
                      suffixIcon: null,
                      hintText: "Email"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 7.5),
                child: TextFormField(
                  controller: controller.phoneNo,
                  enableInteractiveSelection: true,
                  style: kAthitiFontNormal.copyWith(fontSize: 16),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (email) =>
                  //     email != null && !EmailValidator.validate(email)
                  //         ? 'Masukkan format email yang benar'
                  //         : null,
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
                  controller: controller.password,
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
                    if (value != controller.password.text) {
                      return 'Password tidak sama';
                    }
                    return null;
                  },
                  decoration: kFormInputDecoration(
                    hintText: "Konfirmasi Password",
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
                      // ------Sign up email password with controller
                      // if (_formKey.currentState!.validate()) {
                      //   SignUpController.instance.registerUser(
                      //       controller.email.text.trim(),
                      //       controller.password.text.trim());
                      // }

                      // ------- Sign up with phone No
                      // SignUpController.instance
                      //     .phoneAuthentication(controller.phoneNo.text.trim());

                      // Get.to(() => const OTPScreen());

                      final user = UserModel(
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        fullName: controller.fullName.text.trim(),
                        phoneNo: controller.phoneNo.text.trim(),
                      );

                      SignUpController.instance.createUser(user);

                      //----------Sign up with email password(this widget)
                      // signIn();
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

  // Future signIn() async {
  //   final isValid = _formKey.currentState!.validate();
  //   if (!isValid) return;

  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: confirmpasswordController.text.trim(),
  //     );
  //     // Sebelum berpindah ke halaman sign-in
  //     emailController.clear();
  //     passwordController.clear();
  //     nameController.clear();
  //     confirmpasswordController.clear();
  //   } on FirebaseAuthException catch (e) {
  //     print(e);

  //     Utils.showSnackBar(e.message);
  //   }
  //   navigatorKey.currentState!.popUntil((route) => route.isFirst);
  // }
}
