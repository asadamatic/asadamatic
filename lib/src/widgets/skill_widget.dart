import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/models/skill.dart';
import 'package:asadamatic/src/style/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class SkillWidget extends StatelessWidget {
  const SkillWidget({Key? key, this.skill, this.index}) : super(key: key);

  final Skill? skill;
  final int? index;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ThemeController themeController = Get.find<ThemeController>();
    return Container(
        width: 350.0,
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
        decoration: BoxDecoration(
            border: index == AppConstants.tools.length - 1
                ? null
                : Border(
                    right: BorderSide(
                        color: themeController.isThemeDark
                            ? Colors.blueGrey
                            : AppStyles.primaryColor.withOpacity(0.6)))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            FlutterLogo(size: 100.0,),
            SizedBox(
              height: 100.0,
              child: Text(
                skill!.name!,
                style: textTheme.headline3,
              ),
            ),
            Spacer(),
            SizedBox(
              height: 300.0,
              child: Text(
                skill!.description!,
                style: TextStyle(
                    fontSize: textTheme.bodyMedium!.fontSize,
                    letterSpacing: 1.0,
                    height: 1.3),
              ),
            ),
          ],
        ),

    );
  }
}

class SliverToolSectionDelegate extends SliverPersistentHeaderDelegate {
  SliverToolSectionDelegate({
    required this.minWidth,
    required this.maxWidth,
    required this.child,
  });
  final double minWidth;
  final double maxWidth;
  final Widget child;
  @override
  double get minExtent => minWidth;
  @override
  double get maxExtent => math.max(maxWidth, minWidth);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverToolSectionDelegate oldDelegate) {
    return maxWidth != oldDelegate.maxWidth ||
        minWidth != oldDelegate.minWidth ||
        child != oldDelegate.child;
  }
}
