import 'package:asadamatic/main.dart';
import 'package:asadamatic/mvvm/authentication/constants/constants.dart';
import 'package:asadamatic/mvvm/features/home/constants/home_constants.dart';
import 'package:flutter/material.dart';
import 'package:asadamatic/mvvm/core/styles/app_styles.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.onPressed}) : super(key: key);

  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppStyles.customButtonHeight,
      width: AppStyles.customButtonWidth,
      decoration: AppStyles.buttonDecoration,
      child: ElevatedButton(
        child: Text("Let's Work Together"),
        onPressed: (){

        },
        style: ButtonStyle(
          shape: AppStyles.customButtonShape,
          textStyle:MaterialStateProperty.all(
            Theme.of(context).textTheme.titleMedium
          )
        ),
      ),
    );
  }
}
