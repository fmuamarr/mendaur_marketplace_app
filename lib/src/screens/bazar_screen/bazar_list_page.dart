import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/controller/bazar_controller.dart';
import 'package:mendaur_pilot_app/model/bazar_model.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:mendaur_pilot_app/src/screens/bazar_screen/bazar_read_detail.dart';

class BazarListPage extends StatefulWidget {
  @override
  _BazarListPageState createState() => _BazarListPageState();
}

void _navigateToBazarDetail(BuildContext context, BazarModel bazar) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BazarDetailPage(bazar: bazar),
    ),
  );
}

class _BazarListPageState extends State<BazarListPage> {
  final BazarController controller = BazarController();
  late Future<List<BazarModel>> bazarList;

  @override
  void initState() {
    super.initState();
    bazarList = controller.getBazarData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: Text(
          "Daftar Bazar",
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
      body: FutureBuilder<List<BazarModel>>(
        future: bazarList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada data bazar.'));
          } else {
            final bazarData = snapshot.data!;
            return ListView.separated(
              separatorBuilder: (context, index) =>
                  SizedBox(height: 5), // Jarak 5 pixel
              itemCount: bazarData.length,
              itemBuilder: (context, index) {
                final bazar = bazarData[index];
                return Card(
                  elevation: 3,
                  child: GestureDetector(
                    onTap: () {
                      _navigateToBazarDetail(context, bazar);
                    },
                    child: Container(
                      child: ListTile(
                        leading: Image.network(
                          bazar.imageURL, // URL gambar dari model
                          width: 150,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        title: Text(bazar.name),
                        subtitle: Text(bazar.place),
                        // Tambahkan widget lain sesuai kebutuhan
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
