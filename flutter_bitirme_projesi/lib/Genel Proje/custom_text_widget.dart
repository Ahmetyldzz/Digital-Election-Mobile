import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/project_colors.dart';
class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.hintText,
    required this.height,
    required this.width,
  });
  final String hintText;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingSizes().customTextPadding,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: ProjectColors().arkaPlan,
            borderRadius: BorderRadius.circular(10)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TextField(
            decoration: InputDecoration(
                hintText: "  ${hintText}",
                hintTextDirection: TextDirection.ltr,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}