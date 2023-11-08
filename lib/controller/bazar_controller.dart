import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mendaur_pilot_app/model/bazar_model.dart';
import 'package:mendaur_pilot_app/repository/authentication/authentication_repository.dart';

// class BazarController extends GetxController {
//   static BazarController get instance => Get.find();

//   final _authRepo = Get.put(AuthenticationRepository());
//   final _userRepo = Get.put(UserRepository());

//   //Mengambil data user untuk ditampilkan
//   getUserdata() {
//     final email = _authRepo.firebaseUser.value?.email;
//     if (email != null) {
//       return _userRepo.getUserDetails(email);
//     } else {
//       Get.snackbar("Error", "Login to continue");
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'your_bazar_model.dart';

class BazarController extends GetxController {
  static BazarController get instance => Get.find();

  final CollectionReference bazarCollection =
      FirebaseFirestore.instance.collection('Bazar');

  Future<List<BazarModel>> getBazarData() async {
    QuerySnapshot<Object?> snapshot = await bazarCollection.get();
    QuerySnapshot<Map<String, dynamic>> typedSnapshot =
        snapshot as QuerySnapshot<Map<String, dynamic>>;
    return snapshot.docs.map((doc) => BazarModel.fromSnapshot(doc)).toList();
  }
}
