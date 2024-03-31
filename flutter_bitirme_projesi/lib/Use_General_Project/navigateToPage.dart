import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Entered_Homepage/entered_home_page.dart';
import 'package:flutter_bitirme_projesi/Login_Page/login_page.dart';
import 'package:flutter_bitirme_projesi/Notification_Page/notification.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Voting_Page/oy_kullanma.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

mixin NavigatorRoute {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
      //fullscreenDialog: true,
      settings: RouteSettings(),
    ));
  }
}

class SalomonNavBar extends StatefulWidget {
  const SalomonNavBar({super.key});

  @override
  State<SalomonNavBar> createState() => _SalomonNavBarState();
}

class _SalomonNavBarState extends State<SalomonNavBar> with NavigatorRoute {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      selectedItemColor: ProjectColors().likePink,
      unselectedItemColor: ProjectColors().background,
      backgroundColor: ProjectColors().commonTheme,
      currentIndex: _currentIndex,
      onTap: (p0) {
        if (p0 == 0) {
          navigateToWidget(context, EnteredHomePage());
        }

        if (p0 == 1) {
          navigateToWidget(context, LoginPage());
        }

        if (p0 == 2) {
          navigateToWidget(context, Oykullanma());
        }

        if (p0 == 3) {
          navigateToWidget(context, Notifications());
        }
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
