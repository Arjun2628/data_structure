void main(List<String> args) {
  Factorial factorial = Factorial();
  int a = factorial.fact(5);
  print(a);
}

class Factorial {
  int fact(int data) {
    if (data <= 1) {
      return 1;
    }
    return data + fact(data - 1);
  }

  void even(int data) {
    if (data <= 1) {
      return;
    }

    even(data - 1);
    print(data);
    even(data - 1);
  }
}
