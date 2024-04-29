import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/Entered_Homepage/entered_home_page.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/model/custom_card_model.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Voting extends StatefulWidget {
  const Voting({super.key});

  @override
  State<Voting> createState() => _VotingState();
}

class _VotingState extends State<Voting> with NavigatorRoute {
  bool isClicked = false;
  int _currentIndex = 0;
  int _activeCard = -1;
  bool _isLoading = false;
  bool _isSelected = false;
  Color? renk = ProjectColors().background;
  List<CustomCardModel>? model1;
  List<RegisterModel>? model2;
  final String _baseUrl = BackendFeatures.baseUrl;
  late final Dio _dio;
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItems();
  }

  void isLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  onIndexChanged(int index) {
    setState(() {
      _activeCard = index;
    });
  }

  Future<void> fetchPostItems() async {
    isLoading();
    final result = await _dio.get(paths.register.name);

    if (result.statusCode == HttpStatus.ok) {
      final datas = result.data;
      if (datas is List) {
        model2 = datas.map((e) => RegisterModel.fromJson(e)).toList();
      }
    }
    isLoading();
  }

  @override
  Widget build(BuildContext context) {
    const double width2 = 400;

    /*  void isSelected() {
      setState(() {
        isClicked = !isClicked;
      });
    } */

    return Scaffold(
      backgroundColor: ProjectColors().background,
      bottomNavigationBar: customSolomonNavigationBar(),
      appBar: AppBar(
        actions: [
          _isLoading ? CircularProgressIndicator.adaptive() : SizedBox.shrink()
        ],
        backgroundColor: ProjectColors().commonTheme,
      ),
      body: GeneralFrame(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                  itemCount: model2?.length ?? 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: (_activeCard == index
                                ? ProjectColors().likePink
                                : ProjectColors().background)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: FittedBox(
                                      child: Icon(
                                    Icons.account_circle_rounded,
                                    color: ProjectColors().darkTheme,
                                  ))),
                              Text(
                                model2?[index].name ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: ProjectColors().darkTheme),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          ProjectColors().darkTheme),
                                  onPressed: () {
                                    onIndexChanged(index);
                                  },
                                  child: Text(
                                    "Oy kullanabilirsiniz",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: ProjectColors().background),
                                  )),
                            ]),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    // color: Colors.red,
                    width: width2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, top: 15, bottom: 15),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ProjectColors().darkTheme,
                              maximumSize: Size(100, 50)),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog.adaptive(
                                title: Text(
                                  "Deneme",
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: Text(
                                  "${model2?[_activeCard].name?.toUpperCase()} adlı adaya oy kullanmak üzeresiniz EMİN misiniz? ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontSize: 20),
                                ),
                                actions: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor:
                                              ProjectColors().darkTheme,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isSelected = true;
                                          });
                                          Navigator.of(context).pop();
                                          if (_isSelected == true) {
                                            navigateToWidget(
                                                context, EnteredHomePage());
                                          }
                                        },
                                        child: Text("Evet")),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor:
                                              ProjectColors().darkTheme,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Hayır")),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            "Oy Kullanma işlemini tamamla",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: ProjectColors().background,
                                    ),
                          )),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  SalomonBottomBar customSolomonNavigationBar() {
    return SalomonBottomBar(
      selectedItemColor: ProjectColors().likePink,
      unselectedItemColor: ProjectColors().background,
      backgroundColor: ProjectColors().commonTheme,
      currentIndex: _currentIndex,
      onTap: (p0) {
        setState(() {
          _currentIndex = p0;
        });
      },
      items: [
        SalomonBottomBarItem(icon: Icon(Icons.home), title: Text("Home")),
        SalomonBottomBarItem(icon: Icon(Icons.search), title: Text("Search")),
        SalomonBottomBarItem(icon: Icon(Icons.mail), title: Text("Mail")),
        SalomonBottomBarItem(
            icon: Icon(Icons.notifications), title: Text("Notifications")),
      ],
    );
  }
}

class _CustomColumnCard extends StatelessWidget {
  const _CustomColumnCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Color? color;
    return Column(children: [
      Container(
          color: color,
          width: 40,
          height: 40,
          child: FittedBox(
              child: Icon(
            Icons.account_circle_rounded,
            color: ProjectColors().darkTheme,
          ))),
      Text(
        "Ahmet Yıldız",
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: ProjectColors().darkTheme),
      ),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ProjectColors().darkTheme),
          onPressed: () {
            color = ProjectColors().likePink;
          },
          child: Text(
            "Oy kullanabilirsiniz",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: ProjectColors().background),
          )),
    ]);
  }
}

enum paths {
  candidate,
  elections,
  electiontypes,
  signup,
  voterlist,
  directory,
  announcement,
  register
}
