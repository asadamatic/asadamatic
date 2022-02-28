import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({Key? key, int? noOfFields})
      : _noOfFields = noOfFields,
        super(key: key);

  final int? _noOfFields;
  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> _codeEditingControllers =
        List.generate(_noOfFields!, (index) => TextEditingController());
    final List<String> _values = List.generate(_noOfFields!, (index) => '');
    final List<FocusNode> _focusNode =
        List.generate(_noOfFields!, (index) => FocusNode());
    final List<FocusNode> _focusNodeKeyboard =
        List.generate(6, (index) => FocusNode());
    final ChatController _chatController = Get.find();
    return SizedBox(
        width: 300.0,
        child: Row(
            children: _codeEditingControllers.asMap().entries.map((entry) {
          final index = entry.key;
          final value = entry.value;

          return Flexible(
              child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: RawKeyboardListener(
              focusNode: _focusNodeKeyboard[index],
              onKey: (event) {
                if (event.isKeyPressed(LogicalKeyboardKey.backspace)) {
                  if (index != 0) {
                    if (_values[index].isEmpty) {
                      _focusNode[index].previousFocus();
                      _focusNodeKeyboard[index].previousFocus();
                    }
                  }
                } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
                  if (index != _noOfFields) {
                    _focusNode[index].nextFocus();
                    _focusNodeKeyboard[index].nextFocus();
                  }
                } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
                  if (index != 0) {
                    _focusNode[index].previousFocus();
                    _focusNodeKeyboard[index].previousFocus();
                  }
                }
              },
              child: SizedBox(
                height: 80.0,
                child: GetBuilder<ChatController>(
                    id: 'updateLoadingWidget',
                    builder: (_chatController) => TextFormField(
                          enabled: !_chatController.isLoading!,
                          controller: value,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value!.isEmpty ? '' : null,
                          onChanged: (value) {
                            if (_noOfFields == 6) {
                              _chatController.verificationCode!.code =
                                  getCode(_codeEditingControllers);
                            } else if (_noOfFields == 4) {
                              _chatController.pin =
                                  getCode(_codeEditingControllers);
                            }

                            if (index == 0) {
                              if (value.isNotEmpty) {
                                _focusNodeKeyboard[index].nextFocus();
                                _focusNode[index].nextFocus();
                              }
                            } else if (index == _noOfFields! - 1) {
                              if (value.isNotEmpty) {
                                _values[index] = value;
                              } else {
                                if (_values[index].isNotEmpty) {
                                  _values[index] = '';
                                }
                              }
                            } else {
                              if (value.isNotEmpty) {
                                _focusNodeKeyboard[index].nextFocus();
                                _focusNode[index].nextFocus();
                                _values[index] = value;
                              } else {
                                if (_values[index].isNotEmpty) {
                                  _values[index] = '';
                                }
                              }
                            }
                          },
                          onTap: () {
                            _codeEditingControllers[index].selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: _codeEditingControllers[index]
                                        .text
                                        .length));
                          },
                          focusNode: _focusNode[index],
                          style: Theme.of(context).textTheme.headline6,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            errorStyle: TextStyle(height: 0.0, fontSize: 0.0),
                            border: OutlineInputBorder(),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                        )),
              ),
            ),
          ));
        }).toList()));
  }

  getCode(List<TextEditingController> codeEditingControllers) {
    String code = '';
    for (int index = 0; index < codeEditingControllers.length; index++) {
      code = code + codeEditingControllers[index].text;
    }

    return int.parse(code);
  }
}
