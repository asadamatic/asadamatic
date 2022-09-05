import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/widgets/skill_widget.dart';
import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key, this.screenHeight}) : super(key: key);

  final double? screenHeight;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: AppConstants.tools
            .asMap()
            .map(
              (index, tool) => MapEntry(
                  index,
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverToolSectionDelegate(
                        minWidth: 0.0,
                        maxWidth: 350.0,
                        child: SkillWidget(
                          skill: AppConstants.tools[index],
                          index: index,
                        ),
                      ))),
            )
            .values
            .toList());
  }
}
