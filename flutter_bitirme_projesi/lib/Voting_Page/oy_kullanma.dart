import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Voting_Page/custom_card_model.dart';

class Oykullanma extends StatefulWidget {
  const Oykullanma({super.key});

  @override
  State<Oykullanma> createState() => _OykullanmaState();
}

class _OykullanmaState extends State<Oykullanma> {
  bool isClicked = false;
  int _activeCard = 0;
  Color? renk = ProjectColors().background;
  List<CustomCardModel>? model1;
  onIndexChanged(int index) {
    setState(() {
      _activeCard = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double width2 = 400;

    /*  void isSelected() {
      setState(() {
        isClicked = !isClicked;
      });
    } */

    return Scaffold(
      backgroundColor: ProjectColors().background,
      body: GeneralFrame(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: (_activeCard == index
                                ? ProjectColors().likePink
                                : ProjectColors().background)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: FittedBox(
                                      child: Icon(
                                    Icons.account_circle_rounded,
                                    color: ProjectColors().darkTheme,
                                  ))),
                              Text(
                                "Ahmet Yıldız",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: ProjectColors().darkTheme),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          ProjectColors().darkTheme),
                                  onPressed: () {
                                    onIndexChanged(index);
                                  },
                                  child: Text(
                                    "Oy kullanabilirsiniz",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: ProjectColors().background),
                                  )),
                            ]),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    // color: Colors.red,
                    width: width2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15, left: 15, top: 15, bottom: 15),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ProjectColors().darkTheme,
                              maximumSize: Size(100, 50)),
                          onPressed: () {},
                          child: Text(
                            "Oy Kullanma işlemini tamamla",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: ProjectColors().background,
                                    ),
                          )),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class _CustomColumnCard extends StatelessWidget {
  const _CustomColumnCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Color? color;
    return Column(children: [
      Container(
          color: color,
          width: 40,
          height: 40,
          child: FittedBox(
              child: Icon(
            Icons.account_circle_rounded,
            color: ProjectColors().darkTheme,
          ))),
      Text(
        "Ahmet Yıldız",
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: ProjectColors().darkTheme),
      ),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ProjectColors().darkTheme),
          onPressed: () {
            color = ProjectColors().likePink;
          },
          child: Text(
            "Oy kullanabilirsiniz",
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: ProjectColors().background),
          )),
    ]);
  }
}
