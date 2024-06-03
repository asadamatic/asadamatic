import 'dart:io';

import 'package:asadamatic/src/mvc/models/package.dart';
import 'package:asadamatic/src/mvc/models/tool.dart';
import 'package:asadamatic/src/mvc/models/value_type.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/foundation.dart';

enum Platforms {
  android(Icons.phone_android_outlined),
  ios(Icons.phone_iphone_outlined),
  web(Icons.web_asset_outlined),
  desktop(Icons.desktop_windows_outlined);

  const Platforms(this.icon);
  final IconData icon;
  String get displayName => name.capitalizeFirst;
}

const String bio = "I develop high performance apps for";

String stackOverReputationText = "Stackoverflow Reputation";
String githubRepositoriesText = "Github Repositories";
String commercialProjectsText = "Commercial Projects";

const String playStoreBadge = "assets/stores/play-store.svg";
const String appStoreBadge = "assets/stores/app-store.svg";

const int stackoverflowScore = 2761;
int get oneBySixtyOfScore => (stackoverflowScore / 60).round();

const int githubRepoCount = 78;
int get oneBySixOfCount => (stackoverflowScore / 600).round();

const int commercialProjectsCount = 6;

List<Score> scores = [
  Score(
      title: stackOverReputationText,
      score: stackoverflowScore,
      profileUrl: stackOverflowUrl),
  Score(
      title: githubRepositoriesText,
      score: githubRepoCount,
      profileUrl: githubUrl),
  Score(title: commercialProjectsText, score: commercialProjectsCount),
];
const String githubUrl = 'https://github.com/asadamatic';
const String stackOverflowUrl =
    'https://stackoverflow.com/users/10285344/asad-hameed';

const List<Tool> tools = [
  Tool(name: 'Flutter', logoPath: 'assets/tools/flutter.svg', slug: 'flutter'),
  Tool(name: 'Dart', logoPath: 'assets/tools/dart.svg', slug: 'dart'),
  // Tool(name: 'FastAPI', logoPath: 'assets/logos/fastapi.svg', slug: 'fastapi'),
  Tool(name: 'Python', logoPath: 'assets/tools/python.svg', slug: 'python'),
  Tool(name: 'Git', logoPath: 'assets/tools/git.svg', slug: 'git'),
  Tool(
      name: 'Github',
      logoPath: 'assets/tools/github-black.svg',
      darkModeLogoPath: 'assets/tools/github-white.svg',
      slug: 'github'),
  Tool(name: 'GraphQL', logoPath: 'assets/tools/graphql.svg', slug: 'graphql'),
  Tool(
      name: 'Firebase',
      logoPath: 'assets/tools/firebase.svg',
      slug: 'firebase'),
  Tool(
      name: 'Jira',
      logoPath: 'assets/tools/jira.svg',
      darkModeLogoPath: 'assets/tools/jira.svg',
      slug: 'jira'),
  Tool(
      name: 'BitBucket',
      logoPath: 'assets/tools/bitbucket.svg',
      darkModeLogoPath: 'assets/tools/bitbucket.svg',
      slug: 'bitbucket'),
  Tool(
      name: 'Bash',
      logoPath: 'assets/tools/bash-white.svg',
      darkModeLogoPath: 'assets/tools/bash-black.svg',
      slug: 'bash'),
  // Tool(
  //     name: 'Android Studio',
  //     logoPath: 'assets/logos/android_studio.png',
  //     slug: 'android-studio'),
  Tool(name: 'VS Code', logoPath: 'assets/logos/vscode.png', slug: 'vscode'),
  // Tool(
  //     name: 'Selenium',
  //     logoPath: 'assets/logos/selenium.png',
  //     slug: 'selenium'),
];

class AppConstants {
  static const String appTitle = 'Asad Hameed - Flutter Developer';

  static RegExp get emailRegExp => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // Scores

  static const List<Package> packagesDescription = [
    Package(
        name: 'firestore_search',
        description:
            'This package helps developers in implementation of search on Cloud FireStore. This package comes with the implementation of widgets essential  for  performing search on a database.',
        pubPoints: '120',
        popularity: '88',
        likes: '47'),
    Package(
        name: 'file_case',
        description:
            'A flutter widget to showcase and process uploaded files on Web, Android, Ios, MacOs, Linux & Windows.',
        pubPoints: '130',
        popularity: '63',
        likes: '4'),
    Package(
        name: 'dialogs',
        description:
            'This flutter package provides aesthetically designed dialog box with customization options.',
        pubPoints: '110',
        popularity: '80',
        likes: '12'),
  ];

  static DeviceInfoPlugin get deviceInfo => DeviceInfoPlugin();
  static Future<String?>? getDeviceName() async {
    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model; // e.g. "Moto G (4)"
    } else if (GetPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    } // e.g. "iPod7,1"
    else if (GetPlatform.isWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return webBrowserInfo.platform;
    }
    return 'Device not recognized';
  }

  static const appleType = "apple";
  static const androidType = "android";
  static const desktopType = "desktop";

  static final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  // String getSmartPhoneOrTablet() {
  //   final userAgent = html.window.navigator.userAgent.toString().toLowerCase();
  //   // smartphone
  //   if( userAgent.contains("iphone"))  return appleType;
  //   if( userAgent.contains("android"))  return androidType;
  //
  //   // tablet
  //   if( userAgent.contains("ipad")) return appleType;
  //   if( html.window.navigator.platform.toLowerCase().contains("macintel") && html.window.navigator.maxTouchPoints > 0 ) return appleType;
  //
  //   return desktopType;
  // }
}

const String fmsLogo = 'assets/apps/fms/logo.png';
const String fmsScreenshotSplash = 'assets/apps/fms/screenshots/splash.png';
const String fmsScreenshotCheckinout =
    'assets/apps/fms/screenshots/checkinout.png';
const String fmsScreenshotHome = 'assets/apps/fms/screenshots/home.png';
const String fmsScreenshotNotifications =
    'assets/apps/fms/screenshots/notifications.png';
const String fmsScreenshotProduct = 'assets/apps/fms/screenshots/product.png';
const String fmsScreenshotSchedule = 'assets/apps/fms/screenshots/schedule.png';
const String fmsScreenshotTasks = 'assets/apps/fms/screenshots/tasks.png';
const String fmsScreenshotWorkOrder =
    'assets/apps/fms/screenshots/work_order.png';
const String fmsScreenshotTaskDetail =
    'assets/apps/fms/screenshots/task_detail.png';

const List<String> fmsScreenshots = [
  fmsScreenshotSplash,
  fmsScreenshotHome,
  fmsScreenshotTasks,
  fmsScreenshotSchedule,
  fmsScreenshotTaskDetail,
  fmsScreenshotProduct,
  fmsScreenshotWorkOrder,
  fmsScreenshotCheckinout,
  fmsScreenshotNotifications,
];
const String inventoryInternalTransfers =
    'assets/apps/inventory/screenshots/internal_transfers.png';
const String inventoryFilters = 'assets/apps/inventory/screenshots/filters.png';
const String inventoryPurchaseOrders =
    'assets/apps/inventory/screenshots/purchase_orders.png';
const String inventoryPurchaseOrder =
    'assets/apps/inventory/screenshots/purchase_order.png';
const String inventoryHome = 'assets/apps/inventory/screenshots/home.png';
const String inventoryScanner = 'assets/apps/inventory/screenshots/scanner.png';
const String inventorySplash = 'assets/apps/inventory/screenshots/splash.png';

const List<String> inventoryScreenshots = [
  inventorySplash,
  inventoryHome,
  inventoryInternalTransfers,
  inventoryFilters,
  inventoryPurchaseOrders,
  inventoryPurchaseOrder,
  inventoryScanner,
];

const String disAirconAppointments =
    'assets/apps/dis-aircon/screenshots/appointments.png';
const String disAirconHome = 'assets/apps/dis-aircon/screenshots/home.png';
const String disAirconOrder = 'assets/apps/dis-aircon/screenshots/order.png';
const String disAirconProducts =
    'assets/apps/dis-aircon/screenshots/products.png';
const String disAirconServicingContracts =
    'assets/apps/dis-aircon/screenshots/servicing_contracts.png';
const String disAirconSplash = 'assets/apps/dis-aircon/screenshots/splash.png';

const List<String> disAirconScreenshots = [
  disAirconSplash,
  disAirconHome,
  disAirconProducts,
  disAirconServicingContracts,
  disAirconAppointments,
  disAirconOrder,
];

const String crmSplash = 'assets/apps/crm/screenshots/splash.png';
const String crmAddCall = 'assets/apps/crm/screenshots/add_call.png';
const String crmAddMeeting = 'assets/apps/crm/screenshots/add_meeting.png';
const String crmAudioNote = 'assets/apps/crm/screenshots/audio_note.png';
const String crmCallScreen = 'assets/apps/crm/screenshots/call_screen.png';
const String crmDialpad = 'assets/apps/crm/screenshots/dialpad.png';
const String crmHome = 'assets/apps/crm/screenshots/home.png';
const String crmLeadProfile = 'assets/apps/crm/screenshots/lead_profile.png';
const String crmLeads = 'assets/apps/crm/screenshots/leads.png';

const List<String> crmScreenshots = [
  crmSplash,
  crmHome,
  crmLeads,
  crmLeadProfile,
  crmAudioNote,
  crmDialpad,
  crmCallScreen,
  crmAddCall,
  crmAddMeeting,
];

const String tryModestProduct =
    'assets/apps/try_modest/screenshots/product.png';
const String tryModestProducts =
    'assets/apps/try_modest/screenshots/products.png';
const String tryModestHome = 'assets/apps/try_modest/screenshots/home.png';
const String tryModestCollections =
    'assets/apps/try_modest/screenshots/collections.png';
const String tryModestSplash = 'assets/apps/try_modest/screenshots/splash.png';

const String tryModestAddresses =
    'assets/apps/try_modest/screenshots/addresses.png';
const String tryModestProfile =
    'assets/apps/try_modest/screenshots/profile.png';

const List<String> tryModestScreenshots = [
  tryModestSplash,
  tryModestHome,
  tryModestCollections,
  tryModestProducts,
  tryModestProduct,
  tryModestProfile,
  tryModestAddresses
];
