import 'dart:io';

import 'package:bcrypt/bcrypt.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigate_other_auth.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_button.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Login_Page/login_page.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> with NavigatorRoute {
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
  late final Dio _dio;
  final String _baseUrl = BackendFeatures.baseUrl;
  final TextEditingController tcKimlikNoEditingController =
      TextEditingController();
  final TextEditingController isimEditingController = TextEditingController();
  final TextEditingController soyisimEditingController =
      TextEditingController();
  final TextEditingController sifreEditingController = TextEditingController();
  final TextEditingController dogumTarihiEditingController =
      TextEditingController();
  final TextEditingController telNoEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(RegisterNewModel registerModel) async {
    _changeLoading();
    final response = await _dio.post(
        'signup/create',
        data: registerModel.toJson());
    if (response.statusCode == HttpStatus.ok) {
      print(response);
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
              customTextField(
                  hintText: "T.C Kimlik Numarası",
                  textEditingController: tcKimlikNoEditingController,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.next),
              customTextField(
                hintText: "İsim",
                textEditingController: isimEditingController,
                textInputAction: TextInputAction.next,
              ),
              customTextField(
                hintText: "Soyisim",
                textEditingController: soyisimEditingController,
                textInputAction: TextInputAction.next,
              ),
              customTextField(
                  hintText: "Parola",
                  textEditingController: sifreEditingController,
                  textInputAction: TextInputAction.next,
                  isObscure: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: customTextField(
                    hintText: "Doğum Tarihi",
                    textEditingController: dogumTarihiEditingController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.datetime,
                  )),
                  Expanded(
                      child: customTextField(
                    hintText: "Tel No:",
                    textEditingController: telNoEditingController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.phone,
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ProjectButtonStyle(
                  onPressed: () {
                    final model = RegisterNewModel(
                        nameee: isimEditingController.text,
                        isAdmin: false,
                        surname: soyisimEditingController.text,
                        kimlikNo: tcKimlikNoEditingController.text,
                        password: sifreEditingController.text,
                        dogumTrh: dogumTarihiEditingController.text,
                        telNo: int.tryParse(telNoEditingController.text));

                    _addItemToService(model);
                    navigateToWidget(context, LoginPage());
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

  Padding customTextField({
    required String hintText,
    required TextEditingController textEditingController,
    TextInputAction? textInputAction = TextInputAction.done,
    TextInputType? textInputType = TextInputType.text,
    bool isObscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: ProjectColors().background,
            borderRadius: BorderRadius.circular(12)),
        child: TextField(
          obscureText: isObscure,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          cursorColor: Colors.black,
          controller: textEditingController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: hintText),
        ),
      ),
    );
  }
}
