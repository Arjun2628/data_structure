import 'dart:convert';

void main(List<String> args) {
  HashFunction hashFunction = HashFunction();
  hashFunction.add(20, 'arjun');
  hashFunction.add(10, 'sahil');
  hashFunction.retrive('sahil');
}

class HashFunction {
  List<int> array = List.generate(5, (index) => 0);
  List values = [];
  void add(int data, String key) {
    AsciiEncoder asciiEncoder = AsciiEncoder();

    List<int> num = asciiEncoder.convert(key).toList();
    int sum = 0;
    for (int i = 0; i < num.length; i++) {
      sum = sum + num[i];
    }
    int position = sum % array.length;
    array[position] = data;
  }

  void retrive(String key) {
    AsciiEncoder asciiEncoder = AsciiEncoder();
    List<int> num = asciiEncoder.convert(key).toList();
    int sum = 0;
    for (int i = 0; i < num.length; i++) {
      sum = sum + num[i];
    }
    int position = sum % array.length;
    print(array[position]);
  }
}
