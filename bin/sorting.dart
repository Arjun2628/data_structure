void main(List<String> args) {
  List<int> array = [1, 10, 3, 76, 0, 67, 54, 9, 20];
  Sorting sorting = Sorting();
  List<int> result = sorting.insertionSort(array);
  print(result);
  List<int> result1 = sorting.bubleSort(array);
  print(result);
  List<int> result2 = sorting.selectionSort(array);
  print(result);
  List<int> result3 = sorting.quickSort(array);
  print(result);
  List<int> result4 = sorting.mergeSort(array);
  print(result);
}

class Sorting {
  // insertion sort
  List<int> insertionSort(List<int> array) {
    for (int i = 1; i <= array.length - 1; i++) {
      int current = array[i];

      int j = i - 1;
      while (j >= 0 && array[j] > current) {
        array[j + 1] = array[j];
        j--;
      }
      array[j + 1] = current;
    }
    return array;
  }

  // buble sort
  List<int> bubleSort(List<int> array) {
    for (int i = 0; i < array.length - 1; i++) {
      for (int j = 0; j < array.length - 1; j++) {
        if (array[j] > array[j + 1]) {
          int temp = array[j + 1];
          array[j + 1] = array[j];
          array[j] = temp;
        }
      }
    }
    return array;
  }

  // selection sort
  List<int> selectionSort(List<int> array) {
    for (int i = 0; i < array.length - 1; i++) {
      int smallest = i;
      for (int j = i + 1; j < array.length; j++) {
        if (array[j] < array[smallest]) {
          smallest = j;
        }
      }
      int temp = array[smallest];
      array[smallest] = array[i];
      array[i] = temp;
    }
    return array;
  }

  // quick sort
  List<int> quickSort(List<int> array) {
    return QuickHelper(array, 0, array.length - 1);
  }

  List<int> QuickHelper(List<int> array, int start, int end) {
    if (start < end) {
      int pi = partition(array, start, end);
      QuickHelper(array, pi + 1, end);
      QuickHelper(array, start, pi - 1);
    }
    return array;
  }

  partition(List<int> array, int start, int end) {
    int pivot = array[end];
    int i = start - 1;
    if (array.isEmpty) {
      return 0;
    }
    for (int j = start; j < end; j++) {
      if (array[j] < pivot) {
        i++;
        swap(array, i, j);
      }
    }
    swap(array, i + 1, end);
    return i + 1;
  }

  // merge sort

  void swap(List<int> array, int first, int second) {
    int temp = array[first];
    array[first] = array[second];
    array[second] = temp;
  }

  List<int> mergeSort(List<int> array) {
    if (array.length <= 1) {
      return array;
    }
    int middle = array.length ~/ 2;
    List<int> first = array.sublist(0, middle);
    List<int> last = array.sublist(middle);

    return merge(mergeSort(first), mergeSort(last));
  }

  List<int> merge(List<int> first, List<int> last) {
    List<int> sorted = [];
    int i = 0;
    int j = 0;
    while (i < first.length && j < last.length) {
      if (first[i] < last[j]) {
        sorted.add(first[i++]);
      } else {
        sorted.add(last[j++]);
      }
    }
    while (i < first.length) {
      sorted.add(first[i++]);
    }
    while (j < last.length) {
      sorted.add(last[j++]);
    }

    return sorted;
  }
}
