import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Voting_Page/voting.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';

class CircleDeneme extends StatefulWidget {
  const CircleDeneme({super.key});

  @override
  State<CircleDeneme> createState() => _CircleDenemeState();
}

class _CircleDenemeState extends State<CircleDeneme> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  List<AnnouncementModel>? model1;
  late final Dio _dio;
  final String _baseUrl = "http://192.168.0.16:3000/api/";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItems();
    print("çalıştı");
  }

  void isLoading() {
    _isLoading = !_isLoading;
  }

  Future<void> fetchPostItems() async {
    print(_isLoading);
    isLoading();
    print(_isLoading);
    final response = await _dio.get(paths.announcement.name);

    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;

      if (datas is List) {
        model1 = datas.map((e) => AnnouncementModel.fromJson(e)).toList();
      }
    }
    isLoading();
    print(_isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? CircularProgressIndicator.adaptive()
          : Container(
              child: PageView(
                children: [
                  Voting(),
                  Voting(),
                ],
              ),
            ),
    );
  }
}

enum paths { announcement }
