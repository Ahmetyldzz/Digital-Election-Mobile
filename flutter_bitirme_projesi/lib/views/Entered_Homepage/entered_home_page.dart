import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/views/Elections/elections.dart';
import 'package:flutter_bitirme_projesi/views/Not_Entered_Homepage/home_page.dart';
import 'package:flutter_bitirme_projesi/views/Profile/profile.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/salomon_navbar.dart';
import 'package:go_router/go_router.dart';

class EnteredHomePage extends StatefulWidget {
  const EnteredHomePage(
      {super.key,
      required this.idNo,
      required this.password,
      required this.token});
  final String idNo;
  final String password;
  final String token;

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
    print(widget.token);
  }

  void isLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ProjectColors().background,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: ProjectColors().darkTheme),
                onPressed: () {
                  //context.goNamed('SubEnteredHomePage');
                  navigateToWidget(
                      context,
                      Elections(
                        idNo: "99988877724",
                        password: "alperen123",
                        //key: state.pageKey,
                      ));
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
                  navigateToWidget(
                      context,
                      ProfilePage(
                        token:
                            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjMzYjMwNzkzODdjMzkxZjBhZWY0ZTYiLCJfa2ltbGlrTm8iOiI5OTk4ODg3NzcyNCIsIl9wYXNzd29yZCI6IiQyYSQxMCRBa0hIYXZ0MjlyNENTaGxTZi5nbUJPeklpWFViQ1U0bEJwNHdCQ3NCT1Yvd21yOFI5LmFaSyIsImlhdCI6MTcxNTE5NDUzNn0.mo95JPspbHXx3QgPVb_dxJ55Jzn49Uf15SidO1GvSy0",
                      ));
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator.adaptive())
          : GeneralFrame(
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
                            return UstKisim(
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
    );
  }
}

enum paths { announcement }
