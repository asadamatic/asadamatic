import 'package:asadamatic/src/mvc/views/dailytodo/data_model/day_performance.dart';
import 'package:asadamatic/src/mvc/views/dailytodo/data_model/task_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TodoHomeController extends GetxController {
  DateTime pickedDate = DateTime.now();
  ScrollController scrollController = ScrollController();
  List<TaskData> tasks = [];
  List<DayPerformance> dayPerformance = <DayPerformance>[];
  @override
  void onInit() async {
    await updateDataForGraph();
    update();
    super.onInit();
  }

  selectDate(context) async {
    pickedDate = await showDialog(
            context: context,
            useRootNavigator: false,
            builder: (buildContext) => DatePickerDialog(
                firstDate: DateTime(2000, 1, 1),
                lastDate: DateTime(2030, 1, 1),
                initialDate: pickedDate)) ??
        pickedDate;
    await updateDataForGraph();
    update(['tasksUpdate', 'chartUpdate', 'dateUpdate']);
  }

  List<TaskData> getList() {
    return tasks
        .where((taskData) =>
            taskData.date == DateFormat('d/M/y').format(pickedDate))
        .toList();
  }

  addTask(TaskData taskData) async {
    tasks.add(taskData);
    await updateDataForGraph();
    update(['tasksUpdate', 'chartUpdate']);
  }

  editTask(TaskData editiedTaskData) async {
    tasks[tasks.indexWhere((taskData) => taskData.id == editiedTaskData.id)] =
        editiedTaskData;
    await updateDataForGraph();
    update(['tasksUpdate', 'chartUpdate']);
  }

  deleteTask(TaskData taskData) async {
    tasks.remove(taskData);
    await updateDataForGraph();
    update(['tasksUpdate', 'chartUpdate']);
  }

  List<TaskData> getListNew(String date) {
    return tasks.where((taskData) => taskData.date! == date).toList();
  }

  updateDataForGraph() async {
    String monthYear = DateFormat('M/y').format(pickedDate);

    for (int day = 1;
        day <= daysInMonth(pickedDate.year, pickedDate.month);
        day++) {
      int total = getListNew('$day/$monthYear').length;

      int done = getListNew('$day/$monthYear')
          .where((taskData) => taskData.status == true)
          .length;
      dayPerformance.add(DayPerformance(
        day: day,
        total: total,
        done: done,
      ));
    }
  }

  final List _daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  bool isLeapYear(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  int daysInMonth(int year, int month) =>
      (month == DateTime.february && isLeapYear(year))
          ? 29
          : _daysInMonth[month - 1];
}
