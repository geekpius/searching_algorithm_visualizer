import 'package:searching_algorithm_visualizer/models/unsorted_list.dart';

class SearchAlgorithm{


  int linearSearch(List<UnsortedList> arr, int key){
    for(int i=0; i<arr.length; i++){
      if (key == arr[i].value){
        return arr[i].index;
      }
    }
    return -1;
  }



  void binarySearch(List arr, int low, int high, int key){
    int mid = (low+high) ~/ 2;
    if (key == arr[mid]){
      print('Found');
    }

    if (key < arr[mid]){
      binarySearch(arr, low, mid-1, key);
    }

    if (key > arr[mid]){
      binarySearch(arr, mid+1, high, key);
    }
    print('Not Found');
  }


}