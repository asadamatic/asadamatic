import 'package:flutter/material.dart';

class BottomAppButton extends StatelessWidget {
  const BottomAppButton(
      {Key? key,
      required Function? onPressed,
      required String? label,
      required Icon? icon})
      : _onPressed = onPressed,
        _label = label,
        _icon = icon,
        super(key: key);

  final Function? _onPressed;
  final String? _label;
  final Icon? _icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ElevatedButton.icon(
              icon: _icon!,
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0)))),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).bottomAppBarColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              label: Text(
                _label ?? 'Button Label',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                _onPressed!();
              },
            ),
          )
        ],
      ),
    );
  }
}
