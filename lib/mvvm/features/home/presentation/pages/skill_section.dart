import 'package:asadamatic/mvvm/enums.dart';
import 'package:asadamatic/mvvm/features/home/constants/home_constants.dart';
import 'package:asadamatic/mvvm/features/home/domain/entity/skill.dart';
import 'package:asadamatic/mvvm/features/home/presentation/get/home_controller.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/skill_box.dart';
import 'package:asadamatic/mvvm/features/home/styles/home_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/score.dart';
class SkillSection extends StatelessWidget {
  const SkillSection({Key? key, required this.screenType}) : super(key: key);
  final Screen screenType;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Score(textTheme: textTheme, screen: screenType),
        SkillSlider(
          screenType: screenType,
          skills: HomeConstants.programmingLanguages,
          skillType: SkillType.programmingLanguages,
        ),
      ],
    );
  }
}

class SkillSlider extends StatelessWidget {
  const SkillSlider(
      {Key? key,
      required this.screenType,
      required this.skills,
      required this.skillType})
      : super(key: key);

  final Screen screenType;
  final List<Skill> skills;
  final SkillType skillType;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = screenType == Screen.large
        ? HomeStyles.skillSectionWidthLarge
        : screenType == Screen.medium
            ? HomeStyles.skillSectionWidthMedium
            : HomeStyles.skillSectionWidthSmall;
    final _homeController = Get.find<HomeController>();

    return Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        height: 25.0,
      ),
      Text(
        skillType == SkillType.programmingLanguages
            ? HomeConstants.programmingLanguagesTitle
            : HomeConstants.toolsTitle,
        style: textTheme.headline4,
      ),
      SizedBox(
        height: 25.0,
      ),
      Flexible(
        child: Stack(
          children: [
            Card(
              elevation: 4.0,
              shape: HomeStyles.skillSectionShape,
              child: Container(
                height: HomeStyles.skillSectionHeight,
                width: width,
                margin: HomeStyles.skillSectionMargin,
                // padding: HomeStyles.skillSectionPadding,
                decoration: HomeStyles.skillSectionDecoration,
                child: PageView.builder(
                  pageSnapping: false,
                  padEnds: false,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _homeController.skillsSliderController,
                  itemCount: skills.length,
                  dragStartBehavior: DragStartBehavior.down,
                  itemBuilder: (context, index) {
                    return SkillBox(skill: skills[index]);
                  },
                ),
              ),
            ),
            Positioned(
                right: 5.0,
                top: 0.0,
                bottom: 0.0,
                child: IconButton(
                    onPressed: () {
                      _homeController.forwardScrollThroughSkills(skillType, skills, screenType);
                    },
                    iconSize: 30.0,
                    icon: Icon(Icons.arrow_circle_right_outlined))),
            Positioned(
                left: 5.0,
                top: 0.0,
                bottom: 0.0,
                child: IconButton(
                    onPressed: () {
                      _homeController.reverseScrollThroughSkills(skillType);
                    },
                    iconSize: 30.0,
                    icon: Icon(Icons.arrow_circle_left_outlined))),
          ],
        ),
      ),
    ]);
  }
}
