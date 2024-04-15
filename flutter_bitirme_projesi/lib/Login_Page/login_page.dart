import 'dart:ffi';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Entered_Homepage/entered_home_page.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigate_other_auth.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_button.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Sign_Up_Page/sign_up.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/salomon_navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with NavigatorRoute {
  final String title = "Giriş Yap";
  final String hintText1 = "T.C Numarası";
  final String hintText2 = "Şifre";
  final String buttonText = "Giriş Yap";
  final String underText = "Hesabınız Yok Mu?";
  final String underText2 = "Kayıt Ol";
  final double textFieldWidth = 400;
  final double textFieldHeight = 40;
  final double fontSize = 28;
  late final Dio _dio;
  final TextEditingController kimlikNoTextEditingContoller =
      TextEditingController();
  final TextEditingController passwordTextEditingContoller =
      TextEditingController();
  int? kimlikNo;
  int? statusCode;
  String? password;
  List<RegisterModel>? registersModel;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: "http://192.168.0.7:3000/api/signup/"));
    fetchPostItems();
  }

  Future<void> _addItemToService(AuthModel authModel) async {
    final response = await Dio().post(
        'http://192.168.200.232:3000/api/signup/auth',
        data: authModel.toJson());
    print("object");
    if (response.statusCode == 200) {
      statusCode = 200;
    }
  }

  Future<void> fetchPostItems() async {
    final response =
        await Dio().get("http://192.168.0.7:3000/api/announcement");

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        registersModel = datas.map((e) => RegisterModel.fromJson(e)).toList();
      }
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return GeneralFrame(
      bottomNavigationBar: SalomonBar(),
      child: Padding(
        padding: PaddingSizes().innerFrame,
        child: Container(
          //color: ProjectColors().darkTheme,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: ProjectColors().background,
                          fontSize: fontSize,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      TextField(
                        controller: kimlikNoTextEditingContoller,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      TextField(
                        controller: passwordTextEditingContoller,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ProjectButtonStyle(
                            onPressed: () {
                              AuthModel authModel = AuthModel(
                                  kimlikNo: "12345678905",
                                  password: "ahmetyildiz123");

                              _addItemToService(authModel);
                              if (statusCode == 200) {
                                navigateToWidget(context, EnteredHomePage());
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Close"),
                                      ),
                                    ],
                                    title: Text("Flutter Alert Dialogue"),
                                    contentPadding: EdgeInsets.all(20.0),
                                    content: Text("This is Alert dialog"),
                                  ),
                                );
                              }
                            },
                            title: buttonText,
                            fontSize: fontSize,
                            textColor: ProjectColors().darkTheme,
                            buttonColor: ProjectColors().likePink),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 90),
                        child: NavigateToOtherAuth(
                            widget: Signup(),
                            title: underText,
                            navigateText: underText2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
