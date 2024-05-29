import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter/gestures.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomResponsiveGridView extends StatelessWidget {
  // Existing parameters from MasonryGridView
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final Clip clipBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;

  // Additional parameter for phone crossAxisCount
  final int phoneCrossAxisCount;
  final int tabletCrossAxisCount;
  final int desktopCrossAxisCount;

  // Child widget builder
  final IndexedWidgetBuilder itemBuilder;

  // Number of items to be displayed
  final int itemCount;

  const CustomResponsiveGridView({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.phoneCrossAxisCount = 1,
    required this.itemBuilder,
    required this.itemCount,
    this.tabletCrossAxisCount = 3,
    this.desktopCrossAxisCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get the screen size
        final size = constraints.maxWidth;

        // Calculate crossAxisCount based on ScreenBreakpoint
        final crossAxisCount = ResponsiveBreakpoints.of(context).isMobile
            ? phoneCrossAxisCount
            : calculateCrossAxisCountForLargeScreens(context, size);

        return MasonryGridView.builder(
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount),
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          clipBehavior: clipBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          itemBuilder: itemBuilder,
          itemCount: itemCount,
        );
      },
    );
  }

  // Logic for calculating crossAxisCount for larger screens
  int calculateCrossAxisCountForLargeScreens(
      BuildContext context, double width) {
    // Example logic: Determine crossAxisCount based on screen width breakpoints
    if (ResponsiveBreakpoints.of(context).isTablet) {
      return tabletCrossAxisCount; // Example for desktops (large)
    } else if (ResponsiveBreakpoints.of(context).isDesktop) {
      return desktopCrossAxisCount; // Example for desktops (large)
    } else {
      return 5; // Example for desktops (extra lCarge)
    }
  }
}
