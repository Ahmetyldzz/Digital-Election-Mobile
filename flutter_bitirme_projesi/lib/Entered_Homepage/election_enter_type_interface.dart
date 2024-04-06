import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class ElectionEnterTypeMenu extends StatefulWidget {
  const ElectionEnterTypeMenu({super.key});

  @override
  State<ElectionEnterTypeMenu> createState() => _ElectionEnterTypeMenuState();
}

class _ElectionEnterTypeMenuState extends State<ElectionEnterTypeMenu> {
  bool _ActiveButton = false;
  void buttonChanged() {
    setState(() {
      _ActiveButton = !_ActiveButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ProjectColors().background,
        ),
        width: 250,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 25),
              child: Text(
                "Seçim Erişim Arayüzü",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    width: 175,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (_ActiveButton == false)
                                ? ProjectColors().commonTheme
                                : ProjectColors().likePink,
                            shape:
                                RoundedRectangleBorder(side: BorderSide.none)),
                        onPressed: () {
                          _ActiveButton == false ? buttonChanged() : null;
                        },
                        child: Text(
                          "ID ile giriş",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: _ActiveButton == false
                                      ? ProjectColors().background
                                      : ProjectColors().darkTheme),
                        ),
                      ),
                    ),
                  ),
                ),
                /*  Expanded(
                  child: SizedBox(
                    width: 175,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (_ActiveButton == true)
                                ? ProjectColors().commonTheme
                                : ProjectColors().likePink,
                            shape:
                                RoundedRectangleBorder(side: BorderSide.none)),
                        onPressed: () {
                          _ActiveButton == true ? buttonChanged() : null;
                        },
                        child: Text(
                          "URL ile giriş",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: _ActiveButton == true
                                      ? ProjectColors().background
                                      : ProjectColors().darkTheme),
                        ),
                      ),
                    ),
                  ),
                ), */
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                color: Colors.white,
                height: 30,
                child: TextField(
                  keyboardType: (_ActiveButton == true)
                      ? TextInputType.phone
                      : TextInputType.url,
                  decoration: InputDecoration(
                      hintText: (_ActiveButton == true)
                          ? "ID ile giriş "
                          : "URL ile giriş",
                      border: OutlineInputBorder(),
                      focusColor: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ProjectColors().commonTheme,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text(
                          "Seçime Bağlanın",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                  fontSize: 14,
                                  color: ProjectColors().background),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
