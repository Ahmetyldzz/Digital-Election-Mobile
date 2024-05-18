import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/Views/Entered_Homepage/entered_home_page.dart';
import 'package:flutter_bitirme_projesi/widgets/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/model/custom_card_model.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Voting extends StatefulWidget {
  const Voting(
      {super.key,
      required this.electionID,
      required this.idNo,
      required this.password, required this.token});
  final String electionID;
  final String idNo;
  final String password;
  final String token;

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
  List<RegisterModel>? signupItems;
  List<ElectionNewModel>? electionItems;
  ElectionNewModel? selecetedElection;
  final String _baseUrl = BackendFeatures.baseUrl;
  late final Dio _dio;
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItems();
    getElecetionItems();
    print(widget.electionID);
  }

  void isLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void selectedElection() {
    for (int i = 0; i < (electionItems?.length ?? 0); i++) {
      if (electionItems?[i].sId == widget.electionID) {
        selecetedElection = electionItems?[i];
      }
    }
  }

  onIndexChanged(int index) {
    setState(() {
      _activeCard = index;
    });
  }

  Future<void> fetchPostItems() async {
    isLoading();
    final result = await _dio.get(paths.signup.name);
    print("object");

    if (result.statusCode == HttpStatus.ok) {
      final datas = result.data;
      if (datas is List) {
        signupItems = datas.map((e) => RegisterModel.fromJson(e)).toList();
      }
    }
    isLoading();
  }

  Future<void> putItems(int index) async {
    final result = await _dio
        .put("candidate/vote/${selecetedElection?.voter?[index].isVoted}");

    if (result.statusCode == HttpStatus.ok) {
      print("başarılı");
    }
  }

  Future<void> putIsVoted(int index) async {
    final result = await _dio
        .put("candidate/vote/${selecetedElection?.candidates?[index].sId}");

    if (result.statusCode == HttpStatus.ok) {
      print("başarılı");
    }
  }

  Future<void> getElecetionItems() async {
    isLoading();
    final result = await _dio.get(paths.elections.name);

    if (result.statusCode == HttpStatus.ok) {
      final datas = result.data;
      if (datas is List) {
        electionItems = datas.map((e) => ElectionNewModel.fromJson(e)).toList();
        selectedElection();
      }
    }
    isLoading();
  }

  @override
  Widget build(BuildContext context) {
    const double width2 = 400;

    return Scaffold(
      backgroundColor: ProjectColors().background,
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
                  itemCount: selecetedElection?.candidates?.length ?? 10,
                  itemBuilder: (context, index) {
                    return _customVotingCards(index, context);
                  },
                ),
              ),
            ),
            _votingFinishButton(width2, context),
          ],
        ),
      ),
    );
  }

  _votingFinishButton(double width2, BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          // color: Colors.red,
          width: width2,
          child: Padding(
            padding:
                const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ProjectColors().darkTheme,
                    fixedSize: Size(100, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  if (_activeCard != -1) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog.adaptive(
                        title: Text(
                          "Deneme",
                          style: TextStyle(color: Colors.red),
                        ),
                        content: Text(
                          "${signupItems?[_activeCard].name?.toUpperCase()} adlı adaya oy kullanmak üzeresiniz EMİN misiniz? ",
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
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: ProjectColors().darkTheme,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isSelected = true;
                                  });
                                  putItems(_activeCard);
                                  putIsVoted(_activeCard);
                                  Navigator.of(context).pop();
                                  if (_isSelected == true) {
                                    navigateToWidget(
                                        context,
                                        EnteredHomePage(
                                          idNo: widget.idNo,
                                          password: widget.password,
                                          token: "",
                                        ));
                                    //context.goNamed("EnteredHomePage");
                                  }
                                },
                                child: Text(
                                  "Evet",
                                  style: TextStyle(
                                      color: ProjectColors().background),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  backgroundColor: ProjectColors().darkTheme,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Hayır",
                                  style: TextStyle(
                                      color: ProjectColors().background),
                                )),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          content: Text(
                            "Lütfen herhangi bir adayı seçiniz !",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                          ),
                        );
                      },
                    );
                  }
                },
                child: Text(
                  "Oy Kullanma işlemini tamamla",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ProjectColors().background,
                      ),
                )),
          ),
        ),
      ),
    );
  }

  _customVotingCards(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: (_activeCard == index
                ? ProjectColors().likePink
                : ProjectColors().background)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
              width: 40,
              height: 40,
              child: FittedBox(
                  child: Icon(
                Icons.account_circle_rounded,
                color: ProjectColors().darkTheme,
              ))),
          Text(
            "${selecetedElection?.candidates?[index].candidateId?.name} ${selecetedElection?.candidates?[index].candidateId?.surname}",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: ProjectColors().darkTheme),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ProjectColors().darkTheme,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              onPressed: () {
                onIndexChanged(index);
                print(index);
              },
              child: Text(
                "Oy kullanabilirsiniz",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ProjectColors().background),
              )),
        ]),
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
