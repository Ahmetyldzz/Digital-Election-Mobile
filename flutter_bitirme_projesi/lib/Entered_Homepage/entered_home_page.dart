import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Entered_Homepage/election_enter_type_interface.dart';

class EnteredHomePage extends StatefulWidget {
  const EnteredHomePage({super.key});

  @override
  State<EnteredHomePage> createState() => _EnteredHomePageState();
}

class _EnteredHomePageState extends State<EnteredHomePage> {
  bool tesr1 = false;
  void test() {
    setState(() {
      tesr1 = !tesr1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GeneralFrame(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: ProjectColors().darkTheme),
                onPressed: () {
                  test();
                },
                child: Text(
                  "Oy Kullan",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: ProjectColors().background),
                )),
          )
        ],
        title: Text("Anasayfa"),
      ),
      child: Stack(
        children: [
          Visibility(visible: tesr1, child: ElectionEnterTypeMenu()),
        ],
      ),
    );
  }
}
