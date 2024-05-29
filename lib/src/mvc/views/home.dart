import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/views/fragments/footer.dart';
import 'package:asadamatic/src/mvc/views/fragments/packages_section.dart';
import 'package:asadamatic/src/mvc/views/paralax_flow_delegate.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:asadamatic/src/widgets/apps_section.dart';
import 'package:asadamatic/src/widgets/bio_contianer.dart';
import 'package:asadamatic/src/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart'
    as responsive_framework;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  List<Widget> get _parallaxEffectSections => [
        ParalaxBioSection(),
        ParalaxAppsSection(),
        ParalaxContributionsSection()
      ];
  List<Widget> _sections(BuildContext context) {
    final double sectionSpacing = responsive_framework.ResponsiveValue<double>(
        context,
        defaultValue: massiveSpacing,
        conditionalValues: [
          const responsive_framework.Condition.equals(
              name: responsive_framework.MOBILE, value: massiveSpacing),
          const responsive_framework.Condition.largerThan(
              name: responsive_framework.MOBILE, value: giantSpacing),
        ]).value;
    return [
      const BioContainer(),
      SizedBox(
        height: sectionSpacing,
      ),
      const AppsSection(),
      SizedBox(
        height: sectionSpacing,
      ),
      const ContributionsSection()
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GetBuilder<HomeController>(
        init: HomeController(),
        autoRemove: false,
        builder: (controller) {
          return Scaffold(
            body: ListView(
              children: [
                Align(
                    alignment: responsive_framework.ResponsiveValue<Alignment>(
                        context,
                        defaultValue: Alignment.topRight,
                        conditionalValues: [
                          const responsive_framework.Condition.equals(
                              name: responsive_framework.MOBILE,
                              value: Alignment.topCenter),
                          const responsive_framework.Condition.largerThan(
                              name: responsive_framework.MOBILE,
                              value: Alignment.topRight),
                        ]).value,
                    child: const ThemeSwitch()),
                const Gap(massiveSpacing),
                Column(
                  children: _sections(context),
                )
              ],
            ),
          );
        });
  }
}

class ContributionsSection extends StatelessWidget {
  const ContributionsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PackagesSection(),
        SizedBox(
          height: 80.0,
        ),
        Footer(),
      ],
    );
  }
}

class ParalaxAppsSection extends StatelessWidget {
  ParalaxAppsSection({super.key});

  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AspectRatio(
      aspectRatio: size.width / size.height,
      child: Flow(
        delegate: ParallaxFlowDelegate(
          scrollable: Scrollable.of(context),
          listItemContext: context,
          backgroundImageKey: _key,
        ),
        children: [
          SizedBox(
            // height: 400,
            child: AppsSection(
              key: _key,
            ),
          )
        ],
      ),
    );
  }
}

class ParalaxBioSection extends StatelessWidget {
  ParalaxBioSection({super.key});

  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AspectRatio(
      aspectRatio: size.width / size.height,
      child: Flow(
        delegate: ParallaxFlowDelegate(
          scrollable: Scrollable.of(context),
          listItemContext: context,
          backgroundImageKey: _key,
        ),
        children: [
          BioContainer(
            key: _key,
          )
        ],
      ),
    );
  }
}

class ParalaxContributionsSection extends StatelessWidget {
  ParalaxContributionsSection({super.key});

  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AspectRatio(
      aspectRatio: size.width / size.height,
      child: Flow(
        delegate: ParallaxFlowDelegate(
          scrollable: Scrollable.of(context),
          listItemContext: context,
          backgroundImageKey: _key,
        ),
        children: [
          ContributionsSection(
            key: _key,
          )
        ],
      ),
    );
  }
}
