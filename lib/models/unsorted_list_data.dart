import 'dart:math';
import 'package:searching_algorithm_visualizer/models/unsorted_list.dart';

class UnsortedListData {
  Random random = new Random();
  List<UnsortedList> _unsortedList = [];

  List<UnsortedList> get getUnsortedListData {
    for (int i = 1; i <= 50; i++) {
      int randomNumber = random.nextInt(50);
      if (randomNumber != 0) {
        _unsortedList.add(UnsortedList(number: randomNumber));
      }
    }
    return _unsortedList;
  }

  int get searchNumber {
    int randomNumber = random.nextInt(50);
    if (randomNumber != 0) {
      return randomNumber;
    }
    return 1;
  }
}
