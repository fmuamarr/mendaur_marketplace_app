import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/src/constants/fonts.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/widget/header_shape_stack.dart';

class DefaultAppbar extends StatelessWidget {
  DefaultAppbar({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          Colors.transparent, // Atur latar belakang AppBar menjadi transparan
      elevation: 0, // Hilangkan shadow di bawah AppBar
      flexibleSpace: Column(
        children: [
          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: const HeaderShapeStack(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: SizedBox(
                  width: 40,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                    onPressed: onPressed,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: kAthitiFontSemiBold?.copyWith(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}
