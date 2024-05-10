import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/widgets/custom_gridlayout_widget.dart';

class GeneralyFrame extends StatelessWidget {
  const GeneralyFrame({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
          decoration: BoxDecoration(
              color: ProjectColors().commonTheme,
              borderRadius: BorderRadius.circular(12)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: child,),
    );
  }
}
