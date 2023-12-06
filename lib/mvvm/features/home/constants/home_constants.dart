import 'package:asadamatic/mvvm/core/constants/assets.dart';
import 'package:asadamatic/mvvm/enums.dart';
import 'package:asadamatic/mvvm/features/home/domain/entity/package.dart';
import 'package:asadamatic/mvvm/features/home/domain/entity/skill.dart';

class HomeConstants {
  static const String programmingLanguagesTitle =
      "Programming Languages & Frameworks";
  static const String toolsTitle = "Tools";

  static const List<List<dynamic>> scores = [
    ["Stackoverflow Reputation", ValueType.stackoverflow],
    ["Github Repositories", ValueType.github],
    ["Commercial Projects", ValueType.commercialProjects]
  ];

  static const List<List<String>> socialIcons = [
    [AppAssets.githubIcon, 'https://github.com/asadamatic'],
    [
      AppAssets.stackoverflowIcon,
      'https://stackoverflow.com/users/10285344/asad-hameed'
    ],
    [AppAssets.linkedinIcon, 'https://www.linkedin.com/in/asadamatic']
  ];

  static const int stackoverflowScore = 1363;
  static int get oneBySixtyOfScore => (stackoverflowScore / 60).round();

  static const int githubRepoCount = 56;
  static int get oneBySixOfCount => (stackoverflowScore / 600).round();

  static const int commercialProjects = 2;

  static const String linkedInUrl =
      'https://stackoverflow.com/users/10285344/asad-hameed';

  static const List<String> packages = [
    'firestore_search',
    'file_case',
    'dialogs'
  ];

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
  static final List<Skill> programmingLanguages = [
    Skill(
      name: 'Flutter',
      description:
          'Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.',
      image: AppAssets.flutter,
      skillLevel: 'Intermediate',
    ),

    Skill(
        name: 'Python',
        description:
            'Python is a programming language that lets you work more quickly and integrate your systems more effectively.',
        image: AppAssets.python,
        skillLevel: 'Intermediate'),
    Skill(
        name: 'Firebase',
        description:
        'Firebase is an app development platform that helps you build and grow apps and games users love. Backed by Google and trusted by millions of businesses around the world.',
        image: AppAssets.firebase,
        skillLevel: 'Intermediate'),
    Skill(
        name: 'FastAPI',
        description:
        'FastAPI is a modern, fast (high-performance), web framework for building APIs with Python 3.6+ based on standard Python type hints.',
        image: AppAssets.fastApi,
        skillLevel: 'Intermediate'),
    Skill(
        name: 'Java',
        description:
            'Java is a widely used object-oriented programming language and software platform that runs on billions of devices, including notebook computers, mobile devices, gaming consoles, medical devices and many others..',
        image: AppAssets.java,
        skillLevel: 'Intermediate'),
    Skill(
        name: 'SQLite',
        description:
        'SQLite is a database engine written in the C language. It is not a standalone app; rather, it is a library that software developers embed in their apps.',
        image: AppAssets.sqlLite,
        skillLevel: 'Intermediate'),
    Skill(
        name: 'MySQL',
        description:
        'MySQL is an open-source relational database management system',
        image: AppAssets.mySql,
        skillLevel: 'Intermediate'),
    // Skill(
    //     name: 'JavaFx',
    //     description:
    //         'JavaFX is a software platform for creating and delivering desktop applications, as well as rich web applications that can run across a wide variety of devices.',
    //     image: AppAssets.flutter,
    //     skillLevel: 'Intermediate'),
    Skill(
        name: 'C++',
        description:
            'C++ is a cross-platform language that can be used to create high-performance applications. C++ gives programmers a high level of control over system resources and memory.',
        image: AppAssets.cPluPlus,
        skillLevel: 'Intermediate'),

    Skill(
        name: 'Android Studio',
        description:
            'Android Studio provides the fastest tools for building apps on every type of Android device.',
        image: AppAssets.androidStudio,
        skillLevel: 'Intermediate'),
    Skill(
        name: 'Selenium',
        description:
            'Primarily it is for automating web applications for testing purposes, but is certainly not limited to just that.Boring web-based administration tasks can (and should) also be automated as well.',
        image: AppAssets.selenium,
        skillLevel: 'Intermediate'),
    Skill(
        name: 'Git',
        description:
        'Primarily it is for automating web applications for testing purposes, but is certainly not limited to just that.Boring web-based administration tasks can (and should) also be automated as well.',
        image: AppAssets.git ,
        skillLevel: 'Intermediate'),
    Skill(
        name: 'Github',
        description:
        'Primarily it is for automating web applications for testing purposes, but is certainly not limited to just that.Boring web-based administration tasks can (and should) also be automated as well.',
        image: AppAssets.github ,
        skillLevel: 'Intermediate'),
    Skill(
        name: 'Adobe XD',
        description:
        'Primarily it is for automating web applications for testing purposes, but is certainly not limited to just that.Boring web-based administration tasks can (and should) also be automated as well.',
        image: AppAssets.adobeXD ,
        skillLevel: 'Intermediate')
  ];
}
