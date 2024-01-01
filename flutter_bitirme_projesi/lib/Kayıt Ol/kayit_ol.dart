import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/custom_text_widget.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/genel_cerceve.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/navigate_other_auth.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/project_button.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/project_colors.dart';

class KayitOl extends StatefulWidget {
  const KayitOl({super.key});

  @override
  State<KayitOl> createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
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
  @override
  Widget build(BuildContext context) {
    return GenelCerceve(
      child: Padding(
        padding: PaddingSizes().icCerceve,
        child: Container(
          //color: ProjectColors().koyuTema,
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: ProjectColors().arkaPlan,
                      fontSize: fontSize,
                    ),
              ),
              CustomTextWidget(
                hintText: hintText1,
                width: hintTextWidth1,
                height: hintTextHeight1,
              ),
              CustomTextWidget(
                hintText: hintText2,
                width: hintTextWidth1,
                height: hintTextHeight1,
              ),
              CustomTextWidget(
                hintText: hintText3,
                width: hintTextWidth1,
                height: hintTextHeight1,
              ),
              CustomTextWidget(
                hintText: hintText4,
                width: hintTextWidth1,
                height: hintTextHeight1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    hintText: hintText5,
                    width: hintTextWidth2,
                    height: hintTextHeight2,
                  ),
                  CustomTextWidget(
                    hintText: hintText6,
                    width: hintTextWidth2,
                    height: hintTextHeight2,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ProjectButtonStyle(
                  title: buttonText,
                  fontSize: 25,
                  buttonColor: ProjectColors().yavruAgzi,
                  textColor: ProjectColors().koyuTema,
                ),
              ),
              Spacer(),
              NavigateToOtherAuth(
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
