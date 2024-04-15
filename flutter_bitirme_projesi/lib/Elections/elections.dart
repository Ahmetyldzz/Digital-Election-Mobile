import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class Elections extends StatefulWidget {
  const Elections({super.key});

  @override
  State<Elections> createState() => _ElectionsState();
}

class _ElectionsState extends State<Elections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().background,
      appBar: AppBar(
        backgroundColor: ProjectColors().commonTheme,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: ProjectColors().commonTheme,
                    borderRadius: BorderRadius.circular(5)),
                width: 200,
                height: 100,
                child: ListTile(
                  title: Text(
                    "Seçim Adı",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: ProjectColors().background),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: ProjectColors().darkTheme,
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Container(
                      //color: Colors.amber,
                      child: Text(
                    "12-10-2024",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: ProjectColors().background),
                  )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
