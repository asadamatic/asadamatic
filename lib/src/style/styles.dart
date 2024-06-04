import 'package:asadamatic/src/style/colors.dart';
import 'package:flutter/material.dart';

final buttonStyleWithoutRadius = ButtonStyle(
    shape:
        WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(0.0),
)));

const double elevatedButtonVerticalPadding = 20.0;
const double elevatedButtonHorizontalPadding = 25.0;

final ElevatedButtonThemeData elevatedButtonThemeLight =
    ElevatedButtonThemeData(
  style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(flexSchemeLight.primary),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return flexSchemeLight.onPrimary.withOpacity(0.4);
          }
          return flexSchemeLight.onPrimary; // Use the component's default.
        },
      ),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(
          vertical: elevatedButtonVerticalPadding,
          horizontal: elevatedButtonHorizontalPadding))),
);
final ElevatedButtonThemeData elevatedButtonThemeDark = ElevatedButtonThemeData(
  style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(flexSchemeDark.primary),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return flexSchemeDark.onPrimary.withOpacity(0.4);
          }
          return flexSchemeDark.onPrimary; // Use the component's default.
        },
      ),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(
          vertical: elevatedButtonVerticalPadding,
          horizontal: elevatedButtonHorizontalPadding))),
);

const radiusValue = 12.0;
final borderRadius = BorderRadius.circular(radiusValue);

const lessRoundedBorderRadiusValue = 6.0;

const moreRoundedBorderRadiusValue = 18.0;

const zero = 0.0;
final lessRoundedBorderRadius =
    BorderRadius.circular(lessRoundedBorderRadiusValue);
final moreRoundedBorderRadius =
    BorderRadius.circular(moreRoundedBorderRadiusValue);

const minSpacing = 4.0;
const smallSpacing = 8.0;
const mediumSpacing = 12.0;
const largeSpacing = 16.0;
const veryLargeSpacing = 20.0;
const hugeSpacing = 25.0;
const massiveSpacing = 30.0;
const giantSpacing = 50.0;
const iconButtonSpacing = 48.0;
const smallerIconButtonSpacing = 36.0;

const smallImageHeight = 150.0;
const smallImageWidth = 150.0;

const minElevation = 2.0;
const smallElevation = 4.0;
const buttonElevation = 10.0;

const widgetWidth = 330.0;
const maxWidgetWidth = 410.0;
