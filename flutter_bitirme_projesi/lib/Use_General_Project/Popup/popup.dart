import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/Popup/menu_items.dart';
import 'package:popover/popover.dart';

class Popup extends StatefulWidget {
  const Popup({super.key});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        bodyBuilder: (context) {
          return MenuItems();
        },
        width: 175,
        height: 100,
      ),
      child: Icon(Icons.more_vert_rounded),
    );
  }
}
