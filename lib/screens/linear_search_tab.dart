import 'package:flutter/material.dart';
import 'package:searching_algorithm_visualizer/models/unsorted_list_data.dart';
import 'package:searching_algorithm_visualizer/widgets/single_bar_chart.dart';

class LinearSearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UnsortedListData unsortedListData = new UnsortedListData();
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
                  // print(unsortedListData.generateUnorderedList());
                },
                color: Colors.blueAccent,
                child: Text('Generate List'),
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
            child: SingleBarChart(),
          ),
        ],
      ),
    );
  }
}
