import 'package:asadamatic/src/style/styles.dart';
import 'package:asadamatic/src/widgets/asad_hameed.dart';
import 'package:asadamatic/src/widgets/my_description.dart';
import 'package:asadamatic/src/widgets/score.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BioContainer extends StatelessWidget {
  const BioContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final isMobile = ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: massiveSpacing, vertical: massiveSpacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avoid Spacer/Flexible/Expanded for Mobile View, Becuase it Use Column ( Flex -> Vertical), and its
              // parent is Scrollable. This will give unbounded height error.
              if (!isMobile)
                Flexible(flex: 3, child: const AsadHameed())
              else
                const AsadHameed(),
              if (!isMobile) const Spacer(),
              if (isMobile)
                const MyDescription()
              else
                const Flexible(flex: 4, child: MyDescription())
            ],
          
          ),

          const SizedBox(height: massiveSpacing),
          // Done
          const Reputation()
        ],
      ),
    );
  }
}
