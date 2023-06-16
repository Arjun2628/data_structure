import 'dart:convert';
import 'dart:typed_data';

/**
 * ! z condition is pending
 */
void main(List<String> args) {
  Convert convert = Convert();
  int incriment = 40;
  String ch = 'sahil';

  convert.ctr(ch, incriment);
  convert.encode(ch, 2);
  convert.decode(ch, 2);
}

class Convert {
  void ctr(String ch, int increment) {
    List num = [];
    int limit = ch.length;
    for (int i = 0; i < limit; i++) {
      int value = ch.codeUnitAt(i);

      value = value + increment % 26;

      num.add(value);
    }

    fake(num, increment);
  }

  void fake(List num, int increment) {
    String? second;
    for (int i = 0; i < num.length; i++) {
      if (second == null) {
        second = String.fromCharCode(num[i]);
      } else {
        second = "$second" + "${String.fromCharCode(num[i])}";
      }
    }

    print(second);
    decode(second, increment);
  }

  void decode(String? ch, int increment) {
    List decoded = [];
    int limit = ch!.length;

    for (int i = 0; i < limit; i++) {
      int value = ch.codeUnitAt(i);

      value = value - increment % 26;

      decoded.add(value);
    }

    original(decoded);
  }

  void original(List num) {
    String? decoded;
    for (int i = 0; i < num.length; i++) {
      if (decoded == null) {
        decoded = String.fromCharCode(num[i]);
      } else {
        decoded = '$decoded' + '${String.fromCharCode(num[i])}';
      }
    }
    print(decoded);
  }

  void encode(String ch, int increment) {
    AsciiEncoder asciiEncoder = AsciiEncoder();

    List encript = asciiEncoder.convert(ch).toList();
    print(encript);
    for (int i = 0; i < encript.length; i++) {
      encript[i] = encript[i] + increment;
    }
    print(encript);
  }

  void wrong(List encript) {
    for (int i = 0; i < encript.length; i++) {}
  }
}
