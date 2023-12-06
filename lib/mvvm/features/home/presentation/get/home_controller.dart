import 'dart:async';

import 'package:asadamatic/mvvm/enums.dart';
import 'package:asadamatic/mvvm/features/home/constants/home_constants.dart';
import 'package:asadamatic/mvvm/features/home/domain/entity/package.dart';
import 'package:asadamatic/mvvm/features/home/domain/entity/skill.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  // App title animation
  AnimationController? titleAnimationController;
  Animation<double>? titleAnimation;

  PageController skillsSliderController =
      PageController(viewportFraction: 1 / 5);

  final RxInt osIndex = 0.obs;
  final RxBool osHover = false.obs;
  final RxInt osHoverIndex = 0.obs;
  final sliderIndex = 0.obs;
  int homePageIndex = 0;
  PageController homePageController = PageController();
  double iconHeight = 30.0;
  double iconIncreasedHeight = 2.5;
  List<Package> packagesData = [];
  List<String> bioWords = [
    'I ',
    'develop ',
    'high ',
    'performance ',
    'apps ',
    'for ',
    'android ',
  ];
  int stackoverflowScore = HomeConstants.oneBySixtyOfScore;
  int githubRepoCount = HomeConstants.oneBySixOfCount;

  bool packagesDataLoaded = false;

  @override
  void onInit() async {
    super.onInit();

    titleAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    titleAnimation =
        Tween(begin: 90.0, end: 0.0).animate(titleAnimationController!);

    titleAnimationController!.forward();

    // Timer for stackvoerflow score
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (stackoverflowScore < HomeConstants.stackoverflowScore) {
        stackoverflowScore =
            stackoverflowScore + HomeConstants.oneBySixtyOfScore;
        if (stackoverflowScore > HomeConstants.stackoverflowScore) {
          stackoverflowScore = HomeConstants.stackoverflowScore;
        }

        update(['updateValueTicker']);
      } else {
        timer.cancel();
      }
    });

    // Timer for github score
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (githubRepoCount < HomeConstants.githubRepoCount) {
        githubRepoCount = githubRepoCount + HomeConstants.oneBySixOfCount;
        if (githubRepoCount > HomeConstants.githubRepoCount) {
          githubRepoCount = HomeConstants.githubRepoCount;
        }
        update(['updateValueTicker']);
      } else {
        timer.cancel();
      }
    });
    // Timer for value ticker update

    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (bioWords[6] == 'android ') {
        bioWords[6] = 'ios ';
      } else if (bioWords[6] == 'ios ') {
        bioWords[6] = 'web ';
      } else if (bioWords[6] == 'web ') {
        bioWords[6] = 'desktop ';
      } else if (bioWords[6] == 'desktop ') {
        bioWords[6] = 'android ';
      }

      update(['updateBio']);
    });

    packagesData = HomeConstants.packagesDescription;
    packagesDataLoaded = true;
    update(['updatePackagesData']);
  }

  changeNumberOfSkillsOnFront(int numberOfSkillsOnFront) {
    skillsSliderController =
        PageController(viewportFraction: 1 / numberOfSkillsOnFront);
  }

  forwardScrollThroughSkills(SkillType skillType, List<Skill> skills, Screen screenType) {
    final pageController = skillsSliderController;
    final pages = screenType == Screen.large ? 5 : screenType == Screen.medium ? 3 : 1;
    if (skills.length - pageController.page! > pages) {
      pageController.nextPage(
          duration: Duration(milliseconds: 600), curve: Curves.easeIn);
    }
  }

  reverseScrollThroughSkills(SkillType skillType) {
    if (skillsSliderController.page != 0) {
      skillsSliderController.previousPage(
          duration: Duration(milliseconds: 600), curve: Curves.easeIn);
    }
  }


  // copyPackageVersion(String package) {
  //   FlutterClipboard.copy(package.replaceFirst(" ", ": ^"));
  // }

  hireMe() async {
    await launch(HomeConstants.linkedInUrl);
  }

  onHomePageChanged(int newIndex) {
    homePageIndex = newIndex;
    update(['updateHomePageView']);
  }

  changeHomePage(int newIndex) {
    homePageIndex = newIndex;
    homePageController.jumpToPage(newIndex);
    update(['updateHomePageView']);
  }

  // TODO: Create a variable for screenType
}
