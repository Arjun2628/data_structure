void main(List<String> args) {
  List a = [];
  List array = [1, 2, 3, 3, 4, 5, 6, 6, 7];
  for (int i = 0; i < array.length; i++) {
    if (array[i] == array[i + 1]) {
      return;
    }
  }
  // Largest largest = Largest();
  // largest.large(array);
}

class Largest {
  void large(List array) {
    int largest = array[0];
    for (int i = 0; i < array.length; i++) {
      if (largest < array[i] && array[i] != largest) {
        largest = array[i];
      }
    }
    print(largest);
  }
}
