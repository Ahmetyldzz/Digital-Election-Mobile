import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/navigateToPage.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class NavigateToOtherAuth extends StatelessWidget with NavigatorRoute {
  const NavigateToOtherAuth({
    super.key,
    required this.title,
    required this.navigateText,
    required this.widget,
  });
  final String title;
  final String navigateText;
  final Widget widget;

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
              ?.copyWith(color: ProjectColors().background, fontSize: 18),
        ),
        InkWell(
          onTap: () {
            navigateToWidget(context, widget);
          },
          child: Text(
            navigateText,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: ProjectColors().likePink,
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
