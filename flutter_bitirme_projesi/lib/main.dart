import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Giri%C5%9F%20Yap%C4%B1lm%C4%B1%C5%9F%20Anasayfa/home_page.dart';
import 'package:flutter_bitirme_projesi/Giri%C5%9F%20Yap/login_page.dart';
import 'package:flutter_bitirme_projesi/Kay%C4%B1t%20Ol/kayit_ol.dart';

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
      home: HomePage(),
    );
  }
}
