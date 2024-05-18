// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/Model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Views/Result_Page/indicator.dart';

class VotingResult extends StatefulWidget {
  const VotingResult({super.key, required this.selectedElectionModelId});
  final String selectedElectionModelId;
  @override
  State<StatefulWidget> createState() =>
      VotingResultState(selectedElectionID: selectedElectionModelId);
}

class VotingResultState extends State {
  final String? selectedElectionID;
  int touchedIndex = -1;
  Dio dio = Dio();
  final String _baseUrl = BackendFeatures.baseUrl;
  ElectionNewModel? selectedElectionModel;
  bool _isLoading = false;

  List<ElectionNewModel>? elections;
  VotingResultState({
    this.selectedElectionID,
  });

  @override
  void initState() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
    getItems();

    super.initState();
  }

  void isLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> getItems() async {
    isLoading();
    final response = await dio.get(path.elections.name);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        elections = data.map((e) => ElectionNewModel.fromJson(e)).toList();
        selectItem();
      }
    }
    isLoading();
  }

  selectItem() {
    for (int x = 0; x < (elections?.length ?? 0); x++) {
      if (elections?[x].sId == selectedElectionID) {
        selectedElectionModel = elections?[x];
      }
    }
    setItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().background,
      appBar: AppBar(
        backgroundColor: ProjectColors().commonTheme,
      ),
      body: _isLoading
          ? CircularProgressIndicator.adaptive()
          : Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  //color: Colors.amber,
                  child: AspectRatio(
                    aspectRatio: 1.3,
                    child: Container(
                      //color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            height: 18,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              // color: Colors.red,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: PieChart(
                                  PieChartData(
                                    pieTouchData: PieTouchData(
                                      touchCallback: (FlTouchEvent event,
                                          pieTouchResponse) {
                                        setState(() {
                                          if (!event
                                                  .isInterestedForInteractions ||
                                              pieTouchResponse == null ||
                                              pieTouchResponse.touchedSection ==
                                                  null) {
                                            touchedIndex = -1;
                                            return;
                                          }
                                          touchedIndex = pieTouchResponse
                                              .touchedSection!
                                              .touchedSectionIndex;
                                        });
                                      },
                                    ),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 40,
                                    sections: showingSections2(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                indicatorList, /* [
                        Indicator(
                          color: Colors.amber,
                          text: 'Selim',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Colors.red,
                          text: 'Ahmet',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Colors.blue,
                          text: 'Alperen',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Indicator(
                          color: Colors.purple,
                          text: 'Alper',
                          isSquare: true,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                      ] */
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  List<Widget> indicatorList = [];
  void setItems() {
    for (int y = 0; y < (selectedElectionModel?.candidates?.length ?? 0); y++) {
      indicatorList.add(Indicator(
        size: 24,
        color: y == 0
            ? Colors.purple
            : y == 1
                ? Colors.black
                : y == 2
                    ? Color.fromARGB(255, 41, 80, 148)
                    : Colors.red,
        isSquare: true,
        text: selectedElectionModel?.candidates?[y].candidateId?.name ?? "",
      ));
    }
  }

  int voteRatio() {
    int toplamOy = 0;
    for (int x = 0; x < (selectedElectionModel?.candidates?.length ?? 0); x++) {
      toplamOy += selectedElectionModel?.candidates?[x].vote ?? 0;
    }
    return toplamOy;
  }

  showVote(bool isTouched, double value, int i) {
    return isTouched
        ? ((selectedElectionModel?.candidates?[i].vote ?? 0))
        : "%${(value / voteRatio() * 100).round()}";
  }

  List<PieChartSectionData> showingSections2() {
    return List.generate(selectedElectionModel?.candidates?.length ?? 0, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 35.0 : 26.0;
      final radius = isTouched ? 80.0 : 70.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      print(voteRatio());

      return PieChartSectionData(
        color: i == 0
            ? Colors.purple
            : i == 1
                ? Colors.black
                : i == 2
                    ? const Color.fromARGB(255, 41, 80, 148)
                    : Colors.red,
        value: (selectedElectionModel?.candidates?[i].vote)?.toDouble() ?? 0,
        title: (
          showVote(
                  isTouched,
                  (selectedElectionModel?.candidates?[i].vote ?? 0).toDouble(),
                  i)
              .toString(),
        ).toString(),
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      );
    });
  }
}

enum path { candidate, elections }
