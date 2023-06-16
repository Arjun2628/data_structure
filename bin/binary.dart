void main(List<String> args) {
  Binary binary = Binary();
  List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int result = binary.search(array, 4);
  print(result);
}

class Binary {
  int search(List array, int target) {
    int start = 0;

    int end = array.length;

    while (start <= end) {
      int middle = start + (end - start) ~/ 2;

      if (array[middle] == target) {
        return middle;
      } else if (target < array[middle]) {
        end = middle - 1;
      } else {
        start = middle + 1;
      }
    }
    return -1;
  }

  int recursion(List array, int target) {
    return binaryHelper(array, target, 0, array.length - 1);
  }

  int binaryHelper(List array, int target, int start, int end) {
    if (start > end) {
      return -1;
    }
    int middle = start + (start - end) ~/ 2;
    if (array[middle] == target) {
      return middle;
    } else if (target < array[middle]) {
      return binaryHelper(array, target, start, middle - 1);
    } else {
      return binaryHelper(array, target, middle + 1, end);
    }
  }
}
