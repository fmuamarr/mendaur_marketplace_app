import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/controller/bazar_controller.dart';
import 'package:mendaur_pilot_app/model/bazar_model.dart';

class BazarCard extends StatelessWidget {
  final BazarController controller = BazarController();

  final Function(BazarModel) onBazarCardTapped; // Callback ketika card di-klik

  BazarCard({Key? key, required this.onBazarCardTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BazarModel>>(
      future: controller
          .getBazarData(), // Ambil data dari Firebase menggunakan controller
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Tampilkan loading saat data diambil
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text(
              'Tidak ada data bazar.'); // Tampilkan pesan jika tidak ada data
        }

        final bazarData = snapshot.data!;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              bazarData.length,
              (index) {
                final bazar = bazarData[index];
                final bazarName = bazar.name;
                final bazarDesc = bazar.desc;
                final bazarPlace = bazar.place;
                final bazarDate = bazar.date;
                final imageUrl = bazar.imageURL;

                // Batasi panjang teks bazarPlace menjadi 16 karakter
                final bazarPlaceLimited = bazarPlace.length <= 10
                    ? bazarPlace
                    : bazarPlace.substring(0, 10) + '...';

                return GestureDetector(
                  onTap: () {
                    onBazarCardTapped(bazar);
                  },
                  child: Container(
                    width: 180,
                    height: 90,
                    margin: const EdgeInsets.only(right: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                bazar.imageURL,
                                height: 60,
                                width: 180,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              left: 5,
                              child: Icon(
                                CupertinoIcons.clock,
                                color: Colors.white.withOpacity(0.5),
                                size: 13,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Text(
                                bazarDate,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 28,
                          width: 180,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Color(0xFFF0F6E9),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                              Text(bazarPlaceLimited),
                              const Spacer(),
                              Text(
                                "2.4 km",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
