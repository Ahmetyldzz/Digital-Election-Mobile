import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/custom_text_widget.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/genel_cerceve.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/navigate_other_auth.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/project_button.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/project_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String title = "Giriş Yap";
    final String hintText1 = "T.C Numarası";
    final String hintText2 = "Şifre";
    final String buttonText = "Giriş Yap";
    final String underText = "Hesabınız Yok Mu?";
    final String underText2 = "Kayıt Ol";
    final double textFieldWidth = 400;
    final double textFieldHeight = 40;
    final double fontSize = 28;
  @override
  Widget build(BuildContext context) {
    
    return GenelCerceve(
      
      child: Padding(
        padding: PaddingSizes().icCerceve,
        child: Container(
          //color: ProjectColors().koyuTema,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: ProjectColors().arkaPlan,
                          fontSize: fontSize,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      CustomTextWidget(
                        hintText: hintText1,
                        width: textFieldWidth,
                        height: textFieldHeight,
                      ),
                      CustomTextWidget(
                        hintText: hintText2,
                        width: textFieldWidth,
                        height: textFieldHeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ProjectButtonStyle(
                            title: buttonText,
                            fontSize: fontSize,
                            textColor: ProjectColors().koyuTema,
                            buttonColor: ProjectColors().yavruAgzi),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 90),
                        child: NavigateToOtherAuth(
                            title: underText, navigateText: underText2),
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
