import 'package:asadamatic/mvvm/core/styles/app_styles.dart';
import 'package:asadamatic/mvvm/features/home/styles/home_styles.dart';
import 'package:flutter/material.dart';
import 'package:asadamatic/mvvm/features/home/domain/entity/skill.dart';
import 'package:flutter_svg/svg.dart';

class SkillBox extends StatelessWidget {
  const SkillBox({Key? key, required this.skill}) : super(key: key);
  final Skill skill;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: HomeStyles.skillBoxPadding,
      margin: HomeStyles.skillBoxMargin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            skill.image,
            fit: BoxFit.contain,
            height: HomeStyles.skillImageHeight,
          ),
          SizedBox(height: 15.0),
          Text(skill.name, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
