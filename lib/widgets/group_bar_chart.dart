import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart extends StatefulWidget {
  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  List<charts.Series<Pollution, String>> _seriesData;

  _generateData() {
    var data1 = [
      Pollution(place: 'USA', year: 1980, quantity: 30),
      Pollution(place: 'Asia', year: 1980, quantity: 40),
      Pollution(place: 'Europe', year: 1980, quantity: 10),
    ];

    var data2 = [
      Pollution(place: 'USA', year: 1985, quantity: 100),
      Pollution(place: 'Asia', year: 1980, quantity: 150),
      Pollution(place: 'Europe', year: 1985, quantity: 80),
    ];

    var data3 = [
      Pollution(place: 'USA', year: 1985, quantity: 200),
      Pollution(place: 'Asia', year: 1980, quantity: 300),
      Pollution(place: 'Europe', year: 1985, quantity: 180),
    ];

    _seriesData.add(
      charts.Series(
        data: data1,
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        colorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.red),
        id: '2017',
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
      ),
    );

    _seriesData.add(
      charts.Series(
        data: data2,
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        colorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.green),
        id: '2018',
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
      ),
    );

    _seriesData.add(
      charts.Series(
        data: data3,
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        colorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Colors.purple),
        id: '2019',
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
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
                'Pollution Report',
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
                  behaviors: [
                    charts.SeriesLegend(
                      outsideJustification:
                          charts.OutsideJustification.endDrawArea,
                      horizontalFirst: false,
                      desiredMaxRows: 1,
                      cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
                      entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.purple.shadeDefault,
                        fontFamily: 'Georgia',
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution({this.place, this.year, this.quantity});
}
