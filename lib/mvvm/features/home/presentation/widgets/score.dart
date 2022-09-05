import 'dart:ui';

import 'package:asadamatic/mvvm/core/constants/values.dart';
import 'package:asadamatic/mvvm/enums.dart';
import 'package:asadamatic/mvvm/features/home/constants/home_constants.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/value_heading.dart';
import 'package:asadamatic/mvvm/features/home/presentation/widgets/value_ticker.dart';
import 'package:asadamatic/mvvm/features/home/styles/home_styles.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({Key? key, required this.textTheme, required this.screen})
      : super(key: key);

  final TextTheme textTheme;
  final Screen? screen;
  @override
  Widget build(BuildContext context) {
    return screen == Screen.small
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: scoresList())
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              scoreCard(HomeConstants.scores[0][0], HomeConstants.scores[0][1]),
              Spacer(),
              scoreCard(HomeConstants.scores[1][0], HomeConstants.scores[1][1]),
              Spacer(),
              scoreCard(HomeConstants.scores[2][0], HomeConstants.scores[2][1]),
              Spacer(
                flex: 2,
              ),
            ],
          );
  }

  List<Widget> scoresList() {
    return HomeConstants.scores
        .map((score) => scoreCard(score[0], score[1]))
        .toList();
  }

  Widget scoreCard(String title, ValueType valueType) {
    return Card(
      elevation: 4.0,
      shape: HomeStyles.skillSectionShape,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueHeading(
              screen: screen,
              textTheme: textTheme,
              heading: title,
              valueType: valueType,
            ),
            ValueTicker(
              valueType: valueType,
              screen: screen,
            )
          ],
        ),
      ),
    );
  }
}
