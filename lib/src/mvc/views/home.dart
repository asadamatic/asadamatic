import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/views/fragments/footer.dart';
import 'package:asadamatic/src/mvc/views/fragments/packages_section.dart';
import 'package:asadamatic/src/mvc/views/paralax_flow_delegate.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:asadamatic/src/widgets/apps_section.dart';
import 'package:asadamatic/src/widgets/bio_contianer.dart';
import 'package:asadamatic/src/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart'
    as responsive_framework;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  List<Widget> _sections(BuildContext context) {
    final double sectionSpacing = responsive_framework.ResponsiveValue<double>(
        context,
        defaultValue: massiveSpacing,
        conditionalValues: [
          const responsive_framework.Condition.equals(
              name: responsive_framework.MOBILE, value: largeSpacing),
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
              padding: const EdgeInsets.all(largeSpacing),
              children: [
                Wrap(
                  verticalDirection: VerticalDirection.up,
                  runSpacing: mediumSpacing,
                  runAlignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment:
                      responsive_framework.ResponsiveValue<WrapAlignment>(
                          context,
                          defaultValue: WrapAlignment.center,
                          conditionalValues: [
                        const responsive_framework.Condition.equals(
                            name: responsive_framework.MOBILE,
                            value: WrapAlignment.center),
                        const responsive_framework.Condition.largerThan(
                            name: responsive_framework.MOBILE,
                            value: WrapAlignment.spaceBetween),
                      ]).value,
                  children: [UpworkWidget(), ThemeSwitch()],
                ),
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
          height: giantSpacing,
        ),
        Footer(),
      ],
    );
  }
}

class UpworkWidget extends StatelessWidget {
  const UpworkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: () => launchUrl(Uri.parse(upworkProfileUrl)),
      child: Padding(
        padding: const EdgeInsets.all(smallSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hire me on',
              style: textTheme.titleLarge,
            ),
            SvgPicture.asset(
              upworkLogo,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
