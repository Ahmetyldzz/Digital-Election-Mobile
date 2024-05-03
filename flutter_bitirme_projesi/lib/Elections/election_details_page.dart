import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';

class ElectionDetailsPage extends StatefulWidget {
  const ElectionDetailsPage({super.key, required this.electionNewModel});
  final ElectionNewModel electionNewModel;

  @override
  State<ElectionDetailsPage> createState() => _ElectionDetailsPageState();
}

class _ElectionDetailsPageState extends State<ElectionDetailsPage> {
  List<CandidatesModel> candidates = [];
  late final Dio _dio;
  final String _baseUrl = BackendFeatures.baseUrl;
  List<PopupMenuItem<dynamic>> popupMenuList = [];

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    setList();
    print(popupMenuList.length);
  }

  void setList() {
    for (int i = 0;
        i < (widget.electionNewModel.candidates?.length ?? 0);
        i++) {
      popupMenuList.add(_customPopupMenuItem(context,
          (widget.electionNewModel.candidates?[i].candidateId?.name ?? "")));
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
                "${widget.electionNewModel.electionTitle}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: ProjectColors().background, fontSize: 28),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _customElectionInformation(
                        context, "${widget.electionNewModel.initDate}"),
                    _customElectionInformation(
                        context, "${widget.electionNewModel.endDate}"),
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
                    print(value);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  initialValue: Text("sd"),
                  itemBuilder: (context) {
                    return popupMenuList;
                  },
                )
              ],
            ),
          )),
    );
  }

  ListView popupMenuItmesBuilder() {
    return ListView.builder(
      itemCount: widget.electionNewModel.candidates?.length ?? 2,
      itemBuilder: (context, index) {
        return _customPopupMenuItem(
            context,
            widget.electionNewModel.candidates?[index].candidateId?.name ??
                "başarısız");
      },
    );
  }

  PopupMenuItem<dynamic> _customPopupMenuItem(
      BuildContext context, String candidateName) {
    return PopupMenuItem(
      child: Text(candidateName),
      onTap: () {
        _showDialog(context, candidateName);
      },
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
        content:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(
            color: ProjectColors().commonTheme,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Adayın ismi: ${candidateName}",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
          Text(
            "Adayın Soyadı: ${widget.electionNewModel.candidates?[0].candidateId?.surname}",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.black,
                ),
          ),
          Text(
            "Adayın Doğum Tarihi: ${widget.electionNewModel.candidates?[0].candidateId?.dogumTrh}",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.black,
                ),
          ),
        ]),
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
