import 'package:asadamatic/src/style/styles.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Made with Flutter'),
          SizedBox(
            width: mediumSpacing,
          ),
          FlutterLogo()
        ],
      ),
    );
  }
}
