import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/postmodel.dart';

class Deneme extends StatefulWidget {
  const Deneme({super.key});

  @override
  State<Deneme> createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();

  Future<void> _addItemToService(AuthModel authModel) async {
    final response = await Dio()
        .post('http://192.168.0.7:3000/api/signup/auth', data: authModel);
    if (response.statusCode == HttpStatus.ok) {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: textEditingController2,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            FloatingActionButton(
              onPressed: () {
                final authModel = AuthModel(
                    kimlikNo: "12345678913" , password: "ahmetyildiz123");
                _addItemToService(authModel);
              },
            )
          ],
        ),
      ),
    );
  }
}
