// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/Constants/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Constants/sizes.dart';
import 'package:flutter_bitirme_projesi/Views/Elections/election_details_page.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Views/Result_Page/voting_result.dart';
import 'package:flutter_bitirme_projesi/Views/Voting_Page/voting.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Elections extends StatefulWidget {
  const Elections(
      {super.key,
      required this.idNo,
      required this.password,
      required this.token});
  final String idNo;
  final String password;
  final String token;

  @override
  State<Elections> createState() => _ElectionsState();
}

class _ElectionsState extends State<Elections> with NavigatorRoute {
  List<ElectionNewModel>? electionItems;
  List<ElectionNewModel> selectedElectionItems = [];
  List<Candidates>? candidateItems;
  List<Voter>? voterList;
  late Map<String, dynamic> decodedToken;

  final String _baseUrl = BackendFeatures.baseUrl;
  late final Dio _dio;
  bool _isLoading = false;

  //AuthModel authModel = AuthModel(id: id, password: "alpersonat123");

  AuthModel initModel() {
    return AuthModel(id: widget.idNo, password: widget.password);
  }

  @override
  void initState() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    super.initState();

    login();
    fetchPostItems();
  }

  void isLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void login() async {
    AuthModel authModel = initModel();
    try {
      var response = (await _dio.post("signup/auth", data: authModel.toJson()));

      if (response.statusCode == HttpStatus.ok) {
        var myToken = response;
        decodedToken = JwtDecoder.decode(myToken.toString());
      }
    } on DioException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
          title: Text("Hatalı Giriş"),
          contentPadding: EdgeInsets.all(20.0),
          content: Text("Hatalı kimlik numarası yada şifre"),
        ),
      );
    }
  }

  void setList() async {
    // isLoading();
    for (int i = 0; i < (electionItems?.length ?? 0); i++) {
      for (int j = 0; j < (electionItems?[i].voter?.length ?? 0); j++) {
        if (electionItems?[i].voter?[j].kimlikNo == decodedToken["_kimlikNo"]) {
          selectedElectionItems.add((electionItems![i]));
        }
      }
    }
    // isLoading();
  }

  Future<void> fetchPostItems() async {
    isLoading();
    final result = await _dio.get(paths.elections.name);

    if (result.statusCode == HttpStatus.ok) {
      final datas = result.data;
      if (datas is List) {
        electionItems = datas.map((e) => ElectionNewModel.fromJson(e)).toList();
        setList();
      }
    }
    isLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().background,
      appBar: AppBar(
        backgroundColor: ProjectColors().commonTheme,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator.adaptive())
          : selectedElectionItems.isEmpty
              ? Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Oy Kullanabileceğiniz Herhangi Bir Seçim Bulunmamaktadır!!",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: ListView.builder(
                    itemCount: selectedElectionItems.length,
                    itemBuilder: (context, index) {
                      return _CustomCardWidget(
                        selectedElectionModel: selectedElectionItems[index],
                        selectedElectionID:
                            selectedElectionItems[index].sId ?? "",
                        title: selectedElectionItems[index].electionTitle ?? "",
                        selectedElectionItems: selectedElectionItems,
                        electionDate:
                            "${selectedElectionItems[index].initDate} - ${selectedElectionItems[index].endDate}",
                        idNo: widget.idNo,
                        password: widget.password,
                        token: widget.token,
                      );
                    },
                  ),
                ),
    );
  }

/* Padding(
                      padding: PaddingSizes.electionBodyPadding,
                      child: _customElectionCard(
                          selectedElectionModel: selectedElectionItems[index],
                          selectedElectionID:
                              selectedElectionItems[index].sId ?? "",
                          context: context,
                          title:
                              selectedElectionItems[index].electionTitle ?? "",
                          electionDate:
                              "${selectedElectionItems[index].initDate} - ${selectedElectionItems[index].endDate}"),
                    ); */
  _customElectionCard({
    required BuildContext context,
    required String title,
    required String electionDate,
    required String selectedElectionID,
    required ElectionNewModel selectedElectionModel,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              color: ProjectColors().commonTheme,
              borderRadius: BorderRadius.circular(5)),
          width: ElectionSizes.electionCardWidth,
          height: ElectionSizes.electionCardHeight,
          child: Padding(
            padding: PaddingSizes.customElectionCardPadding,
            child: ListTile(
              title: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: ProjectColors().background),
              ),
              trailing: _customTrailingColumn(
                  context, selectedElectionID, selectedElectionModel),
              subtitle: Text(
                electionDate,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ProjectColors().background),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _customTrailingColumn(
    BuildContext context,
    String electionID,
    ElectionNewModel selectedElectionModel,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: PaddingSizes.customElectionCardTrailingColumnPadding,
            child: InkWell(
              onTap: () {
                navigateToWidget(
                  context,
                  /* VotingResult(
                    selectedElectionModelId: selectedElectionModel.sId ?? "",
                  ), */
                  Voting(
                    electionID: electionID,
                    idNo: widget.idNo,
                    password: widget.password,
                    token: widget.token,
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: ProjectColors().darkTheme,
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: IconButton(
              onPressed: () {
                navigateToWidget(
                    context,
                    ElectionDetailsPage(
                      electionNewModel: selectedElectionModel,
                    ));
              },
              icon: Icon(
                Icons.info_outlined,
                color: ProjectColors().background,
                //size: 20,
              )),
        )
      ],
    );
  }
}

class _CustomCardWidget extends StatelessWidget with NavigatorRoute {
  const _CustomCardWidget({
    super.key,
    required this.selectedElectionItems,
    required this.title,
    required this.electionDate,
    required this.selectedElectionID,
    required this.selectedElectionModel,
    required this.idNo,
    required this.password,
    required this.token,
  });

  final List<ElectionNewModel> selectedElectionItems;
  final String title;
  final String electionDate;
  final String selectedElectionID;
  final ElectionNewModel selectedElectionModel;
  final String idNo;
  final String password;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ProjectColors().commonTheme,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: ProjectColors().background, fontSize: 22),
                    ),
                    Text(
                      electionDate,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ProjectColors().background, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: ProjectColors().darkTheme,
                    radius: 15,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            navigateToWidget(
                              context,
                              VotingResult(
                                selectedElectionModelId: selectedElectionID,
                              ),
                              /* Voting(
                                electionID: selectedElectionID,
                                idNo: idNo,
                                password: password,
                                token: token,
                              ), */
                            );
                          },
                          icon: FittedBox(
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 35,
                              color: ProjectColors().background,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      navigateToWidget(
                          context,
                          ElectionDetailsPage(
                            electionNewModel: selectedElectionModel,
                          ));
                    },
                    icon: Icon(
                      Icons.info_outline,
                      size: 30,
                      color: ProjectColors().background,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum paths { elections }
