// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/Elections/election_details_page.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Voting_Page/voting.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Elections extends StatefulWidget {
  const Elections({super.key});

  @override
  State<Elections> createState() => _ElectionsState();
}

class _ElectionsState extends State<Elections> with NavigatorRoute {
  List<ElectionNewModel>? electionItems;
  List<ElectionNewModel> selectedElectionItems = [];
  List<Candidatess>? candidateItems;
  List<Voter>? voterList;
  late Map<String, dynamic> decodedToken;

  var response;
  final String _baseUrl = BackendFeatures.baseUrl;
  late final Dio _dio;
  bool _isLoading = false;
  int i = 0;
  AuthModel authModel = AuthModel(id: "12345678901", password: "alpersonat123");

  @override
  void initState() {
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    super.initState();
    fetchPostItems();
    checkElections();
  }

  void checkElections() {
    for (i; i < (electionItems?.length ?? 0); i++) {
      for (int j = 0; j < (electionItems?[i].voter?.length ?? 0); j++) {
        if (electionItems?[i].voter?[j].sId == "661dcc4bf63c3704fbc3c2f7") {
          print("counter");
          selectedElectionItems.add((electionItems![i]));
        }
      }
    }
  }

  void isLoading() {
    _isLoading = !_isLoading;
  }

  void Login(AuthModel authModel) async {
    try {
      var response = (await _dio.post("signup/auth", data: authModel.toJson()));

      if (response.statusCode == HttpStatus.ok) {
        var myToken = response;
        decodedToken = JwtDecoder.decode(myToken.toString());
        print(decodedToken["name"]);
      }
    } on DioException catch (e) {
      print(e.message);
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

  Future<void> fetchPostItems() async {
    isLoading();
    final result = await _dio.get(paths.elections.name);

    if (result.statusCode == HttpStatus.ok) {
      final datas = result.data;
      if (datas is List) {
        electionItems = datas.map((e) => ElectionNewModel.fromJson(e)).toList();
        for (i; i < (electionItems?.length ?? 0); i++) {
          for (int j = 0; j < (electionItems?[i].voter?.length ?? 0); j++) {
            if (electionItems?[i].voter?[j].sId == "661dcc4bf63c3704fbc3c2f6") {
              print("counter");
              selectedElectionItems.add((electionItems![i]));
            }
          }
        }

        print(selectedElectionItems[0].electionTitle);
        print(selectedElectionItems.length);
      }
    }

    isLoading();
  }

/* 
  if(electionItems.voters.kimlikno)

 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ProjectColors().background,
        appBar: AppBar(
          backgroundColor: ProjectColors().commonTheme,
        ),
        body: ListView.builder(
          itemCount: selectedElectionItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _customElectionCard(
                  context: context,
                  title: selectedElectionItems[index].electionTitle ?? "",
                  electionDate:
                      "${selectedElectionItems[index].initDate} - ${selectedElectionItems[index].endDate}"),
            );
          },
        ));
  }

  Card _customElectionCard(
      {required BuildContext context,
      required String title,
      required String electionDate}) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
            color: ProjectColors().commonTheme,
            borderRadius: BorderRadius.circular(5)),
        width: 200,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: ProjectColors().background),
            ),
            trailing: _customTrailingColumn(context),
            subtitle: Container(
                //color: Colors.amber,
                child: Text(
              electionDate,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ProjectColors().background),
            )),
          ),
        ),
      ),
    );
  }

  Column _customTrailingColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: InkWell(
              onTap: () {
                navigateToWidget(context, Voting());
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
                navigateToWidget(context, ElectionDetailsPage());
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

enum paths { elections }
