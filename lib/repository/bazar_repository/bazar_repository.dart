import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mendaur_pilot_app/model/bazar_model.dart';
import 'package:mendaur_pilot_app/model/user_model.dart';

class BazarRepository extends GetxController {
  static BazarRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //Mengirim data ke firestore
  // createUser(UserModel user) async {
  //   await _db.collection("Users").add(user.toJson()).whenComplete(() {
  //     Get.snackbar(
  //       "Success",
  //       "Your account has been created.",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green.withOpacity(0.1),
  //       colorText: Colors.green,
  //     );
  //   }).catchError((error, stackTrace) {
  //     Get.snackbar(
  //       "Error",
  //       "Something went wrong.",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.redAccent.withOpacity(0.1),
  //       colorText: Colors.red,
  //     );
  //   });
  // }

  //Mengambil data yang login dari firestore
  // Future<UserModel> getUserDetails(String email) async {
  //   final snapshot =
  //       await _db.collection("Users").where("Email", isEqualTo: email).get();

  //   if (snapshot.docs.isNotEmpty) {
  //     final userData = UserModel.fromSnapshot(snapshot.docs.first);
  //     return userData;
  //   } else {
  //     throw Exception("User data not found"); // Atau tindakan lain yang sesuai
  //   }
  // }

  //Mengambil data ke firestore
  Future<List<BazarModel>> allBazar() async {
    final snapshot = await _db.collection("Bazar").get();
    final bazarData =
        snapshot.docs.map((e) => BazarModel.fromSnapshot(e)).toList();
    return bazarData;
  }
}
