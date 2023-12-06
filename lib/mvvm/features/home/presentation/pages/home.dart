
import 'package:asadamatic/mvvm/features/home/constants/home_constants.dart';
import 'package:asadamatic/mvvm/features/home/presentation/get/home_controller.dart';
import 'package:asadamatic/mvvm/enums.dart';
import 'package:asadamatic/mvvm/features/home/presentation/pages/skill_section.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/chat_room_container.dart';
import 'package:asadamatic/mvvm/features/home/presentation/pages/contribution_section.dart';
import 'package:asadamatic/mvvm/features/home/presentation/pages/packages_section.dart';
import 'package:asadamatic/mvvm/core/styles/app_styles.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/asad_hameed.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/bio_contianer.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/custom_button.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/home_page_indicator.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/my_description.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/score.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/social_icons_bar.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/theme_switch.dart';
import 'package:asadamatic/mvvm/features/home/styles/home_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final HomeController _homeController = Get.find<HomeController>();
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Material(
            elevation: 8.0,
            child: LayoutBuilder(builder: (BuildContext layoutBuilderContext,
                BoxConstraints constraints) {
              if (constraints.maxWidth < AppStyles.breakPointSmallMedium) {

                _homeController.changeNumberOfSkillsOnFront(HomeStyles.numberOfSkillsOnFrontSmall);
                return ListView(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 330.0,
                          height: 320.0,
                          child: AsadHameed(
                            screen: Screen.small,
                            textTheme: textTheme,
                          ),
                        ),
                        const SizedBox(
                          height: AppStyles.containerContentSpacing,
                        ),
                        MyDescription(
                            screen: Screen.small,
                            homeController: _homeController,
                            textTheme: textTheme,
                            theme: theme),
                        const SizedBox(
                          height: AppStyles.containerContentSpacing,
                        ),
                        Score(
                          textTheme: textTheme,
                          screen: Screen.small,
                        ),
                        const SizedBox(
                          height: AppStyles.containerSpacing,
                        ),
                        CustomButton(onPressed: (){}),
                        SkillSection(screenType: Screen.small,),
                        const SizedBox(
                          height: AppStyles.containerContentSpacing,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppStyles.containerSpacing,
                    ),
                    // const PackagesSection(),
                  ],
                );
              } else if (constraints.maxWidth >=
                      AppStyles.breakPointSmallMedium &&
                  constraints.maxWidth <= AppStyles.breakPointMediumLarge) {
                _homeController.changeNumberOfSkillsOnFront(HomeStyles.numberOfSkillsOnFrontMedium);

                final smallerWidthBio = (constraints.maxWidth - 1010) / 2;
                final largerWidthBio = smallerWidthBio;

                // Large screens
                final smallerWidthApps = (constraints.maxWidth - 1010) / 4;
                final largerWidthApps =
                    constraints.maxWidth - 1010 - smallerWidthApps;

                final positiveConstraintsBio = constraints.maxWidth >= 1010;
                final positiveConstraintsApps = constraints.maxWidth >= 1010;

                final screenHeight = constraints.maxHeight;

                return PageView(
                  controller: _homeController.homePageController,
                  onPageChanged: _homeController.onHomePageChanged,
                  scrollDirection: Axis.vertical,
                  children: [

                    BioContainer(
                      screenHeight: screenHeight,
                      positiveConstraintsBio: positiveConstraintsBio,
                      largerWidthBio: largerWidthBio,
                      homeController: _homeController,
                      textTheme: textTheme,
                      theme: theme,
                      smallerWidthBio: smallerWidthBio,
                      screen: Screen.medium,
                    ),
                    SkillSection(screenType: Screen.medium,),

                    SizedBox(
                      height: screenHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Flexible(child: PackagesSection()),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                // final smallerWidthBio = (constraints.maxWidth - 1310) / 4;
                // final largerWidthBio =
                //     constraints.maxWidth - 1310 - smallerWidthBio;
                _homeController.changeNumberOfSkillsOnFront(HomeStyles.numberOfSkillsOnFrontLarge);

                final smallerWidthBio = (constraints.maxWidth - 1250) / 2;
                final largerWidthBio = smallerWidthBio;

                // Large screens
                final smallerWidthApps = (constraints.maxWidth - 1260) / 4;
                final largerWidthApps =
                    constraints.maxWidth - 1260 - smallerWidthApps;

                final positiveConstraintsBio = constraints.maxWidth >= 1250;
                final positiveConstraintsApps = constraints.maxWidth >= 1260;

                final screenHeight = constraints.maxHeight;
                return PageView(
                  controller: _homeController.homePageController,
                  onPageChanged: _homeController.onHomePageChanged,
                  scrollDirection: Axis.vertical,
                  children: [


                    BioContainer(
                      screenHeight: screenHeight,
                      positiveConstraintsBio: positiveConstraintsBio,
                      largerWidthBio: largerWidthBio,
                      homeController: _homeController,
                      textTheme: textTheme,
                      theme: theme,
                      smallerWidthBio: smallerWidthBio,
                      screen: Screen.large,
                    ),

                    SkillSection(screenType: Screen.large,),

                    ContributionsSection(screenHeight: screenHeight),
                  ],
                );
              }
            }),
          ),
          Align(alignment: Alignment.centerLeft, child: SocialIconsBar()),
          LayoutBuilder(
              builder: (context, constraints) =>
                  constraints.maxWidth > AppStyles.breakPointSmallMedium
                      ? const Align(
                          alignment: Alignment.centerRight,
                          child: HomePageIndicator())
                      : const SizedBox()),
          LayoutBuilder(
              builder: (context, constraints) => Align(
                  alignment:
                      constraints.maxWidth > AppStyles.breakPointSmallMedium
                          ? Alignment.topRight
                          : Alignment.topCenter,
                  child: const ThemeSwitch())),
        ],
      ),
      floatingActionButton: const ChatRoomContainer(),
    );
  }
}
