import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/custom_func.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/project_colors.dart';

class GenelCerceve extends StatefulWidget {
  const GenelCerceve({super.key, this.child, this.title, this.appBar});
  final Widget? child;
  final Widget? title;
  final PreferredSizeWidget? appBar;

  @override
  State<GenelCerceve> createState() => _GenelCerceveState();
}

class _GenelCerceveState extends State<GenelCerceve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().arkaPlan,
      appBar: widget.appBar,
      body: Padding(
        padding: PaddingSizes().genelCerceve,
        child: Center(
          child: Container(
            width: ContainerSizes().width,
            height: ContainerSizes().height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ProjectColors().genelTema,
            ),
            child: widget.child,
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class ContainerSizes {
  final double width = 400;
  final double height = 500;
}
