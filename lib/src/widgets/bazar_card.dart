import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BazarCard extends StatelessWidget {
  const BazarCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          6,
          (index) => Container(
            width: 180,
            height: 90,
            margin: EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.3), // Warna shadow
              //     spreadRadius: 0, // Sebaran shadow
              //     blurRadius: 0.75, // Blur shadow
              //     offset: Offset(0, 3), // Posisi shadow (X, Y)
              //   ),
              // ],
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/bazar_cek.png',
                        height: 60,
                        fit: BoxFit.cover,
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
                        "Tanggal",
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Color(0xFFF0F6E9),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      Text("LIPPO PLAZA"),
                      Spacer(),
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
        ),
      ),
    );
  }
}
