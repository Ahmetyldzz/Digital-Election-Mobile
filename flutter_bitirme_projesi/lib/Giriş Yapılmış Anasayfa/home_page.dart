import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/genel_cerceve.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/project_colors.dart';
import 'package:flutter_bitirme_projesi/Giri%C5%9F%20Yap/login_page.dart';
import 'package:flutter_bitirme_projesi/Kay%C4%B1t%20Ol/kayit_ol.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with NavigatorRoute {
  @override
  Widget build(BuildContext context) {
    return GenelCerceve(
      appBar: AppBar(
        title: Text(
          "Anasayfa",
          style: TextStyle(color: ProjectColors().arkaPlan),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(bottom: 12, top: 12, right: 20),
            child: ElevatedButton(
                onPressed: () {
                  navigateToWidget(context, KayitOl());
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: ProjectColors().koyuTema),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(color: ProjectColors().arkaPlan),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12, top: 12, right: 20),
            child: ElevatedButton(
                onPressed: () {
                  navigateToWidget(context, LoginPage());
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: ProjectColors().koyuTema),
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(color: ProjectColors().arkaPlan),
                )),
          ),
        ],
      ),
      child: Column(
        children: [
          UstKisim(
            text:
                "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ",
          ),
          AltKisim(),
        ],
      ),
    );
  }
}

class AltKisim extends StatelessWidget {
  const AltKisim({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Container(
        //color: Colors.amber,
        width: 270,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.circle,
              color: ProjectColors().koyuTema,
            ),
            Icon(
              Icons.circle,
              color: ProjectColors().yavruAgzi,
            ),
            Icon(
              Icons.circle,
              color: ProjectColors().koyuTema,
            ),
            Icon(
              Icons.circle,
              color: ProjectColors().koyuTema,
            ),
            Icon(
              Icons.circle,
              color: ProjectColors().koyuTema,
            ),
            Icon(
              Icons.circle,
              color: ProjectColors().koyuTema,
            ),
            Icon(
              Icons.circle,
              color: ProjectColors().koyuTema,
            ),
          ],
        ),
      ),
    );
  }
}

class UstKisim extends StatelessWidget {
  const UstKisim({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 15),
        child: Container(
          width: 300,
          height: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ProjectColors().koyuTema,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                  height: 250,
                  //color: Colors.amber,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: ProjectColors().arkaPlan),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Container(
                  height: 40,
                  //color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ProjectColors().yavruAgzi,
                            shape: CircleBorder(eccentricity: 0.0)),
                        child: Icon(
                          Icons.chevron_right_sharp,
                          color: ProjectColors().koyuTema,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
