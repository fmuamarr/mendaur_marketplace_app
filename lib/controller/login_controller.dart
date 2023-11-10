import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mendaur_pilot_app/repository/authentication/authentication_repository.dart';
import 'package:mendaur_pilot_app/src/utils/utils.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final AuthenticationRepository _authRepository =
      AuthenticationRepository.instance;

  //TextField controller
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _authRepository.loginWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar("Email atau Password salah");
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _authRepository.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar("Email atau Password salah");
    }
  }
}
