import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:searching_algorithm_visualizer/models/unsorted_list.dart';
import 'package:searching_algorithm_visualizer/models/unsorted_list_data.dart';

class SingleBarChart extends StatefulWidget {
  @override
  _SingleBarChart createState() => _SingleBarChart();
}

class _SingleBarChart extends State<SingleBarChart> {
  List<charts.Series<UnsortedList, String>> _seriesData;

  UnsortedListData unsortedListData = new UnsortedListData();
  _generateData() {
    // var data1 = [
    //   UnsortedList(number: 54),
    //   UnsortedList(number: 20),
    //   UnsortedList(number: 31),
    // ];

    _seriesData.add(
          charts.Series(
            data: unsortedListData.getUnsortedListData,
            domainFn: (UnsortedList unsortedList, _) => '${unsortedList.number}',
            measureFn: (UnsortedList unsortedList, _) => unsortedList.number,
            colorFn: (UnsortedList unsortedList, _) =>
                charts.ColorUtil.fromDartColor(Colors.red),
            id: 'Numbers',
            fillPatternFn: (_, __) => charts.FillPatternType.solid,
          ),
        );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<UnsortedList, String>>();
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
                'Unsorted List',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: charts.BarChart(
                  _seriesData,
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                  barGroupingType: charts.BarGroupingType.grouped,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



