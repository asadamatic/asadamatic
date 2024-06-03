import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/models/package.dart';
import 'package:asadamatic/src/style/styles.dart';
import 'package:asadamatic/src/widgets/responsive_grid_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PackagesSection extends StatelessWidget {
  const PackagesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return GetBuilder<HomeController>(
        id: 'updatePackagesData',
        builder: (_controller) {
          return LayoutBuilder(builder:
              (BuildContext layoutBuilderContext, BoxConstraints constraints) {
            return Column(
              children: [
                Text(
                  'Contributions to Flutter',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium,
                ),
                CustomResponsiveGridView(
                    phoneCrossAxisCount: 1,
                    tabletCrossAxisCount: 2,
                    padding: EdgeInsets.symmetric(horizontal: massiveSpacing),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => PackageCard(
                          package: AppConstants.packagesDescription[index],
                        ),
                    itemCount: AppConstants.packagesDescription.length)
              ],
            );
          });
        });
  }
}

class PackageCard extends StatelessWidget {
  const PackageCard({Key? key, required this.package}) : super(key: key);
  final Package package;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: smallElevation,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      margin: const EdgeInsets.all(15.0),
      child: Padding(
          padding: const EdgeInsets.all(hugeSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    package.name!,
                    style: TextStyle(fontSize: textTheme.titleLarge!.fontSize),
                  ),
                  IconButton(
                      onPressed: () => launchUrl(Uri.parse(package.url)),
                      icon: const Icon(Icons.open_in_new_rounded))
                ],
              ),
              const SizedBox(
                height: smallSpacing,
              ),
              Text(package.description!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: textTheme.bodyLarge),
              const Flexible(child: SizedBox(height: 30.0)),
              Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: IntrinsicColumnWidth(),
                  2: IntrinsicColumnWidth(),
                },
                children: [
                  TableRow(
                      children: [
                    package.likes,
                    package.pubPoints,
                    package.popularity!
                  ]
                          .map(
                            (value) => Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, right: 8.0, left: 8.0),
                              child: Text(value!,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                          )
                          .toList()),
                  TableRow(
                      children: ['Likes', 'Pub Points', 'Popularity']
                          .map((label) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(label,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ))
                          .toList())
                ],
              )
            ],
          )),
    );
  }
}
