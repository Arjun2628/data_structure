void main(List<String> args) {
  int target = 6;
  List<int> first = [6, 4, 87, 1, 7, 6, 5, 9, 6];
  Common common = Common();
  common.similar(first, target);
}

class Common {
  void similar(List<int> first, int target) {
    for (int i = 0; i < first.length; i++) {
      if (first[i] == target) {
        first.add(first[i]);
        first.removeAt(i);
      }
    }
    print(first);
  }
}
