import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/models/value_type.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:asadamatic/src/widgets/value_ticker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class Reputation extends StatelessWidget {
  const Reputation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final responsiveTextStyle = ResponsiveValue<WrapAlignment>(context,
        defaultValue: WrapAlignment.spaceBetween,
        conditionalValues: [
          const Condition.equals(
              name: MOBILE, value: WrapAlignment.spaceBetween),
          const Condition.equals(
              name: TABLET, value: WrapAlignment.spaceEvenly),
          const Condition.largerThan(
              name: TABLET, value: WrapAlignment.spaceEvenly),
        ]).value;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      runAlignment: WrapAlignment.start,
      alignment: responsiveTextStyle,
      spacing: hugeSpacing,
      children: scoresList(),
    );
  }

  List<Widget> scoresList() {
    return scores
        .map((score) => ScoreWidget(
              score: score,
            ))
        .toList();
  }
}

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.score,
  });

  final Score score;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final responsiveTextStyle = ResponsiveValue<TextStyle>(
        defaultValue: textTheme.titleMedium,
        context,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: textTheme.titleMedium),
          Condition.equals(name: TABLET, value: textTheme.titleLarge),
          Condition.largerThan(name: TABLET, value: textTheme.headlineMedium),
        ]).value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              score.title,
              textAlign: TextAlign.left,
              style: responsiveTextStyle.copyWith(),
            ),
            if (score.profileUrl != null)
              IconButton(
                  onPressed: () => launchUrl(Uri.parse(score.profileUrl!)),
                  icon: const Icon(Icons.open_in_new_outlined))
          ],
        ),
        AnimatedValueTicker(
          score: score.score,
        )
      ],
    );
  }
}
