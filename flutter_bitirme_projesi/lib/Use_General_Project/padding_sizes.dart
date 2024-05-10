import 'package:flutter/material.dart';

class PaddingSizes {
  final EdgeInsets generalFrame = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 20,
  );

  final EdgeInsets innerFrame = EdgeInsets.only(
    top: 15,
    bottom: 15,
    right: 30,
    left: 30,
  );
  final EdgeInsets customTextPadding = EdgeInsets.only(
    top: 10,
    bottom: 10,
    right: 10,
    left: 10,
  );
  final EdgeInsets buttonTextPadding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 5);
  final EdgeInsets homePageIcCerceve =
      EdgeInsets.symmetric(horizontal: 25, vertical: 35);
}
