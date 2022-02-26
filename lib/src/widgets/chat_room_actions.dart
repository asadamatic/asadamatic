import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/constants/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class ChatRoomActions extends StatelessWidget {
//   const ChatRoomActions({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final ChatController _chatController = Get.find();
//     return GetBuilder<ChatController>(
//         id: 'updateChatRoomActions',
//         builder: (_chatController) => Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   InkWell(
//                     onTap: _chatController.toggleChatRoom,
//                     child: Container(
//                         margin: const EdgeInsets.all(8.0),
//                         alignment: Alignment.center,
//                         height: ChatRoomStyles.actionSize,
//                         width: ChatRoomStyles.actionSize,
//                         decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.circular(ChatRoomStyles.actionSize),
//                         ),
//                         child: ChatRoomConstants.closeIcon),
//                   ),
//                   if (_chatController.isLoggedIn)
//                     InkWell(
//                       onTap: () => _chatController.resizeChatRoom(
//                           maxHeight: MediaQuery.of(context).size.height,
//                           maxWidth: MediaQuery.of(context).size.width),
//                       child: Container(
//                           margin: const EdgeInsets.all(8.0),
//                           alignment: Alignment.center,
//                           height: ChatRoomStyles.actionSize,
//                           width: ChatRoomStyles.actionSize,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                                 ChatRoomStyles.actionSize),
//                           ),
//                           child: ChatRoomConstants.resizeIcon),
//                     ),
//                   if (_chatController.isLoggedIn)
//                     InkWell(
//                       onTap: _chatController.logout,
//                       child: Container(
//                           margin: const EdgeInsets.all(8.0),
//                           alignment: Alignment.center,
//                           height: ChatRoomStyles.actionSize,
//                           width: ChatRoomStyles.actionSize,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                                 ChatRoomStyles.actionSize),
//                           ),
//                           child: ChatRoomConstants.settingsIcon),
//                     ),
//                 ]));
//   }
// }

PreferredSizeWidget chatRoomActionsNew() {
  final ChatController _chatController = Get.find();
  return AppBar(
    titleSpacing: 0.0,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: ChatRoomConstants.closeIcon,
          onPressed: AppConstants.isWebMobile
              ? _chatController.pushPopChatRoom
              : _chatController.toggleChatRoom,
        ),
        if (!AppConstants.isWebMobile)
          GetBuilder<ChatController>(
              id: 'updateChatRoomActions',
              builder: (_chatController) => _chatController.isLoggedIn
                  ? Flexible(
                      child: IconButton(
                        icon: ChatRoomConstants.resizeIcon,
                        onPressed: () => _chatController.resizeChatRoom(),
                      ),
                    )
                  : SizedBox()),
      ],
    ),
    actions: [
      GetBuilder<ChatController>(
          id: 'updateChatRoomActions',
          builder: (_chatController) => _chatController.isLoggedIn
              ? IconButton(
                  onPressed: _chatController.logout,
                  icon: ChatRoomConstants.settingsIcon)
              : SizedBox())
    ],
  );
}
