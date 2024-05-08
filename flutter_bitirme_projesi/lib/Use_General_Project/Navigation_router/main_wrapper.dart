import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: ProjectColors().likePink,
        unselectedItemColor: ProjectColors().commonTheme,
        backgroundColor: ProjectColors().background,
        currentIndex: _currentIndex,
        onTap: (p0) {
          setState(() {
            _currentIndex = p0;
          });

          _goToBranch(_currentIndex);
        },
        items: [
          SalomonBottomBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              title: Text("Home")),
          SalomonBottomBarItem(
              icon: Icon(
                Icons.how_to_vote_outlined,
                size: 30,
              ),
              title: Text("Election")),
          SalomonBottomBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 30,
              ),
              title: Text("Profile")),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
    );
  }
}
