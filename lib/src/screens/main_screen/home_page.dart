import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/dasboardtile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dashboardList = [
    ["Furniture", "assets/icons/furniture.png", FurnitureRoute],
    ["Fashion", "assets/icons/fashion.png", FashionRoute],
    ["Material", "assets/icons/material.png", MaterialRoute],
    ["Souvenir", "assets/icons/souvenir.png", SouvenirRoute],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        style: TextStyle(
                          fontFamily: GoogleFonts.athiti().fontFamily,
                          fontSize: 12,
                        ),
                        onTap: () {},
                        decoration: InputDecoration(
                          suffixIcon: Icon(CupertinoIcons.search),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: kSwatchColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: kSwatchColor,
                            ),
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontFamily: GoogleFonts.athiti().fontFamily,
                            fontSize: 12,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: kSwatchColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.heart),
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: kSwatchColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.basketShopping),
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: kSwatchColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FontAwesomeIcons.gear),
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          // Tambahkan logika ketika tombol pertama ditekan
                          print("Tombol 1 ditekan");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Rp. 12.000.000"),
                            SizedBox(
                              height: 5,
                            ),
                            Image.asset('assets/images/logo_gopay.png'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.grey,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          // Tambahkan logika ketika tombol kedua ditekan
                          print("Tombol 2 ditekan");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("45"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/daur_logo.png'),
                                Text(
                                  "POINTS",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.chathura().fontFamily,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.grey,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          print("Tombol 3 ditekan");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/qris_logo.png'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: dashboardList.map((menu) {
                  return DashboardTile(
                      dashboardTitle: menu[0],
                      imageName: menu[1],
                      onTap: () {
                        menu[2](menu[0]);
                      });
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void FurnitureRoute(String title) {
  print('Tile ${title} ditekan');
  // Tambahkan logika sesuai kebutuhan di sini
}

void FashionRoute(String title) {
  print('Tile ${title} ditekan');
  // Tambahkan logika sesuai kebutuhan di sini
}

void MaterialRoute(String title) {
  print('Tile ${title} ditekan');
  // Tambahkan logika sesuai kebutuhan di sini
}

void SouvenirRoute(String title) {
  print('Tile ${title} ditekan');
  // Tambahkan logika sesuai kebutuhan di sini
}
