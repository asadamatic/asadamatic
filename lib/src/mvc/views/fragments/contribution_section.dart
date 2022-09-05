import 'package:asadamatic/src/mvc/views/fragments/footer.dart';
import 'package:asadamatic/src/mvc/views/fragments/packages_section.dart';
import 'package:flutter/material.dart';


class ContributionsSection extends StatelessWidget {
  const ContributionsSection({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Flexible(child: PackagesSection()),
          SizedBox(
            height: 80.0,
          ),
          Footer(),
        ],
      ),
    );
  }
}
