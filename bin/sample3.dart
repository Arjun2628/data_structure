void main(List<String> args) {
  BinarySearch binarySearch = BinarySearch();
  binarySearch.insert(10);
  binarySearch.insert(1);
  binarySearch.insert(5);
  binarySearch.insert(15);
  binarySearch.preOrder(binarySearch.root);
}

class Node {
  int? data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BinarySearch {
  Node? root;

  void insert(int data) {
    Node? temp = root;

    if (temp == null) {
      Node node = Node(data);
      root = node;
    } else {
      if (data < temp.data!) {
        while (true) {
          if (temp?.left == null) {
            Node node = Node(data);
            temp?.left = node;
            break;
          } else {
            temp = temp?.left;
          }
        }
      } else {
        while (true) {
          if (temp?.right == null) {
            Node node = Node(data);
            temp?.right = node;
            break;
          } else {
            temp = temp?.right;
          }
        }
      }
    }
  }

  void remove(int data) {
    delete(data, root, null);
  }

  void delete(int data, Node? currentNode, Node? parentNode) {
    Node? temp = root;
    while (temp != null) {
      if (data > temp.data!) {
        temp = temp.right;
      } else if (data < temp.data!) {
        temp = temp.left;
      } else {
        if (currentNode?.left != null && currentNode?.right != null) {
        } else {
          if (parentNode?.left == currentNode) {
            if (currentNode?.left == null) {
              parentNode?.left = currentNode?.right;
            } else {
              parentNode?.left = currentNode?.left;
            }
          } else {
            if (currentNode?.left == null) {
              parentNode?.right = currentNode?.right;
            } else {
              parentNode?.right = currentNode?.left;
            }
          }
        }

        break;
      }
    }
  }

  preOrder(Node? value) {
    if (value == null) {
      return;
    }

    print(value.data);
    preOrder(value.left);
    preOrder(value.right);
  }
}
