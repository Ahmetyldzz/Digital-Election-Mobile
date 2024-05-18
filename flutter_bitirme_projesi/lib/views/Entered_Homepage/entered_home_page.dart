import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/Views/Elections/elections.dart';
import 'package:flutter_bitirme_projesi/Views/Not_Entered_Homepage/home_page.dart';
import 'package:flutter_bitirme_projesi/Views/Profile/profile.dart';
import 'package:flutter_bitirme_projesi/widgets/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnteredHomePage extends StatefulWidget {
  const EnteredHomePage(
      {super.key,
      required this.idNo,
      required this.password,
      required this.token,
      this.prefs});
  final String idNo;
  final String password;
  final String token;
  final SharedPreferences? prefs;

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
      resizeToAvoidBottomInset: false,
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
                  navigateToWidget(
                      context,
                      Elections(
                        idNo: widget.idNo,
                        password: widget.password,
                        token: widget.token,
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
                        token: widget.token,
                        prefs: widget.prefs,
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
          : _customGeneralFrame(),
    );
  }

  SingleChildScrollView _customSingleChildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
              color: ProjectColors().commonTheme,
              borderRadius: BorderRadius.circular(12)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: Colors.amber,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: Colors.amber,
                      child: TextField(
                        autofocus: true,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GeneralFrame _customGeneralFrame() {
    return GeneralFrame(
      child: Column(
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
    );
  }

  GeneralFrame _customGeneralFrame2() {
    return GeneralFrame(
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
    );
  }
}

enum paths { announcement }
