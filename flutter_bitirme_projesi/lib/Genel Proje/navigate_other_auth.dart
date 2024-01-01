import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Genel%20Proje/project_colors.dart';

class NavigateToOtherAuth extends StatelessWidget {
  const NavigateToOtherAuth({
    super.key, required this.title, required this.navigateText,
  });
  final String title;
  final String navigateText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: ProjectColors().arkaPlan, fontSize: 18),
        ),
        Text(
          navigateText,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: ProjectColors().yavruAgzi,
              fontSize: 21,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
