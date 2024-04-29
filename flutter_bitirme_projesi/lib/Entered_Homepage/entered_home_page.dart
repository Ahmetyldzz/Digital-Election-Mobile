import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/Elections/elections.dart';
import 'package:flutter_bitirme_projesi/Not_Entered_Homepage/home_page.dart';
import 'package:flutter_bitirme_projesi/Profile/profile.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/salomon_navbar.dart';

class EnteredHomePage extends StatefulWidget {
  const EnteredHomePage({super.key});

  @override
  State<EnteredHomePage> createState() => _EnteredHomePageState();
}

class _EnteredHomePageState extends State<EnteredHomePage> with NavigatorRoute {
  bool tesr1 = false;

  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  List<AnnouncementModel>? model1;
  late final Dio _dio;
  final String _baseUrl = BackendFeatures.baseUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItems();
    print("çalıştı");
  }

  void isLoading() {
    _isLoading = !_isLoading;
  }

  Future<void> fetchPostItems() async {
    isLoading();
    final response = await _dio.get(paths.announcement.name);

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
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: SalomonBar(),
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: ProjectColors().darkTheme),
                    onPressed: () {
                      navigateToWidget(context, Elections());
                    },
                    child: Text(
                      "Seçimler",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: ProjectColors().background),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      navigateToWidget(context, ProfilePage());
                    },
                    icon: Icon(
                      Icons.account_circle_rounded,
                      size: 40,
                      color: ProjectColors().background,
                    )),
              )
            ],
            title: Text("Anasayfa"),
          ),
          body: GeneralFrame(
            child: Column(
              children: [
                Expanded(
                  flex: 9,
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
                          return _isLoading
                              ? Center(
                                  child: CircularProgressIndicator.adaptive())
                              : UstKisim(
                                  text: model1?[index].announcementBody ?? "");
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
            ),
          ),
        ),
        /* Visibility(visible: tesr1, child: ElectionEnterTypeMenu()), */

        /*  Container(
          color: Colors.amber,
          child: Center(child: ElectionEnterTypeMenu()),
        ), */
      ],
    );
  }
}

enum paths { announcement }
