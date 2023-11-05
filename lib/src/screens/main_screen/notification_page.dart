import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/src/constants/fonts.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/widget/header_shape_stack.dart';
import 'package:mendaur_pilot_app/src/widgets/default_appbar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
            125.0), // Sesuaikan ketinggian AppBar sesuai kebutuhan
        child: DefaultAppbar(
          title: "Notifikasi",
          onPressed: () {},
        ),
      ),
      // body: HeaderShapeStack(),
    );
  }
}
