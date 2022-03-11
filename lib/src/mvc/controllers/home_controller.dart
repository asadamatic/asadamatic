import 'dart:async';

import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/models/package.dart';
import 'package:asadamatic/src/mvc/views/boltgrocery/main.dart';
import 'package:asadamatic/src/mvc/views/dailytodo/main.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/main.dart';
import 'package:asadamatic/src/services/network.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  // App title animation
  AnimationController? titleAnimationController;
  Animation<double>? titleAnimation;

  final RxInt osIndex = 0.obs;
  final RxBool osHover = false.obs;
  final RxInt osHoverIndex = 0.obs;
  final sliderIndex = 0.obs;
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
  int stackoverflowScore = AppConstants.oneBySixtyOfScore;
  int githubRepoCount = AppConstants.oneBySixOfCount;

  bool packagesDataLoaded = false;
  final NetworkService _networkService = NetworkService();

  @override
  void onInit() async {
    super.onInit();
    _networkService.initialize();

    titleAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    titleAnimation =
        Tween(begin: 90.0, end: 0.0).animate(titleAnimationController!);

    titleAnimationController!.forward();

    // Timer for stackvoerflow score
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (stackoverflowScore < AppConstants.stackoverflowScore) {
        stackoverflowScore =
            stackoverflowScore + AppConstants.oneBySixtyOfScore;
        if (stackoverflowScore > AppConstants.stackoverflowScore) {
          stackoverflowScore = AppConstants.stackoverflowScore;
        }

        update(['updateValueTicker']);
      } else {
        timer.cancel();
      }
    });

    // Timer for github score
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (githubRepoCount < AppConstants.githubRepoCount) {
        githubRepoCount = githubRepoCount + AppConstants.oneBySixOfCount;
        if (githubRepoCount > AppConstants.githubRepoCount) {
          githubRepoCount = AppConstants.githubRepoCount;
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
    final result = await _networkService.getPackagesData();
    if (result.statusCode == 200) {
      packagesData = [
        Package.fromJson(result.body[0]),
        Package.fromJson(result.body[1]),
        Package.fromJson(result.body[2])
      ];
    } else {
      packagesData = AppConstants.packagesDescription;
    }
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
      if (newIndex != osIndex.value) {
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

  onOsChanged(newIndex) {
    osIndex.value = newIndex;
    update(['osIndexUpdate']);
  }

  onPageChanged(newIndex) {
    sliderIndex.value = newIndex;
    update(['boltgrocery', 'dailytodo', 'legacyweather', 'sliderIndexUpdate']);
  }

  getSliderApp() {
    return sliderIndex.value == 0
        ? BoltGroceryApp()
        : sliderIndex.value == 1
            ? DailyTodoApp()
            : LegacyWeatherApp();
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

  copyPackageVersion(String package) {
    FlutterClipboard.copy(package.replaceFirst(" ", ": ^"));
  }

  hireMe() async {
    await launch(AppConstants.linkedInUrl);
  }
}
