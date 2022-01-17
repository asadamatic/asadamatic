import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/models/package.dart';
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
                Text(
                  'Contribution to Flutter',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 40.0,
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
                                      : [
                                          PackageCard(
                                            package:
                                                _controller.packagesData[0],
                                          ),
                                          PackageCard(
                                            package:
                                                _controller.packagesData[1],
                                          ),
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
  PackageCard({Key? key, this.package}) : super(key: key);
  final Package? package;
  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.all(15.0),
      child: Container(
          width: 360.0,
          height: 320.0,
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    package!.name!,
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline6!.fontSize),
                  ),
                  IconButton(
                      onPressed: () {
                        _homeController.copyPackageVersion(package!.name!);
                      },
                      icon: const Icon(Icons.copy))
                ],
              ),
              SizedBox(
                width: 290.0,
                height: 120.0,
                child: Text(
                  package!.description!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(
                      height: 1.5,
                      fontSize:
                          Theme.of(context).textTheme.subtitle1!.fontSize),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const SizedBox(
                    width: 50.0,
                  ),
                  Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: IntrinsicColumnWidth(),
                      2: IntrinsicColumnWidth(),
                    },
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, right: 8.0, left: 8.0),
                          child: Text(
                            package!.likes!,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, right: 8.0, left: 8.0),
                          child: Text(package!.pubPoints!,
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, right: 8.0, left: 8.0),
                          child: Text(package!.popularity!,
                              style: Theme.of(context).textTheme.subtitle2),
                        )
                      ]),
                      TableRow(
                          children: ['Likes', 'Pub Points', 'Popularity']
                              .map((label) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(label,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
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
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        margin: const EdgeInsets.all(15.0),
        child: Container(
            width: 360.0,
            height: 320.0,
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      baseColor: shimmerBaseColor,
                      highlightColor: shimmerHighlightColor,
                    ),
                  ],
                ),
                SizedBox(
                    width: 290.0,
                    height: 120.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.grey[200]!,
                            ),
                            height: 16.0,
                            width: 270.0,
                          ),
                          baseColor: shimmerBaseColor,
                          highlightColor: shimmerHighlightColor,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Shimmer.fromColors(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.grey[200]!,
                            ),
                            height: 16.0,
                            width: 270.0,
                          ),
                          baseColor: shimmerBaseColor,
                          highlightColor: shimmerHighlightColor,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Shimmer.fromColors(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.grey[200]!,
                            ),
                            height: 16.0,
                            width: 270.0,
                          ),
                          baseColor: shimmerBaseColor,
                          highlightColor: shimmerHighlightColor,
                        ),
                      ],
                    )),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const SizedBox(
                      width: 50.0,
                    ),
                    Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: IntrinsicColumnWidth(),
                        2: IntrinsicColumnWidth(),
                      },
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 8.0, left: 8.0),
                            child: Shimmer.fromColors(
                              child: Container(
                                height: 14.0,
                                width: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.grey[200]!,
                                ),
                              ),
                              baseColor: shimmerBaseColor,
                              highlightColor: shimmerHighlightColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 8.0, left: 8.0),
                            child: Shimmer.fromColors(
                              child: Container(
                                height: 14.0,
                                width: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.grey[200]!,
                                ),
                              ),
                              baseColor: shimmerBaseColor,
                              highlightColor: shimmerHighlightColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 8.0, left: 8.0),
                            child: Shimmer.fromColors(
                              child: Container(
                                height: 14.0,
                                width: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.grey[200]!,
                                ),
                              ),
                              baseColor: shimmerBaseColor,
                              highlightColor: shimmerHighlightColor,
                            ),
                          )
                        ]),
                        TableRow(
                            children: ['Likes', 'Pub Points', 'Popularity']
                                .map((label) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(label,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1),
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
