import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Constants/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class GeneralFrame extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    print(width);
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: true,
      backgroundColor: ProjectColors().background,
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.05),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: /* ContainerSizes().width */
                  width,
              height: /* ContainerSizes().height */
                  height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ProjectColors().commonTheme,
              ),
              child: child,
            ),
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
