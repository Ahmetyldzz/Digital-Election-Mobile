import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().background,
      appBar: AppBar(
        backgroundColor: ProjectColors().commonTheme,
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
              CustomText(
                headText: "Name",
                text: "Ahmet ",
              ),
              CustomText(
                headText: "Surname",
                text: "Yıldız",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                headText: "T.C.",
                text: "58279148824",
              ),
              CustomTextPassword(
                label: "Password",
                text: "***********",
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                headText: "Phone",
                text: "05462414260",
              ),
              CustomText(
                headText: "Date of Birth",
                text: "11.05.2001",
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
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    bool isVisible = false;
    void isChanged() {
      setState(() {
        isVisible = !isVisible;
      });
    }

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
                      obscureText: isVisible,
                      controller: textEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.text,
                          suffixIcon: InkWell(
                            onTap: () {},
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
