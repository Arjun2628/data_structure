void main(List<String> args) {
  Trie trie = Trie('arjun');
  trie.populateSuffixTrie('arjun');
  print(trie.contains('arjun'));
}

class Node {
  Map<String, Node> hashmap = {};
}

class Trie {
  Node? root = Node();
  String end = '*';

  Trie(String str) {
    populateSuffixTrie(str);
  }

  void populateSuffixTrie(String str) {
    for (int i = 0; i < str.length; i++) {
      insertSubStringStartingAt(i, str);
    }
  }

  void insertSubStringStartingAt(int index, String str) {
    Node temp = Node();
    for (int i = index; i < str.length; i++) {
      String charector = str[i];
      if (!temp.hashmap.containsKey(charector)) {
        Node newNode = Node();
        temp.hashmap[charector] = newNode;
      }
      temp.hashmap[charector]!;
    }
    temp.hashmap[end];
  }

  bool? contains(String str) {
    Node? temp = Node();
    for (int i = 0; i < str.length; i++) {
      String letter = str[i];
      if (!temp!.hashmap.containsKey(letter)) {
        return false;
      }
      temp = temp.hashmap[letter];
    }
    return temp?.hashmap.containsKey(end);
  }
}
