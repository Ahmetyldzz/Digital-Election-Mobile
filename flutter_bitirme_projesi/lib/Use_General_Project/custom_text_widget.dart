import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/padding_sizes.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.hintText,
    required this.height,
    required this.width,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
  });
  final String hintText;
  final double height;
  final double width;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingSizes().customTextPadding,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: ProjectColors().background,
            borderRadius: BorderRadius.circular(10)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TextField(
            textInputAction: textInputAction,
            keyboardType: textInputType,
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

class CustomTextWidgetTcNo extends StatelessWidget {
  const CustomTextWidgetTcNo({
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
            color: ProjectColors().background,
            borderRadius: BorderRadius.circular(10)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
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
