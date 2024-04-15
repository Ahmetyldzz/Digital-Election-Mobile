import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/custom_text_widget.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigate_other_auth.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_button.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Login_Page/login_page.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  double fontSize = 28;
  final String title = "Kayıt Ol";
  final String hintText1 = "Ad";
  final String hintText2 = "Soyad";
  final String hintText3 = "T.C Numarası";
  final String hintText4 = "Şifre";
  final String hintText5 = "Doğum Tarihi";
  final String hintText6 = "Telefon No";
  final String buttonText = "Kayıt Ol";
  final String underText = 'Zaten Üye Misiniz?';
  final String underText2 = ' Giriş Yap';
  final double hintTextWidth1 = 400;
  final double hintTextHeight1 = 40;
  final double hintTextWidth2 = 120;
  final double hintTextHeight2 = 40;
  bool _isLoading = false;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();
  final TextEditingController textEditingController4 = TextEditingController();
  final TextEditingController textEditingController5 = TextEditingController();
  final TextEditingController textEditingController6 = TextEditingController();

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(RegisterNewModel registerModel) async {
    _changeLoading();
    final response = await Dio().post(
        'http://192.168.200.232:3000/api/register',
        data: registerModel.toJson());
    if (response.statusCode == HttpStatus.ok) {
      print(response);
    }
    _changeLoading();
  }

  Future<void> _addItemToService2(PostModel registerModel) async {
    _changeLoading();
    final response = await Dio().post(
        'https://jsonplaceholder.typicode.com/posts',
        data: registerModel);
    if (response.statusCode == HttpStatus.ok) {
      print("response.statusCode");
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralFrame(
      child: Padding(
        padding: PaddingSizes().innerFrame,
        child: Container(
          //color: ProjectColors().koyuTema,
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: ProjectColors().background,
                      fontSize: fontSize,
                    ),
              ),
              /* Container(
                height: 40,
                color: ProjectColors().background,
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              Container(
                height: 40,
                color: ProjectColors().background,
                child: TextField(
                  controller: textEditingController2,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              Container(
                height: 40,
                color: ProjectColors().background,
                child: TextField(
                  controller: textEditingController3,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              Container(
                height: 40,
                color: ProjectColors().background,
                child: TextField(
                  controller: textEditingController4,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ), */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /* Container(
                    height: 40,
                    width: 100,
                    color: ProjectColors().background,
                    child: TextField(
                      controller: textEditingController5,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Container(s
                    width: 100,
                    height: 40,
                    color: ProjectColors().background,
                    child: TextField(
                      controller: textEditingController6,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ), */
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ProjectButtonStyle(
                  onPressed: () {
                    final model = RegisterNewModel(
                        nameee: "alper",
                        isAdmin: true,
                        surname: "adadsfsdf",
                        kimlikNo: "asdasdasdas",
                        password: "aaaaaaaaaaa",
                        dogumTrh: "2002-10-03",
                        telNo: 123123123);

                    final model2 = PostModel(
                        body: "asda", title: "asda", id: 2, userId: 3);

                    _addItemToService(model);
                  },
                  title: buttonText,
                  fontSize: 25,
                  buttonColor: ProjectColors().likePink,
                  textColor: ProjectColors().darkTheme,
                ),
              ),
              Spacer(),
              NavigateToOtherAuth(
                widget: LoginPage(),
                title: underText,
                navigateText: underText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
