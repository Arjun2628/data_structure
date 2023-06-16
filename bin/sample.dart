void main(List<String> args) {
  // tree.insert(15);
  // tree.insert(1);
  // tree.insert(19);
  // tree.insert(5);
  // tree.remove(1);
  List<int> array = [10, 6, 5, 12];
  Heap heap = Heap(array);
  heap.display(array);
}

class Node {
  int? data;
  Node? left;
  Node? right;

  Node(this.data);
}

class Tree {
  Node? root;

  void insert(int data) {
    Node? temp = root;
    if (temp == null) {
      Node node = Node(data);
      root = node;
    } else {
      if (data > temp.data!) {
        while (true) {
          if (temp?.right == null) {
            Node node = Node(data);
            temp?.right = node;
            break;
          } else {
            temp = temp?.right;
          }
        }
      } else {
        while (true) {
          if (temp?.left == null) {
            Node node = Node(data);
            temp?.left = node;
            break;
          } else {
            temp = temp?.left;
          }
        }
      }
    }
  }

  bool contains(int data) {
    Node? temp = root;
    while (temp != null) {
      if (data > temp.data!) {
        temp = temp.right;
      } else if (data < temp.data!) {
        temp = temp.left;
      } else {
        return true;
      }
    }
    return false;
  }

  void remove(int data) {
    removeHelper(data, root, null);
  }

  void removeHelper(int data, Node? currentNode, Node? parentNode) {
    while (currentNode != null) {
      if (data > currentNode.data!) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else if (data < currentNode.data!) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else {
        if (currentNode.data != null && currentNode.right != null) {
          currentNode.data = minimum(currentNode.right);
          removeHelper(currentNode.data!, currentNode.right, currentNode);
        } else {
          if (parentNode?.right == currentNode) {
            if (currentNode.left == null) {
              parentNode?.right = currentNode.right;
            } else {
              parentNode?.right = currentNode.left;
            }
          } else {
            if (currentNode.left == null) {
              parentNode?.left = currentNode.right;
            } else {
              parentNode?.left = currentNode.left;
            }
          }
        }
        break;
      }
    }
  }

  int minimum(Node? currentNode) {
    if (currentNode?.left == null) {
      return currentNode!.data!;
    } else {
      return minimum(currentNode?.left);
    }
  }

  preorder(Node? value) {
    if (value == null) {
      return;
    }
    preorder(value.left);
    print(value.data);
    preorder(value.right);
  }
}

// heap

class Heap {
  Heap(List<int> array) {
    buildHeap(array);
  }

  void buildHeap(List<int> array) {
    for (int i = parent(array.length - 1); i >= 0; i--) {
      shiftDown(i, array);
    }
  }

  void shiftDown(int index, List<int> array) {
    int end = array.length - 1;
    int leftIdx = left(index);
    while (leftIdx <= end) {
      int? shiftIdx;
      int rightIdx = right(index);
      if (rightIdx < end && array[rightIdx] < array[leftIdx]) {
        shiftIdx = rightIdx;
      } else {
        shiftIdx = leftIdx;
      }

      if (array[shiftIdx] < array[index]) {
        swap(array, index, shiftIdx);
        index = shiftIdx;
        leftIdx = left(index);
      } else {
        return;
      }
    }
  }

  void swap(List<int> array, int first, int second) {
    int temp = array[first];
    array[first] = array[second];
    array[second] = temp;
  }

  void display(List<int> array) {
    for (int i = 0; i <= array.length - 1; i++) {
      print(array[i]);
    }
  }

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  int left(int i) {
    return (i * 2) + 1;
  }

  int right(int i) {
    return (i * 1) + 2;
  }
}
