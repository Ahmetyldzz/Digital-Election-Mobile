import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NewNavigationBar extends StatefulWidget {
  const NewNavigationBar({super.key});

  @override
  State<NewNavigationBar> createState() => _NewNavigationBarState();
}

class _NewNavigationBarState extends State<NewNavigationBar> {
  final Icon icon1 = Icon(Icons.abc);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ProjectColors().background,
        appBar: AppBar(),
        bottomNavigationBar: customSolomonNavigationBar());
  }

  DotNavigationBar customDotNavigationBar() {
    return DotNavigationBar(
      borderRadius: 20,
      selectedItemColor: ProjectColors().likePink,
      unselectedItemColor: ProjectColors().background,
      backgroundColor: ProjectColors().commonTheme,
      currentIndex: _currentIndex,
      onTap: (p0) {
        setState(() {
          _currentIndex = p0;
        });
      },
      dotIndicatorColor: ProjectColors().background,
      items: [
        DotNavigationBarItem(
          icon: Icon(Icons.home),
        ),
        DotNavigationBarItem(
          icon: Icon(Icons.search),
        ),
        DotNavigationBarItem(
          icon: Icon(Icons.mail),
        ),
        DotNavigationBarItem(
          icon: Icon(Icons.notifications),
        ),
        DotNavigationBarItem(
          icon: Icon(Icons.home),
        ),
      ],
    );
  }

  SalomonBottomBar customSolomonNavigationBar() {
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
