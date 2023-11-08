import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mendaur_pilot_app/repository/authentication/authentication_repository.dart';
import 'package:mendaur_pilot_app/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  //Mengambil data user untuk ditampilkan
  getUserdata() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }
}
