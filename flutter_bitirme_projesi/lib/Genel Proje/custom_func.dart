import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/project_colors.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: ProjectColors().genelTema,
      height: 50,
      onDestinationSelected: (int newIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      },
      selectedIndex: _currentIndex,
      destinations: [
        NavigationDestination(
            icon: Icon(
              Icons.home,
              color: ProjectColors().yavruAgzi,
            ),
            label: "Home"),
        NavigationDestination(
            icon: Icon(
              Icons.search,
              color: ProjectColors().yavruAgzi,
            ),
            label: "Search"),
        /* NavigationDestination(
            icon: Icon(
              Icons.mail,
              color: ProjectColors().yavruAgzi,
            ),
            label: "Message"), */
        NavigationDestination(
            icon: Icon(
              Icons.notifications,
              color: ProjectColors().yavruAgzi,
            ),
            label: "Notifications"),
      ],
    );
  }
}
