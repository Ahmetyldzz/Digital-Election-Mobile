import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Views/Login_Page/login_page.dart';
import 'package:flutter_bitirme_projesi/widgets/Popup/menu_items.dart';
import 'package:popover/popover.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Popup extends StatefulWidget {
  const Popup({super.key, this.prefs});
  final SharedPreferences? prefs;

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> with NavigatorRoute {
  _cikisYap() {
    widget.prefs?.clear;
    navigateToWidget(context, LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: _cikisYap,
            child: Text("Çıkış Yap"),
          ),
        ];
      },
    );
  }
}
