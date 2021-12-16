class TaskData {
  String? id = DateTime.now().toString();
  String? title;
  bool? status;
  String? date;

  TaskData({this.title, this.status, this.date});
}

