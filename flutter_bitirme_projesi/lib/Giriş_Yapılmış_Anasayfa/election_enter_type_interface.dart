import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Genel_Proje/project_colors.dart';

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
    return Scaffold(
      backgroundColor: ProjectColors().genelTema,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ProjectColors().arkaPlan,
          ),
          width: 350,
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Seçim Erişim Arayüzü",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 175,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (_ActiveButton == false)
                                ? ProjectColors().genelTema
                                : ProjectColors().yavruAgzi,
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
                              ?.copyWith(color: ProjectColors().arkaPlan),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 175,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (_ActiveButton == true)
                                ? ProjectColors().genelTema
                                : ProjectColors().yavruAgzi,
                            shape:
                                RoundedRectangleBorder(side: BorderSide.none)),
                        onPressed: () {
                          _ActiveButton == true ? buttonChanged() : null;
                        },
                        child: Text(
                          "ID ile giriş",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: ProjectColors().arkaPlan),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), focusColor: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ProjectColors().genelTema,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text(
                          "Seçime Bağlanın",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: ProjectColors().arkaPlan),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
