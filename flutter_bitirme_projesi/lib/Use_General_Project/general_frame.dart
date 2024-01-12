import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/custom_func.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class GeneralFrame extends StatefulWidget {
  const GeneralFrame({super.key, this.child, this.title, this.appBar});
  final Widget? child;
  final Widget? title;
  final PreferredSizeWidget? appBar;

  @override
  State<GeneralFrame> createState() => _GeneralFrameState();
}

class _GeneralFrameState extends State<GeneralFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().background,
      appBar: widget.appBar,
      body: Padding(
        padding: PaddingSizes().generalFrame,
        child: Center(
          child: Container(
            width: ContainerSizes().width,
            height: ContainerSizes().height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ProjectColors().commonTheme,
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
