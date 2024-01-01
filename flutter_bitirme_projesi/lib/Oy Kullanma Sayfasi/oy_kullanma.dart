import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/project_colors.dart';

class Oykullanma extends StatefulWidget {
  const Oykullanma({super.key});

  @override
  State<Oykullanma> createState() => _OykullanmaState();
}

class _OykullanmaState extends State<Oykullanma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().arkaPlan,
      
    );
  }
}