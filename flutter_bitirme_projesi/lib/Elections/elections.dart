import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Voting_Page/voting.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Elections extends StatefulWidget {
  const Elections({super.key});

  @override
  State<Elections> createState() => _ElectionsState();
}

class _ElectionsState extends State<Elections> with NavigatorRoute {
  List<ElectionModel>? model2;
  late Map<String, dynamic> decodedToken;
  var response;

  get http => null;
  @override
  void initState() {
    super.initState();
    fetchPostItems();
    try {
      _addItemToService();
      String tokenAsString = convertDynamicToString(response);
      decodedToken = JwtDecoder.decode(tokenAsString);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchPostItems() async {
    final result = await Dio().get("http://192.168.200.232:3000/api/elections");

    if (result.statusCode == HttpStatus.ok) {
      final datas = result.data;
      if (datas is List) {
        model2 = datas.map((e) => ElectionModel.fromJson(e)).toList();
        print(model2?[2].voter);
      }
    }
  }

  String convertDynamicToString(dynamic value) {
    if (value is String) {
      return value;
    } else {
      // İstediğiniz dönüşümü burada yapabilirsiniz.
      return value.toString();
    }
  }

  Future<void> _addItemToService() async {
    response = (await Dio().post('http://192.168.200.232:3000/api/signup/auth',
        data: AuthModel(kimlikNo: "1321321321", password: "ahmetyildiz123")
            .toJson()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ProjectColors().background,
        appBar: AppBar(
          backgroundColor: ProjectColors().commonTheme,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: ProjectColors().commonTheme,
                      borderRadius: BorderRadius.circular(5)),
                  width: 200,
                  height: 100,
                  child: ListTile(
                    title: Text(
                      "2024 Cumhurbaşkanlığı Seçimi",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: ProjectColors().background),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: InkWell(
                            onTap: () {
                              navigateToWidget(context, Voting());
                            },
                            child: CircleAvatar(
                              backgroundColor: ProjectColors().darkTheme,
                              child: Icon(
                                Icons.chevron_right_rounded,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Container(
                        //color: Colors.amber,
                        child: Text(
                      "11-10-2024 12-10-2024",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: ProjectColors().background),
                    )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: ProjectColors().commonTheme,
                      borderRadius: BorderRadius.circular(5)),
                  width: 200,
                  height: 100,
                  child: ListTile(
                    title: Text(
                      "2018 Cumhurbaşkanlığı Seçimi",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: ProjectColors().background),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: InkWell(
                            onTap: () {
                              navigateToWidget(context, Voting());
                            },
                            child: CircleAvatar(
                              backgroundColor: ProjectColors().darkTheme,
                              child: Icon(
                                Icons.chevron_right_rounded,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Container(
                        //color: Colors.amber,
                        child: Text(
                      "16-04-2018 - 17-04-2018",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: ProjectColors().background),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
