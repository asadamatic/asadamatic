import 'package:asadamatic/main.dart';
import 'package:asadamatic/src/mvc/views/dailytodo/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/views/dailytodo/data_model/task_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditingDialog extends StatefulWidget {
  final TaskData? taskData;
  const EditingDialog({Key? key, this.taskData}) : super(key: key);

  @override
  _EditingDialogState createState() => _EditingDialogState();
}

class _EditingDialogState extends State<EditingDialog> {
  final TodoHomeController _homeController = Get.find();
  //Task editing controller
  final taskController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void edit() async {
    widget.taskData!.title = taskController.text;
    _homeController.editTask(widget.taskData!);
    Navigator.of(context).pop();
  }

  void add() async {
    TaskData newTaskData = TaskData(
        title: taskController.text,
        date: DateFormat('d/M/y').format(_homeController.pickedDate),
        status: false);
    await _homeController.addTask(newTaskData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    taskController.text =
        widget.taskData == null ? '' : widget.taskData!.title!;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.taskData == null ? 'New Task' : 'Edit Task',
                style: const TextStyle(fontSize: 18.0)),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: taskController,
                autofocus: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Title is required!";
                  }
                  return null;
                },
                cursorColor: Colors.blue[400],
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusColor: Colors.blue[400],
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue[400]!,
                  )),
                  hintText: 'Task Name',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Expanded(
                  flex: 5,
                  child:
                      GetBuilder<ThemeController>(builder: (_homeController) {
                    final darkTheme =
                        _homeController.themeMode == ThemeMode.dark;
                    return TextButton(
                      child: const Text(
                        'Cancel',
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        foregroundColor: darkTheme
                            ? MaterialStateProperty.all(Colors.white)
                            : MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    );
                  }),
                ),
                const Spacer(),
                Expanded(
                  flex: 5,
                  child: TextButton(
                      child: Text(
                        widget.taskData == null ? 'Add' : 'Update',
                      ),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (widget.taskData == null) {
                            add();
                          } else {
                            edit();
                          }
                        }
                      }),
                ),
                const Spacer()
              ],
            ),
          )
        ],
      ),
    );
  }
}
