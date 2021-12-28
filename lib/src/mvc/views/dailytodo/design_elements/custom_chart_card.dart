import 'package:asadamatic/src/mvc/views/dailytodo/controllers/home_controller.dart';
import 'package:asadamatic/src/mvc/views/dailytodo/data_model/day_performance.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class CustomChartCard extends StatelessWidget {
  const CustomChartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape:
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 250.0,
            child: CustomChart(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GetBuilder<TodoHomeController>(
              builder: (_homeController) {
                return Text(
                    DateFormat('MMMM y').format(_homeController.pickedDate));
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomChart extends StatefulWidget {
  const CustomChart({Key? key}) : super(key: key);

  @override
  _CustomChartState createState() => _CustomChartState();
}

class _CustomChartState extends State<CustomChart> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoHomeController>(
        id: 'chartUpdate',
        assignId: true,
        builder: (_homeController) {
          List<Series<DayPerformance, String>> series = [
            Series(
                id: 'Performance',
                data: _homeController.dayPerformance,
                domainFn: (DayPerformance dayPerformance, _) =>
                    dayPerformance.day.toString(),
                measureFn: (DayPerformance dayPerformance, _) =>
                    dayPerformance.getPercentage()),
          ];
          return BarChart(
            series,
            animate: true,
            primaryMeasureAxis: const NumericAxisSpec(
              renderSpec: NoneRenderSpec(),
            ),
            domainAxis: OrdinalAxisSpec(
              renderSpec: const NoneRenderSpec(),
              showAxisLine: true,
              viewport: OrdinalViewport('AePS', 31),
            ),
            behaviors: [
              SeriesLegend(),
            ],
          );
        });
  }
}
