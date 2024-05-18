import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/backend_featues.dart';
import 'package:flutter_bitirme_projesi/widgets/Popup/popup.dart';
import 'package:flutter_bitirme_projesi/widgets/general_frame.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.token, required this.prefs});
  final String token;
  final SharedPreferences? prefs;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<RegisterModel>? registersModel;
  RegisterModel? selectedRegisterModel = RegisterModel();
  final String _baseUrl = BackendFeatures.baseUrl;
  late final Dio _dio;
  bool _isLoading = false;
  late Map<String, dynamic> decodedToken;
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    fetchPostItems();
    decodedToken = JwtDecoder.decode(widget.token);
    print(widget.prefs?.getString("token") ?? "");
  }

  void isLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void setList() {
    for (int i = 0; i < (registersModel?.length ?? 0); i++) {
      if (decodedToken["_kimlikNo"] == registersModel?[i].kimlikNo) {
        selectedRegisterModel = (registersModel?[i]);
      }
    }
  }

  Future<void> fetchPostItems() async {
    isLoading();
    final response = await _dio.get("signup");
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        registersModel = datas.map((e) => RegisterModel.fromJson(e)).toList();
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
        actions: [
          Popup(),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator.adaptive())
          : GeneralFrame(
              child: Column(children: [
                SizedBox(
                  height: 10,
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
                        text: selectedRegisterModel?.name ?? "",
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        headText: "Surname",
                        text: selectedRegisterModel?.surname ?? "",
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
                        text: selectedRegisterModel?.kimlikNo.toString() ?? "",
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
                        text: selectedRegisterModel?.telNo.toString() ?? "",
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        headText: "Date of Birth",
                        text: selectedRegisterModel?.dogumTrh ?? "",
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
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 18),
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
