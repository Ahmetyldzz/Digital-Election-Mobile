import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Voting_Page/voting.dart';

class ElectionEnterTypeMenu extends StatefulWidget {
  const ElectionEnterTypeMenu({super.key});

  @override
  State<ElectionEnterTypeMenu> createState() => _ElectionEnterTypeMenuState();
}

class _ElectionEnterTypeMenuState extends State<ElectionEnterTypeMenu>
    with NavigatorRoute {
  
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ProjectColors().background,
        ),
        width: 250,
        height: 180,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      color: Colors.white,
                      height: 50,
                      child: TextField(
                        controller: textEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "ID ile giriş ",
                            border: OutlineInputBorder(),
                            focusColor: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          /* if (textEditingController.text == Election.id) {
                            navigateToWidget(context, Oykullanma());
                          } */
                        },
                        child: CircleAvatar(
                          backgroundColor: ProjectColors().commonTheme,
                          child: Icon(
                            Icons.chevron_right_rounded,
                            color: ProjectColors().background,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
