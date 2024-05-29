import 'dart:async';

import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/enums.dart';
import 'package:asadamatic/src/mvc/models/app_data.dart';
import 'package:asadamatic/src/mvc/models/package.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  // App title animation
  AnimationController? titleAnimationController;
  Animation<double>? titleAnimation;

  final Rx<Os> selectedOs = Os.ios.obs;
  final RxBool osHover = false.obs;
  final RxInt osHoverIndex = 0.obs;
  final Rx<App> selectedApp = apps.first.obs;
  int homePageIndex = 0;
  PageController appsPageController = PageController(initialPage: 0);
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
  int stackoverflowScore = oneBySixtyOfScore;
  int githubRepoCount = oneBySixOfCount;

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
      if (stackoverflowScore < stackoverflowScore) {
        stackoverflowScore = stackoverflowScore + oneBySixtyOfScore;
        if (stackoverflowScore > stackoverflowScore) {
          stackoverflowScore = stackoverflowScore;
        }

        update(['updateValueTicker']);
      } else {
        timer.cancel();
      }
    });

    // Timer for github score
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (githubRepoCount < githubRepoCount) {
        githubRepoCount = githubRepoCount + oneBySixOfCount;
        if (githubRepoCount > githubRepoCount) {
          githubRepoCount = githubRepoCount;
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

    packagesData = AppConstants.packagesDescription;

    packagesDataLoaded = true;
    update(['updatePackagesData']);
  }

  showDrawer() {
    update(['drawerUpdate']);
  }

  hideDrawer() {
    update(['drawerUpdate']);
  }

  osOnHover(bool value, int newIndex) {
    if (value) {
      if (newIndex != selectedOs.value) {
        osHover.value = true;
        osHoverIndex.value = newIndex;
      } else {
        osHover.value = false;
      }
    } else {
      osHover.value = false;
    }

    update(['osHoverUpdate', 'osIndexUpdate']);
  }

  onOsChanged(Os os) {
    selectedOs.value = os;
    update(['osIndexUpdate']);
  }

  onChangedApp(index) {
    selectedApp.value = apps.elementAt(index);
    update(['apps', 'sliderIndexUpdate']);
  }

  onHover(package) {
    iconHeight = 30.0;
    iconIncreasedHeight = 2.5;
    update([package]);
  }

  onHoverRemoved(package) {
    iconHeight = 25.0;
    iconIncreasedHeight = 0.0;
    update([package]);
  }

  // copyPackageVersion(String package) {
  //   FlutterClipboard.copy(package.replaceFirst(" ", ": ^"));
  // }

  onHomePageChanged(int newIndex) {
    homePageIndex = newIndex;
    update(['updateHomePageView']);
  }

  moveAppsForwards() => appsPageController.nextPage(
      duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
  moveAppsBackwards() => appsPageController.previousPage(
      duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
}
