import 'package:flutter/material.dart';
import 'package:searching_algorithm_visualizer/screens/linear_search_tab.dart';

class HomeScreen extends StatelessWidget {
  static const nameRoute = 'home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Searching Algorithm Visualizer'),
          leading: Icon(Icons.graphic_eq),
          bottom: TabBar(
            indicatorColor: Colors.yellowAccent,
            tabs: [
              Tab(
                text: 'Linear Search',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LinearSearchTab(),
          ],
        ),
      ),
    );
  }
}
