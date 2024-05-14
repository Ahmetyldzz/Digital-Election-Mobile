import 'package:flutter/material.dart';

class PaddingSizes {
  final EdgeInsets generalFrame = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 20,
  );

  static const EdgeInsets customElectionCardPadding = EdgeInsets.all(8.0);
  static const EdgeInsets customElectionCardTrailingColumnPadding = EdgeInsets.all(0.0);
  static const EdgeInsets electionBodyPadding = EdgeInsets.all(0.0);

  static const EdgeInsets innerFrame = EdgeInsets.only(
    top: 15,

    bottom: 15,
    right: 30,
    left: 30,
  );
  static const EdgeInsets customTextPadding = EdgeInsets.only(
    top: 10,
    bottom: 10,
    right: 10,
    left: 10,
  );
  static const EdgeInsets buttonTextPadding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 5);
  static const EdgeInsets homePageIcCerceve =
      EdgeInsets.symmetric(horizontal: 25, vertical: 35);
}
