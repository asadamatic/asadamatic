import 'package:asadamatic/src/mvc/views/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String home = '/';
const String homeRouteName = 'home';

const String appsRoute = '/apps';
const String appsRouteName = 'apps';
const String contributionsRoute = '/contributions';
const String contributionsRouteName = 'contributions';
const String additionalRoute = '/additional';
const String additionalRouteName = 'additional';
const String settingsRoute = '/settings';
const String settingsRouteName = 'settings';

/// In Flutter, it’s often beneficial to have a centralized navigation helper,
/// especially if you’re working with multiple routes and navigators. Here,
/// we implement the singleton pattern for our navigation helper
///
/// This code defines a singleton instance of the CustomNavigationHelper.
/// This ensures that only a single instance of this class is created and shared
/// throughout the application.
/// ```
/// static final CustomNavigationHelper _instance =
/// CustomNavigationHelper._internal();

/// static CustomNavigationHelper get instance => _instance;
/// ```
///
///
class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> bioTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> collectionsTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> appsTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> contributionsTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    final routes = <RouteBase>[
      GoRoute(
        path: home,
        name: homeRouteName,
        builder: (context, GoRouterState state) {
          return const Home();
        },
      ),

      // StatefulShellRoute.indexedStack(
      //     parentNavigatorKey: parentNavigatorKey,
      //     builder: (context, state, navigationShell) {

      //       return Home(
      //         child: navigationShell,
      //       );
      //     },
      //     branches: [
      //       StatefulShellBranch(navigatorKey: bioTabNavigatorKey, routes: [
      //         GoRoute(
      //           path: bio,
      //           name: bioRouteName,
      //           builder: (context, GoRouterState state) {
      //             return BioContainer();
      //           },
      //         ),
      //       ]),

      //       StatefulShellBranch(navigatorKey: appsTabNavigatorKey, routes: [
      //         GoRoute(
      //             path: contributionsRoute,
      //             name: contributionsRouteName,
      //             builder: (context, GoRouterState state) {
      //               return  AppsSection();
      //             },
      //             ),
      //       ]),
      //       StatefulShellBranch(navigatorKey: contributionsTabNavigatorKey, routes: [
      //         GoRoute(
      //             path: additionalRoute,
      //             name: additionalRouteName,
      //             builder: (context, GoRouterState state) {
      //               return  ContributionsSection();
      //             },
      //             ),
      //       ])
      //     ]),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: home,
      routes: routes,
    );
  }
}
