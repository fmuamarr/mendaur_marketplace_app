import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mendaur_pilot_app/src/screens/bottom_navbar/bottom_navbar.dart';
import 'package:mendaur_pilot_app/src/screens/login_page/login_page.dart';
import 'package:mendaur_pilot_app/repository/authentication/exceptions/signup_email_password_failure.dart';
import 'package:mendaur_pilot_app/src/screens/splash_screen/splash_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Varabel
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    // Future.delayed(const Duration(seconds: 3));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  // Initial Screen onload
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginPage())
        : Get.offAll(() => BottomNavbar());
  }

  //Membuat User dengan Email dan Password
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      firebaseUser.value != null
          ? Get.offAll(() => BottomNavbar())
          : Get.to(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailPasswordFailure.code(e.code);
      print('Firebase Auth Exception: ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = SignUpEmailPasswordFailure();
      print('Exception: ${ex.message}');
      throw ex;
    }
  }

  // Login User dengan Email dan Password
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  // Logout account
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Masuk dengan nomor HP
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'Nomor yang dimasukkan salah.');
        } else {
          Get.snackbar('Error', 'Something went wrong. Try Again.');
        }
      },
    );
  }

  // Verifikasi OTP
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  // GOOGLE autentikasi login
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
