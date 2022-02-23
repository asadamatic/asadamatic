import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/welcome_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("Chat Screen"),
                Text("Chat feature is under development!"),
              ],
            ),
          ),
          const LoadingWidget()
        ],
      ),
    );
  }
}
