import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        id: 'updateLoadingWidget',
        builder: (_chatController) => Container(
            color: Colors.white54,
            child: _chatController.isLoading!
                ? const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
                : const SizedBox()));
  }
}
