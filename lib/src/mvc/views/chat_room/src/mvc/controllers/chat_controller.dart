import 'dart:async';

import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/main.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/chat_messages.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/session.dart';
import 'package:asadamatic/src/mvc/models/user.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/verification_code.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/chat_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/reset_pin_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/services/authentication.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/services/chat.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/styles/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController extends GetxController {
  bool? sessionIdLoaded = false;
  String? sessionId = '';
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();
  final GlobalKey<FormState> welcomeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPinFormKey = GlobalKey<FormState>();
  bool? isLoading = false;
  int welcomePageIndex = 0;
  int resetPinPageIndex = 0;
  final PageController welcomePageController = PageController();
  final PageController resetPinPageController = PageController();
  final Authentication _authentication = Authentication();
  DateTime? codeExpirationTime;
  Duration? timeLeft;
  RxString? timeDisplay = ''.obs;
  bool? userExists = false;
  VerificationCode? verificationCode;
  int? pin;
  Session? session;
  bool isLoggedIn = false;
  RxString errorText = ''.obs;
  // ChatRoomContainer dimensions
  double chatRoomHeight = ChatRoomStyles.chatRoomHeightClosed;
  double chatRoomWidth = ChatRoomStyles.chatRoomWidthClosed;
  bool chatRoomOpen = false;
  bool chatRoomMax = false;

  // ChatScreen implementation
  List<ChatMessage> chatMessages = [];
  final ChatService _chatService = ChatService();
  final GlobalKey<FormState> messageFormKey = GlobalKey<FormState>();
  final TextEditingController messageEditingController =
      TextEditingController();
  String? message = '';
  final ScrollController messageScrollController =
      ScrollController(initialScrollOffset: 400.0);
  bool hasMoreMessages = false;

  toggleChatRoom() {
    if (chatRoomOpen) {
      chatRoomHeight = ChatRoomStyles.chatRoomHeightClosed;
      chatRoomWidth = ChatRoomStyles.chatRoomWidthClosed;
      chatRoomOpen = !chatRoomOpen;
      update(['updateChatRoomContainer']);
    } else {
      chatRoomHeight = ChatRoomStyles.chatRoomHeightMin;
      chatRoomWidth = ChatRoomStyles.chatRoomWidthMin;
      update(['updateChatRoomContainer']);
      Future.delayed(const Duration(milliseconds: 600)).then((value) {
        chatRoomOpen = !chatRoomOpen;
        update(['updateChatRoomContainer']);
      });
    }
  }

  pushPopChatRoom() {
    if (chatRoomOpen) {
      Get.back();
    } else {
      Get.to(
        () => ChatRoom(),
        popGesture: true,
      )!
          .then((value) => chatRoomOpen = false);
    }
    chatRoomOpen = !chatRoomOpen;
  }

  resizeChatRoom({double? maxHeight, double? maxWidth}) {
    if (chatRoomMax) {
      chatRoomHeight = ChatRoomStyles.chatRoomHeightMin;
      chatRoomWidth = ChatRoomStyles.chatRoomWidthMin;
      chatRoomMax = false;
    } else {
      chatRoomHeight = ChatRoomStyles.chatRoomHeightMax;
      chatRoomWidth = ChatRoomStyles.chatRoomWidthMax;
      chatRoomMax = true;
    }
    update(['updateChatRoomContainer']);
  }

  // Chat Screen Functions

  loadMessages() async {
    final response = await _chatService.getMessages(session!);
    if (response.statusCode == 200) {
      // final jsonList = json.decode(response.body)['messages'];
      // chatMessages = List<ChatMessage>.from(jsonList.map((message) => ChatMessage.fromJson(message)));

      List<dynamic> data = response.body["messages"];
      chatMessages =
          data.map((message) => ChatMessage.fromJson(message)).toList();

      hasMoreMessages = response.body['has_more'];

      chatMessages.sort((a, b) => b.index!.compareTo(a.index!));
    } else if (response.statusCode == 404) {}
  }

  loadMoreMessages() {
    //TODO: load more messages
    chatMessages.sort((a, b) => b.index!.compareTo(a.index!));
    update(['updateMessages']);
  }

  sendMessage() async {
    if (messageFormKey.currentState!.validate()) {
      final response = await _chatService.sendMessage(ChatMessage(
          chatRoomId: session!.email,
          message: message,
          sessionId: 'dummy',
          senderEmail: 'asadamatic@gmail.com',
          receiverEmail: 'wecreatelegacy@gmail.com',
          sentTime: DateTime.now(),
          status: 'received'));

      if (response.statusCode == 201) {
        messageEditingController.clear();
        chatMessages.add(ChatMessage.fromJson(response.body));
        chatMessages.sort((a, b) => b.index!.compareTo(a.index!));
        messageScrollController.animateTo(0.0,
            curve: Curves.easeIn, duration: const Duration(milliseconds: 600));
        update(['updateMessages']);
      } else if (response.statusCode == 200) {}
    }
  }

  @override
  void onInit() async {
    super.onInit();
    sessionId = await getSessionId();
    if (sessionId!.isNotEmpty) {
      final response = await _authentication.loadSession(sessionId);
      if (response.statusCode == 200) {
        session = Session.fromJson(response.body);
        if (session!.isActive!) {
          isLoggedIn = true;

          // Load messages
          await loadMessages();

          // Load messages
        }
      } else {
        sessionId = "";
      }
    }

    sessionIdLoaded = true;
    update(['updateChatWrapper', 'updateChatRoomActions']);
  }

  // Email functions
  String? emailValidator(String? email) {
    return AppConstants.emailRegExp.hasMatch(email!)
        ? null
        : 'Invalid email address';
  }

  onEmailChanged(String? email) {
    if (AppConstants.emailRegExp.hasMatch(email!)) {
      welcomeFormKey.currentState!.validate();
    }
  }

  // Name functions
  String? nameValidator(String? name) {
    return name!.isNotEmpty ? null : 'Provide a name';
  }

  onNameChanged(String? name) {
    if (name!.isNotEmpty) {
      welcomeFormKey.currentState!.validate();
    }
  }

  // Pin code functions
  String? pinValidator(String? name) {
    return name!.isNotEmpty ? null : 'Provide a name';
  }

  // Verification code functions
  String? verificationCodeValidator(String? name) {
    return name!.isNotEmpty ? null : 'Provide a name';
  }

  // Message functions
  String? messageValidator(String? message) {
    return message!.isNotEmpty ? null : '';
  }

  onMessageChanged(String? value) {
    String oldMessage = message!;
    message = value!;
    if ((oldMessage.isEmpty && value.isNotEmpty) ||
        (oldMessage.isNotEmpty && value.isEmpty)) {
      update(['updateMessageButton']);
    }
  }

  verifyEmail() async {
    if (welcomeFormKey.currentState!.validate()) {
      // Display the loading widget while request in process
      isLoading = true;
      update(['updateLoadingWidget']);

      // Calling API for email verification
      final response = await _authentication
          .sendEmailForVerification(emailEditingController.text.trim());

      // Checking response for success
      if (response.statusCode == 201) {
        errorText.value = '';
        // Verification code is sent to the provided email address
        verificationCode = VerificationCode.baseFromJson(response.body);

        timeLeft = verificationCode!.expireTime!
            .difference(verificationCode!.genTime!);

        // Registering a timer that ticks every 1 second and will run for [timeLeft]
        Timer.periodic(const Duration(seconds: 1), (timer) {
          if (timeLeft == Duration.zero) {
            getTime();
            update(['updateResendButton']);
            timer.cancel();
          }
          getTime();
        });

        switchToNextPageOnAnyScreen();
      } else if (response.statusCode == 200) {
        errorText.value = '';
        // User already exists for the provided email, so directing user to enter [pin]

        userExists = true;
        update(['changeVerificationScreen']);
        switchToNextPageOnAnyScreen();
      } else {
        errorText.value = 'Some error occurred!';
      }

      // Hiding the loading widget once the request is complete
      isLoading = false;
      update(['updateLoadingWidget']);
    }
  }

  verifyCode() async {
    if (welcomeFormKey.currentState!.validate()) {
      // Display the loading widget while request in process
      isLoading = true;
      update(['updateLoadingWidget']);

      // Calling API for email code verification
      final response = await _authentication.verifyCode(VerificationCode(
          index: verificationCode!.index,
          email: verificationCode!.email,
          genTime: verificationCode!.genTime,
          expireTime: verificationCode!.expireTime,
          code: verificationCode!.code,
          usedTime: DateTime.now()));

      // Checking response for success
      if (response.statusCode == 202) {
        errorText.value = '';
        switchToNextPageOnAnyScreen();
      } else if (response.statusCode == 200) {
        errorText.value = 'Verification code did not match!';
      } else if (response.statusCode == 406) {
        errorText.value = 'Verification code expired!';
      } else if (response.statusCode == 404) {
        errorText.value = 'Invalid verification code!';
      }

      // Hiding the loading widget once the request is complete
      isLoading = false;
      update(['updateLoadingWidget']);
    }
  }

  verifyPin() async {
    if (welcomeFormKey.currentState!.validate()) {
      // Display the loading widget while request in process

      isLoading = true;
      update(['updateLoadingWidget']);

      // Calling API for user pin verification

      final response = await _authentication.verifyPin(
          User(
              email: emailEditingController.text.isEmpty
                  ? session?.email
                  : emailEditingController.text,
              pin: pin),
          sessionId: session?.sessionId ?? '');

      // Checking response for success

      if (response.statusCode == 200) {
        errorText.value = '';
        isLoggedIn = true;
        if (session == null) {
          session = Session.fromJson(response.body);
          setSessionId(session!.sessionId!);
          sessionId = session!.sessionId!;
        } else {
          session!.isActive = true;
        }
        // Load messages
        await loadMessages();

        // Load messages
        update(
            ['updateChatWrapper', 'updateChatRoomActions', 'updateMessages']);
      } else if (response.statusCode == 404) {
        errorText.value = 'Pin did not match!';
      } else if (response.statusCode == 500) {
        errorText.value = 'Some error occurred!';
      }

      // Hiding the loading widget once the request is complete
      isLoading = false;
      update(['updateLoadingWidget']);
    }
  }

  setUserData() async {
    if (welcomeFormKey.currentState!.validate()) {
      // Display the loading widget while request in process
      setSessionId('');
      sessionId = "";
      isLoading = true;
      update(['updateLoadingWidget']);

      // Calling API to set user pin and name

      final response = await _authentication.setUserData(
          User(
              email: verificationCode!.email,
              name: nameEditingController.text,
              pin: pin),
          sessionId: session?.sessionId ?? '');
      if (response.statusCode == 200) {
        errorText.value = '';
        isLoggedIn = true;
        session = Session.fromJson(response.body);
        sessionId = session!.sessionId;
        setSessionId(session!.sessionId!);
        // Load messages
        await loadMessages();

        // Load messages
        update(
            ['updateChatWrapper', 'updateChatRoomActions', 'updateMessages']);
      } else {
        errorText.value = 'Some error occurred!';
      }

      // Hiding the loading widget once the request is complete
      isLoading = false;
      update(['updateLoadingWidget']);
    }
  }

  resetPin() {}
  getTime() {
    timeDisplay!.value =
        (timeLeft!.inSeconds / 60).toString()[0].padLeft(2, '0') +
            ' : ' +
            (timeLeft!.inSeconds % 60).toString().padLeft(2, '0');
    if (timeLeft! > Duration.zero) {
      timeLeft = timeLeft! - const Duration(seconds: 1);
    }
  }

  onWelcomePageChange(int index) {
    welcomePageIndex = index;
    update(['updatePageIndexDisplay']);
  }

  onResetPinPageChange(int index) {
    resetPinPageIndex = index;
    update(['updatePageIndexDisplay']);
  }

  switchToNextPageOnAnyScreen() {
    if (welcomeFormKey.currentState!.validate()) {
      welcomePageController.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
    }
  }

  switchToNextPageOnResetPinScreen() {
    if (welcomeFormKey.currentState!.validate()) {
      resetPinPageController.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
    }
  }

  openChatScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen()));
  }

  openResetPinScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ResetPinScreen()));
  }

  differentEmail() async {
    final response = await _authentication.removeOldSession(sessionId);
    if (response.statusCode == 200) {
      sessionId = "";
      session = null;
      update(['updateChatWrapper']);
    }
  }

  logout() async {
    isLoading = true;
    update(['updateLoadingWidget']);
    final response =
        await _authentication.logoutFromSession(session!.sessionId);

    if (response.statusCode == 200) {
      isLoggedIn = false;
      session!.isActive = false;
      update(['updateChatWrapper', 'updateChatRoomActions']);
    } else {}
    isLoading = false;

    update(['updateLoadingWidget']);
  }

  Future<String> getSessionId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionId') ?? '';
  }

  setSessionId(String sessionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('sessionId', sessionId);
  }
}
