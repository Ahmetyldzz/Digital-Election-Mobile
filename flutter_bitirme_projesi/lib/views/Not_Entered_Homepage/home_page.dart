import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/widgets/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Views/Login_Page/login_page.dart';
import 'package:flutter_bitirme_projesi/Views/Sign_Up_Page/sign_up.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with NavigatorRoute {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  List<AnnouncementModel>? model1;
  bool _isLoading = false;
  late final Dio _dio;
  final String _baseUrl = BackendFeatures.baseUrl;
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItems();
    print(widget.key);
  }

  void isLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    isLoading();
    final response = await _dio.get("announcement");

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        model1 = datas.map((e) => AnnouncementModel.fromJson(e)).toList();
      }
    }
    isLoading();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralFrame(
      appBar: AppBar(
        title: Text(
          "Anasayfa",
          style: TextStyle(color: ProjectColors().background),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(bottom: 12, top: 12, right: 20),
            child: ElevatedButton(
                onPressed: () {
                  //context.goNamed('Signup');
                  navigateToWidget(context, Signup());
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: ProjectColors().darkTheme),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(color: ProjectColors().background),
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
                    backgroundColor: ProjectColors().darkTheme),
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(color: ProjectColors().background),
                )),
          ),
        ],
      ),
      child: _isLoading
          ? Center(child: CircularProgressIndicator.adaptive())
          : _notEnteredHomePageContent(),
    );
  }

  Column _notEnteredHomePageContent() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Expanded(
            flex: 1,
            child: Text(
              "Yaklaşan 2024 Seçimleri",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: ProjectColors().background, fontSize: 24),
            )),
        Expanded(
          flex: 8,
          child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _activePage = page;
                  });
                },
                itemCount: model1?.length,
                itemBuilder: (context, index) {
                  return UstKisim(text: model1?[index].announcementTitle ?? "");
                },
              )),
        ),
        Expanded(
            flex: 1,
            child: AltKisim(
                pages: model1,
                pageController: _pageController,
                activePage: _activePage)),
      ],
    );
  }
}

class AltKisim extends StatelessWidget {
  const AltKisim({
    super.key,
    required this.pages,
    required PageController pageController,
    required int activePage,
  })  : _pageController = pageController,
        _activePage = activePage;

  final List? pages;
  final PageController _pageController;
  final int _activePage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(
            pages?.length ?? 0,
            (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      _pageController.animateToPage(index,
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeIn);
                    },
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: _activePage == index
                          ? ProjectColors().likePink
                          : ProjectColors().darkTheme,
                    ),
                  ),
                )),
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
        padding: const EdgeInsets.only(top: 0, bottom: 15),
        child: Container(
          width: 300,
          height: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ProjectColors().darkTheme,
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
                            ?.copyWith(color: ProjectColors().background),
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
                            backgroundColor: ProjectColors().likePink,
                            shape: CircleBorder(eccentricity: 0.0)),
                        child: Icon(
                          Icons.chevron_right_sharp,
                          color: ProjectColors().darkTheme,
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
