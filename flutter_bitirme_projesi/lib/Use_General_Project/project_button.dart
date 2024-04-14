import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/padding_sizes.dart';
class ProjectButtonStyle extends StatelessWidget {
  const ProjectButtonStyle({
    super.key,
    required this.title,
    required this.fontSize,
    required this.textColor,
    required this.buttonColor, required this.onPressed,
  });
  final String title;
  final double fontSize;
  final Color textColor;
  final Color buttonColor;
  final void Function() onPressed;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Padding(
          padding: PaddingSizes().buttonTextPadding,
          child: Text(
            "${title}",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: textColor,
                  fontSize: fontSize,
                ),
          ),
        ));
  }
}