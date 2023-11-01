import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
// import 'package:pemmob_app/utils/constants.dart';

class DashboardTile extends StatelessWidget {
  final String dashboardTitle;
  final String imageName;
  final VoidCallback onTap;

  const DashboardTile({
    super.key,
    required this.dashboardTitle,
    required this.imageName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Warna shadow
              spreadRadius: 0, // Sebaran shadow
              blurRadius: 0.75, // Blur shadow
              offset: Offset(0, 3), // Posisi shadow (X, Y)
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(imageName),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dashboardTitle,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
