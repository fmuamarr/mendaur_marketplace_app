import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mendaur_pilot_app/src/constants/colors.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/chat_page.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/home_page.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/notification_page.dart';
import 'package:mendaur_pilot_app/src/screens/main_screen/profile_page.dart';

class BottomNavbar extends StatefulWidget {
  String? to;
  BottomNavbar({Key? key, this.to}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePage(
          // to: widget.to ?? "",
          ),
      const NotificationPage(),
      ChatPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: pages[_selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kPrimaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            label: 'Menu Math',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Akun',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: kWhiteColor,
        unselectedItemColor: kWhiteColor.withOpacity(0.4),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
