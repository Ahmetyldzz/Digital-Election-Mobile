import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalomonBar extends StatefulWidget {
  const SalomonBar({super.key});

  @override
  State<SalomonBar> createState() => _SalomonBarState();
}

class _SalomonBarState extends State<SalomonBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      selectedItemColor: ProjectColors().likePink,
      unselectedItemColor: ProjectColors().background,
      backgroundColor: ProjectColors().commonTheme,
      currentIndex: _currentIndex,
      onTap: (p0) {
        setState(() {
          _currentIndex = p0;
        });
      },
      items: [
        SalomonBottomBarItem(icon: Icon(Icons.home), title: Text("Home")),
        SalomonBottomBarItem(icon: Icon(Icons.search), title: Text("Search")),
        SalomonBottomBarItem(icon: Icon(Icons.mail), title: Text("Mail")),
        SalomonBottomBarItem(
            icon: Icon(Icons.notifications), title: Text("Notifications")),
      ],
    );
  }
}
