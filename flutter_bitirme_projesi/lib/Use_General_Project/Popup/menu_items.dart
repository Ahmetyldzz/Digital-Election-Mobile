import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({super.key});

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Expanded(
            child: Container(
              height: 50,
              width: 250,
              color: ProjectColors().darkTheme,
              child: Center(
                child: Text(
                  "Çıkış Yap",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: ProjectColors().background),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Expanded(
            child: Container(
              height: 50,
              width: 250,
              color: ProjectColors().darkTheme,
              child: Center(
                child: Text(
                  "Çıkış Yap",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: ProjectColors().background),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
