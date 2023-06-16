void main(List<String> args) {}

class Graph {
  Map<int, List<int>>? map;
  Graph() {
    map = {};
  }

  Map<int, List<int>> helperList = {};

  void insert(int vertex, int edge, bool isBydirectional) {
    if (!map!.containsKey(vertex)) {}
  }

  void addElement(int vertex) {
    if (!helperList.containsKey(vertex)) {
      helperList[vertex] = [];
    }
  }
}
