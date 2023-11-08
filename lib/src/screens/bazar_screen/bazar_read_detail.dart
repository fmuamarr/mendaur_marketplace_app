import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/model/bazar_model.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';

class BazarDetailPage extends StatelessWidget {
  final BazarModel bazar;

  BazarDetailPage({required this.bazar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text(
          bazar.name,
          style: const TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context); // Fungsi kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.network(
              bazar.imageURL,
              width: double.infinity,
              height: 200, // Atur tinggi gambar sesuai kebutuhan
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16), // Jarak antara gambar dan teks

            Text(
              bazar.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8), // Jarak antara judul dan deskripsi

            Text(
              "Deskripsi: ${bazar.desc}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16), // Jarak antara deskripsi dan tanggal

            Text(
              "Tanggal: ${bazar.date}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16), // Jarak antara tanggal dan tempat

            Text(
              "Tempat: ${bazar.place}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
