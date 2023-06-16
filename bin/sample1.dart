void main(List<String> args) {
  List<String> a = ["5", "2", "c", "d", "+"];

  List<dynamic> newArray = [];

  for (int i = 0; i < a.length; i++) {
    if (a[i] == "c") {
      newArray.removeAt(newArray.length - 1);
    } else if (a[i] == "d") {
      int num = newArray[newArray.length - 1];
      int element = num * 2;
      newArray.add(element);
    } else if (a[i] == "+") {
      int sum = 0;
      for (int j = 0; j < newArray.length; j++) {
        int last = newArray[j];
        sum = sum + last;
      }
      newArray.add(sum);
    } else {
      int value = int.parse(a[i]);
      newArray.add(value);
    }
  }
  print(newArray);
}
