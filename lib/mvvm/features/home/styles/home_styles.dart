

import 'package:flutter/material.dart';

class HomeStyles {
  static const double skillSectionHeight = 170.0;

  static const double skillSectionWidthLarge = 850.0;
  static const double skillSectionWidthMedium = 510.0;
  static const double skillSectionWidthSmall = 170.0;

  static const int numberOfSkillsOnFrontLarge = 5;
  static const int numberOfSkillsOnFrontMedium = 3;
  static const int numberOfSkillsOnFrontSmall = 1;

  static const EdgeInsets skillSectionMargin =
  EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0);
  static const EdgeInsets skillSectionPadding =
  EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0);

  static const double skillImageHeight = 100.0;

  static const EdgeInsets skillBoxPadding =
  EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0);
  static const EdgeInsets skillBoxMargin =
  EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0);

  static ShapeBorder skillSectionShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(14.0)
  );
  static BoxDecoration skillSectionDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(14.0),
  );
}