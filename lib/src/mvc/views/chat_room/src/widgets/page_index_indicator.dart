import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class PageIndexIndicator extends StatelessWidget {
  const PageIndexIndicator({Key? key, int? pageCount})
      : _pageCount = pageCount,
        super(key: key);

  final int? _pageCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _pageCount,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Align(
            alignment: Alignment.topCenter,
            child: GetBuilder<ChatController>(
                id: 'updatePageIndexDisplay',
                builder: (_chatController) {
                  final currentPage =
                      _chatController.welcomePageIndex == index;
                  return Card(
                    elevation: currentPage ? 5.0 : 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    margin: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 12.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      alignment: Alignment.center,
                      width: currentPage ? 50.0 : 45.0,
                      height: currentPage ? 50.0 : 45.0,
                      child: Text((index + 1).toString()),
                    ),
                  );
                }),
          )),
    );
  }
}
