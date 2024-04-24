import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';

class ElectionDetailsPage extends StatefulWidget {
  const ElectionDetailsPage({super.key});

  @override
  State<ElectionDetailsPage> createState() => _ElectionDetailsPageState();
}

class _ElectionDetailsPageState extends State<ElectionDetailsPage> {
  List<CandidatesModel> candidates = [];
  late final Dio _dio;
  final String _baseUrl = "http://192.168.0.16:3000/api/";

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItems();
  }

  Future<void> fetchPostItems() async {
    final response = await _dio.get('candidate');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        candidates = data.map((e) => CandidatesModel.fromJson(e)).toList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().background,
      body: GeneralFrame(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Text(
                "2018 Cumhurbaşkanlığı\nSeçimi",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: ProjectColors().background, fontSize: 28),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _customElectionInformation(
                        context, "Seçim Başlangıç Tarihi : 12 - 04 -2018"),
                    _customElectionInformation(
                        context, "Seçim Bitiş Tarihi : 12 - 04 -2018"),
                    _customElectionInformation2(context, "Adaylar"),
                    _customElectionInformation(
                        context, "Kazanma Koşulu : 50+1"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _customElectionInformation(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ProjectColors().darkTheme),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: ProjectColors().background, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Padding _customElectionInformation2(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ProjectColors().darkTheme),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ProjectColors().background, fontSize: 20),
                ),
                PopupMenuButton(
                  color: ProjectColors().background,
                  elevation: 10,
                  icon: Icon(Icons.account_box_rounded),
                  onSelected: (value) {
                    print("value.toString()");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text(candidates[0].candidateId?.name ?? ""),
                        onTap: () {
                          _showDialog(
                              context, Candidates.RecepTayyipErdogan.name);
                        },
                      ),
                      PopupMenuItem(
                        child: Text("KK"),
                        onTap: () {
                          _showDialog(
                              context, Candidates.KemalKilicdaroglu.name);
                        },
                      ),
                      PopupMenuItem(
                        child: Text("MİNCE"),
                        onTap: () {
                          _showDialog(context, Candidates.MuharremInce.name);
                        },
                      ),
                      PopupMenuItem(
                        child: Text("SOĞAN"),
                        onTap: () {
                          _showDialog(context, Candidates.SinanOgan.name);
                        },
                      ),
                    ];
                  },
                )
              ],
            ),
          )),
    );
  }

  Future<dynamic> _showDialog(BuildContext context, String candidateName) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ProjectColors().background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Close"),
          ),
        ],
        title: Text(candidateName),
        contentPadding: EdgeInsets.all(20.0),
        content: Text("Hatalı kimlik numarası yada şifre" * 15),
      ),
    );
  }
}

enum Candidates {
  RecepTayyipErdogan,
  KemalKilicdaroglu,
  MuharremInce,
  SinanOgan
}
