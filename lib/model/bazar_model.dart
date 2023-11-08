import 'package:cloud_firestore/cloud_firestore.dart';

class BazarModel {
  final String? id;
  final String name;
  final String desc;
  final String imageURL;
  final String date;
  final String place;

  const BazarModel({
    this.id,
    required this.name,
    required this.desc,
    required this.imageURL,
    required this.date,
    required this.place,
  });

  toJson() {
    return {
      "bazar_name": name,
      "bazar_desc": desc,
      "bazar_image": imageURL,
      "bazar_date": date,
      "bazar_place": place,
    };
  }

  factory BazarModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return BazarModel(
      id: document.id,
      name: data["bazar_name"],
      desc: data["bazar_desc"],
      imageURL: data["bazar_image"],
      date: data["bazar_date"],
      place: data["bazar_place"],
    );
  }
}
