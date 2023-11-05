import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/src/widgets/default_appbar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
            125.0), // Sesuaikan ketinggian AppBar sesuai kebutuhan
        child: DefaultAppbar(
          title: "Pesan",
          onPressed: () {},
        ),
      ),
      // body: HeaderShapeStack(),
    );
  }
}
