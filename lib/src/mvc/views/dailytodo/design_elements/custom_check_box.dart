import 'package:asadamatic/src/mvc/views/dailytodo/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/views/dailytodo/data_model/task_data.dart';
import 'package:asadamatic/src/mvc/views/dailytodo/screens/editing_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatefulWidget {
  final TaskData? taskData;
  const CustomCheckBox({
    Key? key,
    this.taskData,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  final TodoHomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        elevation: 3.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.5),
        child: CheckboxListTile(
          checkColor: Colors.white,
          activeColor: Colors.blue,
          value: widget.taskData!.status,
          onChanged: (newValue) async {
            setState(() {
              widget.taskData!.status = newValue;
            });
            await _homeController.editTask(widget.taskData!);
          },
          controlAffinity: ListTileControlAffinity.leading,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Text(
                '${widget.taskData!.title}',
                style: TextStyle(
                    decoration: widget.taskData!.status!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )),
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  size: 21.0,
                ),
                onPressed: () async {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return EditingDialog(taskData: widget.taskData);
                      });
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 21.0,
                ),
                onPressed: () async {
                  _homeController.deleteTask(widget.taskData!);
                },
              )
            ],
          ),
        ));
  }
}
