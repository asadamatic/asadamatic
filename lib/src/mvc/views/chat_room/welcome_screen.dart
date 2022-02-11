import 'package:asadamatic/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/widgets/pic_code_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChatRoomWelcome extends StatelessWidget {
  ChatRoomWelcome({Key? key}) : super(key: key);

  final ChatController _chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: GetBuilder<ChatController>(
                id: 'changeVerificationScreen',
                builder: (_chatController) => PageIndexIndicator(
                      pageCount: _chatController.userExists! ? 2 : 4,
                    )),
          ),
          Form(
            key: _chatController.visitorFormKey,
            child: PageView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: _chatController.welcomePageController,
              onPageChanged: _chatController.onWelcomePageChange,
              children: [
                EmailScreen(),
                GetBuilder<ChatController>(
                    id: 'changeVerificationScreen',
                    builder: (_chatController) => _chatController.userExists!
                        ? PinCodeScreen(
                            authType: AuthType.signIn,
                          )
                        : VerificationCodeScreen()),
                PinCodeScreen(
                  authType: AuthType.signUp,
                ),
                UserNameScreen(),
              ],
            ),
          ),
          GetBuilder<ChatController>(
              id: 'updateLoadingWidget',
              builder: (_chatController) => Container(
                  color: Colors.white54,
                  child: _chatController.isLoading!
                      ? const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox()))
        ],
      ),
    );
  }
}

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

class UserNameScreen extends StatelessWidget {
  UserNameScreen({
    Key? key,
  }) : super(key: key);
  final ChatController _chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's Your Name ?",
                style: textTheme.headline5,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Help improves chat experience.',
                style: textTheme.subtitle1,
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                validator: _chatController.nameValidator,
                controller: _chatController.nameEditingController,
                onChanged: _chatController.onNameChanged,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Asad Hameed'),
              ),
            ],
          ),
          Container(
            width: 200.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0))),
                    textStyle: MaterialStateProperty.all(textTheme.subtitle1)),
                onPressed: () => _chatController.updateUserData(context),
                child: const Text('Proceed')),
          )
        ],
      ),
    );
  }
}

class EmailScreen extends StatelessWidget {
  EmailScreen({
    Key? key,
  }) : super(key: key);

  final ChatController _chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 300.0,
      margin: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //height: 24.0
              Text(
                "What's Your Email ?",
                style: textTheme.headline5,
              ),
              const SizedBox(
                height: 15.0,
              ),
              //height: 16.0
              Text(
                'We need to verify your identity.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 15.0,
              ),
              //height: 60.0
              TextFormField(
                validator: _chatController.emailValidator,
                controller: _chatController.emailEditingController,
                onChanged: _chatController.onEmailChanged,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp('[ ]')),
                ],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'example@gmail.com'),
              ),
            ],
          ),
          Container(
            width: 200.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0))),
                    textStyle: MaterialStateProperty.all(textTheme.subtitle1)),
                onPressed: () => _chatController.processVisitorData(context),
                child: const Text('Proceed')),
          )
        ],
      ),
    );
  }
}

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({Key? key}) : super(key: key);

  final ChatController _chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Verification code expires in 3 minutes',
                    style: textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Obx(() => Text(
                      _chatController.timeDisplay!.value,
                      style: textTheme.headline6,
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                    width: 300.0,
                    child: PinCodeField(
                      noOfFields: 6,
                    )),
                GetBuilder<ChatController>(
                    id: 'updateResendButton',
                    builder: (_chatController) =>
                        _chatController.timeLeft == Duration.zero
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  child: const Text('Resend code'),
                                  onTap: () {},
                                ),
                              )
                            : const SizedBox(
                                height: 16.0,
                              ))
              ],
            ),
            Container(
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                      textStyle:
                          MaterialStateProperty.all(textTheme.subtitle1)),
                  onPressed: _chatController.verifyCode,
                  child: const Text('Submit')),
            )
          ],
        ));
  }
}

class PinCodeScreen extends StatelessWidget {
  PinCodeScreen({Key? key, AuthType? authType})
      : _authType = authType,
        super(key: key);

  final AuthType? _authType;
  final ChatController _chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final signingUp = _authType == AuthType.signUp;
    return Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  signingUp ? 'Choose a 4 digit pin!' : 'Enter your pin',
                  style: textTheme.headline5,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                signingUp
                    ? Text(
                        'To avoid verification next time.',
                        style: textTheme.subtitle1,
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 15.0,
                ),
                const SizedBox(
                    width: 200.0,
                    child: PinCodeField(
                      noOfFields: 4,
                    )),
                const SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  child: const Text('Reset Pin'),
                  onTap: () {},
                )
              ],
            ),
            Container(
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                      textStyle:
                          MaterialStateProperty.all(textTheme.subtitle1)),
                  onPressed: () => signingUp
                      ? _chatController.switchToNextPage()
                      : _chatController.verifyPin(context),
                  child: const Text('Submit')),
            )
          ],
        ));
  }
}

enum AuthType { signIn, signUp, resetPin }
