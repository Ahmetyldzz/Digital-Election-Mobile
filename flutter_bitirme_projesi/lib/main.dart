// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/Navigation_router/app_navigation.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/Navigation_router/main_wrapper.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Views/Elections/election_details_page.dart';
import 'package:flutter_bitirme_projesi/Views/Elections/elections.dart';
import 'package:flutter_bitirme_projesi/Views/Result_Page/voting_result.dart';
import 'package:flutter_bitirme_projesi/Views/Entered_Homepage/entered_home_page.dart';
import 'package:flutter_bitirme_projesi/Views/Not_Entered_Homepage/home_page.dart';
import 'package:flutter_bitirme_projesi/Views/Login_Page/login_page.dart';
import 'package:flutter_bitirme_projesi/Views/Profile/profile.dart';
import 'package:flutter_bitirme_projesi/Views/Sign_Up_Page/sign_up.dart';
import 'package:flutter_bitirme_projesi/widgets/Popup/popup.dart';
import 'package:flutter_bitirme_projesi/Views/Voting_Page/voting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ElectionNewModel electionNewModel = ElectionNewModel();
    /* return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Color.fromRGBO(70, 139, 151, 1),
      )),
      routerConfig: AppNavigation.goRouter,
    ); */
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Color.fromRGBO(70, 139, 151, 1),
      )),
      home: Elections(idNo: "12345678911", password: "ahoyildiz123", token: ""),
    );
  }
}
