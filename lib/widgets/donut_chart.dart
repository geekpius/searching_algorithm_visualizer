import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DonutChart extends StatefulWidget {
  @override
  _DonutChartState createState() => _DonutChartState();
}

class _DonutChartState extends State<DonutChart> {
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {
    var pieData = [
      Task(task: 'Work', taskValue: 20, color: Colors.red),
      Task(task: 'Eat', taskValue: 15, color: Colors.green),
      Task(task: 'Idle', taskValue: 10, color: Colors.purple),
    ];

    _seriesPieData.add(
      charts.Series(
          data: pieData,
          domainFn: (Task task, _) => task.task,
          measureFn: (Task task, _) => task.taskValue,
          colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.color),
          id: 'Daily Task',
          labelAccessorFn: (Task row, _) => '${row.taskValue}'),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _generateData();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: [
              Text(
                'Time spent on daily tasks',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: charts.PieChart(
                  _seriesPieData,
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                  behaviors: [
                    charts.DatumLegend(
                      outsideJustification: charts.OutsideJustification.endDrawArea,
                      horizontalFirst: false,
                      desiredMaxRows: 3,
                      cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
                      entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.purple.shadeDefault,
                        fontFamily: 'Georgia',
                        fontSize: 11,
                      ),
                    ),
                  ],
                  defaultRenderer: charts.ArcRendererConfig(
                    arcWidth: 100,
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(labelPosition: charts.ArcLabelPosition.inside),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task {
  String task;
  double taskValue;
  Color color;

  Task({this.task, this.taskValue, this.color});
}
