import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/models/package.dart';
import 'package:asadamatic/src/style/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PackagesSection extends StatelessWidget {
  const PackagesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'updatePackagesData',
        builder: (_controller) {
          return LayoutBuilder(builder:
              (BuildContext layoutBuilderContext, BoxConstraints constraints) {
            return Column(
              children: [
                const Flexible(
                    child: SizedBox(
                  height: 100.0,
                )),
                Text(
                  'Contributions to Flutter',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                constraints.maxWidth < 780
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _controller.packagesDataLoaded
                            ? _controller.packagesData
                                .map((packageData) => PackageCard(
                                      package: packageData,
                                    ))
                                .toList()
                            : const [
                                PackageShimmer(),
                                PackageShimmer(),
                                PackageShimmer()
                              ])
                    : constraints.maxWidth < 1170
                        ? Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _controller.packagesDataLoaded
                                      ? [
                                          PackageCard(
                                            package:
                                                _controller.packagesData[0],
                                          ),
                                          PackageCard(
                                            package:
                                                _controller.packagesData[1],
                                          ),
                                        ]
                                      : const [
                                          PackageShimmer(),
                                          PackageShimmer()
                                        ]),
                              _controller.packagesDataLoaded
                                  ? PackageCard(
                                      package: _controller.packagesData[2],
                                    )
                                  : const PackageShimmer()
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _controller.packagesDataLoaded
                                ? _controller.packagesData
                                    .map((packageData) => PackageCard(
                                          package: packageData,
                                        ))
                                    .toList()
                                : const [
                                    PackageShimmer(),
                                    PackageShimmer(),
                                    PackageShimmer()
                                  ],
                          ),
              ],
            );
          });
        });
  }
}

class PackageCard extends StatelessWidget {
  const PackageCard({Key? key, this.package}) : super(key: key);
  final Package? package;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.all(15.0),
      child: Container(
          width: 300.0,
          height: 250.0,
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                package!.name!,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize),
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                width: 270.0,
                height: 60.0,
                child: Text(
                  package!.description!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      height: 1.5,
                      fontSize:
                          Theme.of(context).textTheme.bodyLarge!.fontSize),
                ),
              ),
              const Flexible(child: SizedBox(height: 30.0)),
              Row(
                children: [
                  const Flexible(
                    child: SizedBox(
                      width: 50.0,
                    ),
                  ),
                  Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: IntrinsicColumnWidth(),
                      2: IntrinsicColumnWidth(),
                    },
                    children: [
                      TableRow(
                          children: [
                        package!.likes!,
                        package!.pubPoints!,
                        package!.popularity!
                      ]
                              .map(
                                (value) => Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, right: 8.0, left: 8.0),
                                  child: Text(value,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ),
                              )
                              .toList()),
                      TableRow(
                          children: ['Likes', 'Pub Points', 'Popularity']
                              .map((label) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(label,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ))
                              .toList())
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class PackageShimmer extends StatelessWidget {
  const PackageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        margin: const EdgeInsets.all(15.0),
        child: Container(
            width: 300.0,
            height: 250.0,
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Shimmer.fromColors(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.grey[200]!,
                    ),
                    height: 20.0,
                    width: 160.0,
                  ),
                  baseColor: AppStyles.shimmerBaseColor,
                  highlightColor: AppStyles.shimmerHighlightColor,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                    width: 270.0,
                    height: 60.0,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [1, 2, 3, 4, 5]
                            .map((index) => index % 2 == 0
                                ? const SizedBox(
                                    height: 6.0,
                                  )
                                : Shimmer.fromColors(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: Colors.grey[200]!,
                                      ),
                                      height: 14.0,
                                      width: 270.0,
                                    ),
                                    baseColor: AppStyles.shimmerBaseColor,
                                    highlightColor:
                                        AppStyles.shimmerHighlightColor,
                                  ))
                            .toList())),
                const Flexible(child: SizedBox(height: 30.0)),
                Row(
                  children: [
                    const Flexible(
                      child: SizedBox(
                        width: 50.0,
                      ),
                    ),
                    Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: IntrinsicColumnWidth(),
                        2: IntrinsicColumnWidth(),
                      },
                      children: [
                        TableRow(
                            children: [1, 2, 3]
                                .map((index) => Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 8.0, left: 8.0),
                                      child: Shimmer.fromColors(
                                        child: Container(
                                          height: 14.0,
                                          width: 20.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            color: Colors.grey[200]!,
                                          ),
                                        ),
                                        baseColor: AppStyles.shimmerBaseColor,
                                        highlightColor:
                                            AppStyles.shimmerHighlightColor,
                                      ),
                                    ))
                                .toList()),
                        TableRow(
                            children: ['Likes', 'Pub Points', 'Popularity']
                                .map((label) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(label,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ))
                                .toList())
                      ],
                    ),
                  ],
                )
              ],
            )));
  }
}
