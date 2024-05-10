import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomScrollableGridLayoutWidget extends StatelessWidget {
  const CustomScrollableGridLayoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollable(
        viewportBuilder: (BuildContext context, ViewportOffset position) {
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.amber,
              );
            },
          );
        },
      ),
    );
  }
}