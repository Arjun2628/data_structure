import 'dart:collection';

void main(List<String> args) {
  List<int> array = [6, 4, 1, 8, 10];
  MinHeap heap = MinHeap.second(array);
  // heap.insert(19, array);
  // heap.insert(6, array);
  // heap.insert(1, array);
  // heap.insert(16, array);
  // heap.insert(2, array);
  heap.remove(array);
  heap.remove(array);
  heap.display(array);
}

class MinHeap {
  MinHeap.first();

  MinHeap.second(List<int> array) {
    buldHeap(array);
  }

  void buldHeap(List<int> array) {
    for (int i = parent(array.length - 1); i >= 0; i--) {
      shiftDown(i, array);
    }
  }

  void shiftDown(int index, List<int> array) {
    int endIdx = array.length - 1;
    int leftIdx = leftChild(index);
    while (leftIdx <= endIdx) {
      int? shiftIdx;
      int rightIdx = rightChild(index);
      if (rightIdx <= endIdx && array[rightIdx] > array[leftIdx]) {
        shiftIdx = rightIdx;
      } else {
        shiftIdx = leftIdx;
      }
      if (array[shiftIdx] > array[index]) {
        swap(array, index, shiftIdx);
        index = shiftIdx;
        leftIdx = leftChild(index);
      } else {
        return;
      }
    }
  }

  void shiftDown2(int index, List<int> array) {
    int endIdx = array.length - 1;
    int leftIdx = leftChild(index);
    while (leftIdx <= endIdx) {
      int? shiftIdx;
      int rightIdx = rightChild(index);
      if (rightIdx < endIdx && array[rightIdx] < array[leftIdx]) {
        shiftIdx = rightIdx;
      } else {
        shiftIdx = leftIdx;
      }
      if (array[shiftIdx] < array[index]) {
        swap(array, index, shiftIdx);
        index = shiftIdx;
        leftIdx = leftChild(index);
      } else {
        return;
      }
    }
  }

  void shiftUp(List<int> array, int index) {
    int parentidx = parent(index);
    while (index > 0 && array[parentidx] < array[index]) {
      swap(array, index, parentidx);
      index = parentidx;
      parentidx = parent(index);
    }
  }

  void shiftUp2(List<int> array, int index) {
    int parentidx = parent(index);
    while (index > 0 && array[parentidx] > array[index]) {
      swap(array, index, parentidx);
      index = parentidx;
      parentidx = parent(index);
    }
  }

  int peek(List<int> array) {
    return array[0];
  }

  void remove(List<int> array) {
    swap(array, 0, array.length - 1);
    array.removeAt(array.length - 1);
    shiftDown(0, array);
  }

  void insert(int value, List<int> array) {
    array.add(value);
    shiftUp(array, array.length - 1);
  }

  void display(List<int> array) {
    for (int i = 0; i < array.length; i++) {
      print(array[i]);
    }
  }

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  int leftChild(int i) {
    return (i * 2) + 1;
  }

  int rightChild(int i) {
    return (i * 2) + 2;
  }

  void swap(List<int> array, int first, int second) {
    int temp = array[first];
    array[first] = array[second];
    array[second] = temp;
  }
}
