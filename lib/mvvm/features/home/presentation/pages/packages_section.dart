import 'package:asadamatic/mvvm/features/home/presentation/get/home_controller.dart';
import 'package:asadamatic/mvvm/features/home/domain/entity/package.dart';
import 'package:asadamatic/mvvm/core/styles/app_styles.dart';
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
          return Wrap(
              alignment: WrapAlignment.center,
              children: _controller.packagesDataLoaded
                  ? _controller.packagesData
                      .map((packageData) => PackageCard(
                            package: packageData,
                          ))
                      .toList()
                  : [1, 2, 3].map((_) => PackageShimmer()).toList());
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
                    fontSize: Theme.of(context).textTheme.headline6!.fontSize),
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
                          Theme.of(context).textTheme.bodyText1!.fontSize),
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
                                          .bodyText2),
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
                                            .bodyText2),
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
                                              .bodyText2),
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
