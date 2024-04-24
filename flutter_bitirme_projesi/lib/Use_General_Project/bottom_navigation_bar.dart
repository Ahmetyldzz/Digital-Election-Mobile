import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Entered_Homepage/entered_home_page.dart';
import 'package:flutter_bitirme_projesi/Notification_Page/notification.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with NavigatorRoute {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        selectedItemColor: ProjectColors().darkTheme,
        onTap: (value) {
          if (value == 0) {
            navigateToWidget(context, EnteredHomePage());
          }
          if (value == 1) {
            navigateToWidget(context, Notifications());
          }
        },
        backgroundColor: ProjectColors().commonTheme,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: ProjectColors().darkTheme,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_rounded,
                color: ProjectColors().darkTheme,
              ),
              label: ""),
        ]);
  }
}
