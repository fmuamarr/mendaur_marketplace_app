import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          6,
          (index) => Card(
            elevation: 4, // Atur tinggi bayangan sesuai kebutuhan
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Colors.white,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/bazar_cek.png',

                width: 90, // Menjaga lebar
                height: 110, // Menjaga tinggi
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
