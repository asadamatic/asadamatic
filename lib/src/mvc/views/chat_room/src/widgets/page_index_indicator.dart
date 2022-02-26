import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/auth_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageIndexIndicator extends StatelessWidget {
  const PageIndexIndicator(
      {Key? key, required this.pageCount, required this.authType})
      : super(key: key);

  final int? pageCount;
  final AuthType? authType;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pageCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Align(
              alignment: Alignment.topCenter,
              child: GetBuilder<ChatController>(
                  id: 'updatePageIndexDisplay',
                  builder: (_chatController) {
                    final currentPage = authType == AuthType.resetPin
                        ? _chatController.resetPinPageIndex == index
                        : _chatController.welcomePageIndex == index;
                    return Card(
                      elevation: currentPage ? 5.0 : 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      margin: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 12.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        child: Text((index + 1).toString()),
                      ),
                    );
                  }),
            ));
  }
}
