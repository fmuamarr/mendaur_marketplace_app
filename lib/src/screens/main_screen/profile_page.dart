import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: AppBar(
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            backgroundColor: kSwatchColor,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  bottom: 20,
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/logo_gopay.png'),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: (MediaQuery.of(context).size.width - 100) / 2 + 70,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: kWhiteColor,
                    ),
                    child: IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Tambahkan fungsi untuk menangani ketika tombol "Edit" ditekan di sini
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: ListView(
                children: [
                  buildListTile(
                      "Nama",
                      TextButton(
                          onPressed: () {}, child: const Text("Lorem Ipsum"))),
                  buildListTile(
                      "Tempat Lahir",
                      TextButton(
                          onPressed: () {}, child: const Text("Lorem Ipsum"))),
                  buildListTile(
                      "Tanggal Lahir",
                      TextButton(
                          onPressed: () {}, child: const Text("Lorem Ipsum"))),
                  buildListTile(
                      "Jenis Kelamin",
                      TextButton(
                          onPressed: () {}, child: const Text("Lorem Ipsum"))),
                  buildListTile(
                      "Email",
                      TextButton(
                          onPressed: () {}, child: const Text("Lorem Ipsum"))),
                  buildListTile(
                      "No. Telepon",
                      TextButton(
                          onPressed: () {}, child: const Text("Lorem Ipsum"))),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(150, 40),
                      side: const BorderSide(color: Colors.red)),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text("Keluar"),
                )),
          ],
        ));

    //
  }
}

Widget buildListTile(String title, Widget valueWidget) {
  return Column(
    children: [
      ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        title: Text(title),
        trailing: valueWidget,
      ),
    ],
  );
}
