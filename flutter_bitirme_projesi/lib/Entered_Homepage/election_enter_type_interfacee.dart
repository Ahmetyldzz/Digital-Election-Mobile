import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class ElectionType extends StatefulWidget {
  const ElectionType({super.key});

  @override
  State<ElectionType> createState() => _ElectionTypeState();
}

class _ElectionTypeState extends State<ElectionType> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: ProjectColors().background,
            borderRadius: BorderRadius.circular(12)),
        width: 250,
        height: 180,
        child: Text(""),
      ),
    );
  }
}
