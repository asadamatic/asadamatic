import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/models/screen_type.dart';
import 'package:asadamatic/src/widgets/value_heading.dart';
import 'package:asadamatic/src/widgets/value_ticker.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({Key? key, required this.textTheme, required this.screen})
      : super(key: key);

  final TextTheme textTheme;
  final Screen screen;
  @override
  Widget build(BuildContext context) {
    return screen == Screen.small
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: scoresList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: scoresList(),
          );
  }

  List<Widget> scoresList() {
    return AppConstants.scores
        .map((score) => Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: screen == Screen.small
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  ValueHeading(
                    screen: screen,
                    textTheme: textTheme,
                    heading: score[0],
                    valueType: score[1],
                  ),
                  ValueTicker(
                    valueType: score[1],
                    screen: screen,
                  )
                ],
              ),
            ))
        .toList();
  }
}
