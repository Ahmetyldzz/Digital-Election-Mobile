import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/Popup/popup.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/salomon_navbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<RegisterModel>? registersModel;

  Future<void> fetchPostItems() async {
    final response = await Dio().get("http://192.168.0.7:3000/api/register");
    print("object");
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        registersModel = datas.map((e) => RegisterModel.fromJson(e)).toList();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPostItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBar(),
      backgroundColor: ProjectColors().background,
      appBar: AppBar(
        backgroundColor: ProjectColors().commonTheme,
        actions: [
          Popup(),
        ],
      ),
      body: GeneralFrame(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: FittedBox(
              child: Icon(
                Icons.account_circle,
                color: ProjectColors().darkTheme,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomText(
                  headText: "Name",
                  text: registersModel?[0].name ?? "",
                ),
              ),
              Expanded(
                child: CustomText(
                  headText: "Surname",
                  text: registersModel?[0].surname ?? "",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomText(
                  headText: "T.C.",
                  text: registersModel?[0].kimlikNo.toString() ?? "",
                ),
              ),
              Expanded(
                child: CustomTextPassword(
                  label: "Password",
                  text: "asdas",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomText(
                  headText: "Phone",
                  text: registersModel?[0].telNo.toString() ?? "",
                ),
              ),
              Expanded(
                child: CustomText(
                  headText: "Date of Birth",
                  text: registersModel?[0].dogumTrh ?? "",
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.headText,
  });
  final String text;
  final String headText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headText,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ProjectColors().background),
            ),
          ),
          Container(
            width: 140,
            height: 40,
            decoration: BoxDecoration(
                color: ProjectColors().background,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextPassword extends StatefulWidget {
  const CustomTextPassword({
    super.key,
    required this.text,
    required this.label,
  });
  final String text;
  final String label;

  @override
  State<CustomTextPassword> createState() => _CustomTextPasswordState();
}

class _CustomTextPasswordState extends State<CustomTextPassword> {
  bool _isVisible = false;
  void isLoading() {
    setState(() {
      _isVisible = !_isVisible;
      print(_isVisible);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.label,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ProjectColors().background),
            ),
          ),
          Container(
            width: 140,
            height: 40,
            decoration: BoxDecoration(
                color: ProjectColors().background,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      readOnly: true,
                      obscureText: _isVisible,
                      controller: textEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.text,
                          suffixIcon: InkWell(
                            onTap: () {
                              isLoading();
                            },
                            child: Icon(
                              Icons.remove_red_eye_outlined,
                              color: ProjectColors().darkTheme,
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
