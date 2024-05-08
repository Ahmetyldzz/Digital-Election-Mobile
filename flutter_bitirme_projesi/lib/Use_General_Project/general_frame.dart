import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class GeneralFrame extends StatefulWidget {
  const GeneralFrame(
      {super.key,
      this.child,
      this.title,
      this.appBar,
      this.bottomNavigationBar});
  final Widget? child;
  final Widget? title;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  @override
  State<GeneralFrame> createState() => _GeneralFrameState();
}

class _GeneralFrameState extends State<GeneralFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.bottomNavigationBar,
      resizeToAvoidBottomInset: false,
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
    );
  }
}

class ContainerSizes {
  final double width = 360;
  final double height = 500;
}
