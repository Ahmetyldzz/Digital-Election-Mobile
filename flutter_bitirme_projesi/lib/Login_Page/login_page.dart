// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/Entered_Homepage/entered_home_page.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigate_other_auth.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_button.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Sign_Up_Page/sign_up.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final TextEditingController idTextEditingContoller = TextEditingController();
  final TextEditingController passwordTextEditingContoller =
      TextEditingController();
  int? kimlikNo;
  int? statusCode;
  String? password;
  List<RegisterModel>? registersModel;
  var token;
  var response;
  late SharedPreferences prefs;
  final String _baseUrl = BackendFeatures.baseUrl;

  @override
  void initState() {
    super.initState();
    initSharedPref();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItems();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void getTokens() {
    print(prefs.getString("token"));
  }

  void loginUser(AuthModel authModel) async {
    if (idTextEditingContoller.text.isNotEmpty &&
        passwordTextEditingContoller.text.isNotEmpty) {
      try {
        var response =
            (await _dio.post("signup/auth", data: authModel.toJson()));

        if (response.statusCode == HttpStatus.ok) {
          var myToken = response;
          print(myToken);

          prefs.setString("token", myToken.toString());
          navigateToWidget(context, EnteredHomePage(idNo: idTextEditingContoller.text, password: passwordTextEditingContoller.text,));
        }
      } on DioException catch (e) {
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
            title: Text("Hatalı Giriş"),
            contentPadding: EdgeInsets.all(20.0),
            content: Text("Hatalı kimlik numarası yada şifre"),
          ),
        );
      }
    }
  }

  Future<void> _addItemToService(AuthModel authModel) async {
    final response = (await _dio.post("signup/auth", data: authModel.toJson()));

    if (response.statusCode == HttpStatus.badRequest) {
    } else if (response.statusCode == HttpStatus.ok) {
      print(response);
    }
  }

  Future<void> fetchPostItems() async {
    final response = await _dio.get(Paths.signup.name);

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        registersModel = datas.map((e) => RegisterModel.fromJson(e)).toList();
      }
    }
    print("debug");
  }

  String convertDynamicToString(dynamic value) {
    if (value is String) {
      return value;
    } else {
      // İstediğiniz dönüşümü burada yapabilirsiniz.
      return value.toString();
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return GeneralFrame(
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ProjectColors().background,
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            controller: idTextEditingContoller,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                hintText: "T.C. Kimlik Numarası"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: ProjectColors().background,
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            obscureText: true,
                            cursorColor: Colors.black,
                            controller: passwordTextEditingContoller,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                hintText: "Şifre"),
                          ),
                        ),
                      ),
                      /* TextField(
                        controller: kimlikNoTextEditingContoller,
                      ),
                      TextField(
                        controller: passwordTextEditingContoller,
                      ), */
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ProjectButtonStyle(
                            onPressed: () {
                              AuthModel authModel = AuthModel(
                                  id: idTextEditingContoller.text,
                                  password: passwordTextEditingContoller.text);
                              try {
                                loginUser(authModel);
                                /*  print("debug");

                                //print(response);
                                String tokenAsString =
                                    convertDynamicToString(response);
                                Map<String, dynamic> decodedToken =
                                    JwtDecoder.decode(tokenAsString);
                                print(tokenAsString);

                                if (decodedToken.containsValue(
                                    idTextEditingContoller.text)) {
                                  navigateToWidget(context, EnteredHomePage());
                                } else {} */
                              } catch (e) {
                                if (kDebugMode) {
                                  print(e);
                                }
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

enum Paths { signup, auth }
