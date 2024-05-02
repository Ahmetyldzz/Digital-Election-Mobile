import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Elections/election_details_page.dart';
import 'package:flutter_bitirme_projesi/Elections/elections.dart';
import 'package:flutter_bitirme_projesi/Notification_Page/notification.dart';
import 'package:flutter_bitirme_projesi/Entered_Homepage/entered_home_page.dart';
import 'package:flutter_bitirme_projesi/Not_Entered_Homepage/home_page.dart';
import 'package:flutter_bitirme_projesi/Login_Page/login_page.dart';
import 'package:flutter_bitirme_projesi/Profile/profile.dart';
import 'package:flutter_bitirme_projesi/Sign_Up_Page/sign_up.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/Popup/popup.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/new_navigation_bar.dart';
import 'package:flutter_bitirme_projesi/Voting_Page/voting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Color.fromRGBO(70, 139, 151, 1),
      )),
      home: Elections(idNo: "99988877724", password: "alperen123"),
    );
  }
}
