import 'package:dailytodo/controllers/home_controller.dart';
import 'package:dailytodo/design_elements/custom_chart_card.dart';
import 'package:dailytodo/design_elements/CustomCheckBox.dart';
import 'package:dailytodo/design_elements/date_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'editing_dialog.dart';

class HomeScreen extends StatelessWidget {
  final _homeController = Get.put(TodoHomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Material(
            elevation: 2.0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              padding: const EdgeInsets.only(bottom: 16.0),
                  alignment: Alignment.bottomCenter, child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Daily Todo', style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),),
                    ],
                  ),
            ),
          ),
        ),
        body: ListView(
          controller: _homeController.scrollController,
          children: <Widget>[
            CustomChartCard(),
            DateDisplay(homeController: _homeController),
            Column(
              children: <Widget>[
                GetBuilder<TodoHomeController>(
                    id: 'tasksUpdate',
                    assignId: true,
                    builder: (_homeController) {
                      print('Tasks list rebuilt');
                      return Column(
                        children: _homeController
                            .getList()
                            .map<Widget>((dailyTaskData) => CustomCheckBox(
                                key: UniqueKey(), taskData: dailyTaskData))
                            .toList(),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.keyboard_arrow_up,
                    ),
                    onPressed: () async {
                      _homeController.scrollController.animateTo(
                        0.0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 50.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).bottomAppBarColor)),
                    child: Text(
                      'ADD NEW TASK',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          useRootNavigator: false,
                          builder: (context) {
                            return EditingDialog();
                          });
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
