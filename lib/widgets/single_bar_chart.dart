import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:searching_algorithm_visualizer/models/search_algorithm.dart';
import 'package:searching_algorithm_visualizer/models/unsorted_list.dart';
import 'dart:math';

class SingleBarChart extends StatefulWidget {
  @override
  _SingleBarChart createState() => _SingleBarChart();
}

class _SingleBarChart extends State<SingleBarChart> {
  List<charts.Series<UnsortedList, String>> _seriesData;
  SearchAlgorithm searchAlgorithm = new SearchAlgorithm();
  int searchNumber;
  String searchText = 'Ready for searching';
  Color searchTextColor = Colors.black;

  List<UnsortedList> myData = [];
  Random _random = new Random();
  _addData(){
    for (int i = 0; i <= 20; i++) {
      int randomNumber = _random.nextInt(30);
      if(randomNumber != 0){
        myData.add(UnsortedList(index: i, value: randomNumber));
      }
    }

    return myData;
  }

  _initialDataGenerate() {
    _seriesData.add(
      charts.Series(
        data: _addData(),
        domainFn: (UnsortedList unsortedList, _) => '${unsortedList.index}',
        measureFn: (UnsortedList unsortedList, _) => unsortedList.value,
        colorFn: (UnsortedList unsortedList, _) => charts.ColorUtil.fromDartColor(Colors.red),
        id: 'Dummy',
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
      ),
    );
  }

  _generateData({int x = 0}) {
    int searchIndex = searchAlgorithm.linearSearch(myData, x);
    _seriesData.add(
      charts.Series(
        data: myData,
        domainFn: (UnsortedList unsortedList, _) => '${unsortedList.index}',
        measureFn: (UnsortedList unsortedList, _) => unsortedList.value,
        colorFn: (UnsortedList unsortedList, _){
          if(x !=0){
            if(searchIndex != -1 && unsortedList.index < searchIndex){
              return charts.ColorUtil.fromDartColor(Colors.blue);
            }
            if(searchIndex == unsortedList.index){
              return charts.ColorUtil.fromDartColor(Colors.green);
            }
            return charts.ColorUtil.fromDartColor(Colors.red);
          }
          return charts.ColorUtil.fromDartColor(Colors.red);

        },
        id: 'Dummy',
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
      ),
    );


    if(searchIndex == -1){
      searchText = 'No# $x is not found in the list';
      searchTextColor = Colors.red;
    }else{
      searchText = 'No# $x is found in the list';
      searchTextColor = Colors.green;
    }
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<UnsortedList, String>>();
    _initialDataGenerate();
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
                    myData.clear();
                    _initialDataGenerate();
                  });
                },
                color: Colors.blueAccent,
                child: Text('Generate List (${myData.length})'),
              ),
              SizedBox(
                width: 20.0,
              ),
              FlatButton(
                onPressed: () {
                  searchNumber = _random.nextInt(30);
                  searchText = 'Searching No# $searchNumber';
                 setState(() {
                   _seriesData = List<charts.Series<UnsortedList, String>>();
                   _generateData(x: searchNumber);
                 });
                },
                color: Colors.green[500],
                child: Text('Search randomly'),
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
                      Text(
                        searchText,
                        style: TextStyle(
                          color: searchTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: charts.BarChart(
                          _seriesData,
                          animate: true,
                          animationDuration: Duration(seconds: 5),
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
