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
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    _seriesData = List<charts.Series<UnsortedList, String>>();
                    unsortedListData.clearUnsortedListData();
                    _generateData();
                  });
                },
                color: Colors.blueAccent,
                child: Text('Generate List (${unsortedListData.listLength})'),
              ),
              SizedBox(
                width: 20.0,
              ),
              FlatButton(
                onPressed: () {
                  print('Searching...');
                },
                color: Colors.green[500],
                child: Text('Search No# ${unsortedListData.searchNumber}'),
              ),
            ],
          ),
          Expanded(
            child: Padding(
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
            ),
          ),
        ],
      ),
    );
  }
}



