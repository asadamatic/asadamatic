import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return GetBuilder<ThemeController>(builder: (_themeController) {
      return Container(
        decoration: BoxDecoration(borderRadius: borderRadius),
        child: Card(
          color: colorScheme.onInverseSurface,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: ThemeMode.values
                .map((mode) => ThemeModeButton(
                    isSelected: _themeController.themeMode == mode,
                    mode: mode,
                    toggleTheme: _themeController.toggleTheme))
                .toList(),
          ),
        ),
      );
    });
  }
}

class ThemeModeButton extends StatelessWidget {
  const ThemeModeButton(
      {super.key,
      required this.isSelected,
      required this.mode,
      required this.toggleTheme});

  final bool isSelected;
  final ThemeMode mode;
  final Function(ThemeMode) toggleTheme;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: isSelected ? 10.0 : 0.0,
      color: isSelected ? colorScheme.surface : colorScheme.onInverseSurface,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () => toggleTheme(mode),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: largeSpacing, vertical: mediumSpacing),
          child: Text(mode.name),
        ),
      ),
    );
  }
}
