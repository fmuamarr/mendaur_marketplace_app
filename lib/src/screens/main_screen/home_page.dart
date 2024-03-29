// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/controller/rssfeedcontroller.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:mendaur_pilot_app/src/screens/bazar_screen/bazar_list_page.dart';
import 'package:mendaur_pilot_app/src/screens/bazar_screen/bazar_read_detail.dart';
import 'package:mendaur_pilot_app/src/screens/berita_page/berita_rss.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/dasboardtile.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/widget/header_shape_stack.dart';
import 'package:mendaur_pilot_app/src/widgets/sub_header_title.dart';
import 'package:mendaur_pilot_app/src/widgets/voucher_card.dart';

import '../../widgets/bazar_card.dart';
import '../../widgets/berita_home.dart';

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

  // List _posts = []; //Untuk API

  RssFeedController controller = RssFeedController();

  @override
  void initState() {
    super.initState();
    // _getDataNews(); //FUNGSI API
    controller.loadFeed();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 85,
            width: MediaQuery.of(context).size.width,
            child: const HeaderShapeStack(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      style: TextStyle(
                        fontFamily: GoogleFonts.athiti().fontFamily,
                        fontSize: 12,
                      ),
                      onTap: () {},
                      decoration: InputDecoration(
                        suffixIcon: const Icon(CupertinoIcons.search),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: kSwatchColor,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
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
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: kBorderColorPayment),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        // Tambahkan logika ketika tombol pertama ditekan
                        print("Tombol 1 ditekan sebanyak 10 kali");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Rp. 12.000.000"),
                          const SizedBox(
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
                    color: kBorderColorPayment,
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
                          const Text("45"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/daur_logo.png'),
                              Text(
                                "POINTS",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.chathura().fontFamily,
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
                    color: kBorderColorPayment,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SubHeaderWithTitle(
              title: "Bazar",
              press: () {
                Get.to(BazarListPage());
              },
              buttonText: "See All>",
            ),
          ),
          BazarCard(
            onBazarCardTapped: (bazar) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BazarDetailPage(bazar: bazar),
              ));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
            child: SubHeaderWithTitle(
              title: "Klaim Voucher",
              press: () {},
              buttonText: "See All>",
            ),
          ),
          const VoucherCard(),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
            child: SubHeaderWithTitle(
              title: "Berita Terkini",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BeritaRSS(controller: RssFeedController())),
                );
              },
              buttonText: "See All>",
            ),
          ),
          BeritaHomeCard(
            controller: RssFeedController(),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  // Future _getDataNews() async {
  //   try {
  //     final response = await http.get(Uri.parse(
  //         'https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=635c44f3988f445caafbeb76ea9a36cb'));

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       setState(() {
  //         _posts = data['articles'];
  //       });
  //       print(_posts);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}

void FurnitureRoute(String title) {
  print('Tile $title ditekan');
  // Tambahkan logika sesuai kebutuhan di sini
}

void FashionRoute(String title) {
  print('Tile $title ditekan');
  // Tambahkan logika sesuai kebutuhan di sini
}

void MaterialRoute(String title) {
  print('Tile $title ditekan');

  // Tambahkan logika sesuai kebutuhan di sini
}

void SouvenirRoute(String title) {
  print('Tile $title ditekan');
  // Tambahkan logika sesuai kebutuhan di sini
}
