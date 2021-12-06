import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/controllers/os_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Switcher extends StatelessWidget {
  Switcher({this.direction, Key? key}) : super(key: key);

  final Axis? direction;

  OsController _osController = Get.put(OsController());
  @override
  Widget build(BuildContext context) {
    return Container(
        height: direction == Axis.horizontal ? 75.0 : 130.0,
        width: direction == Axis.horizontal ? 130.0 : 75.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(55.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: GetBuilder<OsController>(builder: (_controller) {
          return direction == Axis.horizontal
              ? Row(
                  children: os
                      .map(
                        (e) => Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: _controller.index.value ==
                                      os.indexOf(e)
                                  ? [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ]
                                  : []),
                          child: InkWell(
                            onTap: () {
                              _controller.onOsChanged(os.indexOf(e));
                            },
                            child: FlutterLogo(),
                          ),
                        )),
                      )
                      .toList(),
                )
              : Column(
                  children: os
                      .map(
                        (e) => Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          width: 50.0,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: _controller.index.value ==
                                      os.indexOf(e)
                                  ? [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ]
                                  : []),
                          child: InkWell(
                            onTap: () {
                              _controller.onOsChanged(os.indexOf(e));
                            },
                            child: FlutterLogo(),
                          ),
                        )),
                      )
                      .toList(),
                );
        }));
  }
}
