void main(List<String> args) {
  Bst tree = Bst();
  tree.insert(10);
  tree.insert(12);
  tree.insert(8);
  tree.insert(7);
  // // print(tree.contains(140));
  // tree.display();
  // tree.inorder(tree.root);
  // tree.delete(8);
  tree.remove(12);
  print(tree.contains(12));
  tree.postOrder(tree.root);
}

class Node {
  int? data;
  Node? left;
  Node? right;
  Node(this.data);
}

class Bst {
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

  bool contains(int data) {
    Node? temp = root;
    while (temp != null) {
      if (data < temp.data!) {
        temp = temp.left;
      } else if (data > temp.data!) {
        temp = temp.right;
      } else {
        return true;
      }
    }
    return false;
  }

  void delete(int data) {
    deleteHelper(data, root, null);
  }

  void deleteHelper(int data, Node? currentNode, Node? parentNode) {
    while (currentNode != null) {
      if (data > currentNode.data!) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else if (data < currentNode.data!) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else {
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = minimum(currentNode.right);
          deleteHelper(currentNode.data!, currentNode.right, currentNode);
        } else {
          if (parentNode == null) {
            if (currentNode.right == null) {
              root = currentNode.left;
            } else {
              root = currentNode.right;
            }
          } else {
            if (parentNode.left == currentNode) {
              if (currentNode.left == null) {
                parentNode.left = currentNode.right;
              } else {
                parentNode.left = currentNode.left;
              }
            } else {
              if (currentNode.left == null) {
                parentNode.right = currentNode.right;
              } else {
                parentNode.right = currentNode.left;
              }
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
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = getMIninum(currentNode.right);
          removeHelper(currentNode.data!, currentNode.right, currentNode);
        } else {
          if (parentNode == null) {
            if (currentNode.left == null) {
              root = currentNode.right;
            } else {
              root = currentNode.left;
            }
          } else {
            if (parentNode.left == currentNode) {
              if (currentNode.left == null) {
                parentNode.left = currentNode.right;
              } else {
                parentNode.left = currentNode.left;
              }
            } else {
              if (currentNode.left == null) {
                parentNode.right = currentNode.right;
              } else {
                parentNode.right = currentNode.left;
              }
            }
          }
        }
        break;
      }
    }
  }

  int getMIninum(Node? currentNode) {
    if (currentNode?.left == null) {
      return currentNode!.data!;
    } else {
      return getMIninum(currentNode?.left);
    }
  }

  void display() {
    Node? temp = root;
    while (temp?.right != null) {
      temp = temp?.right;
    }
    print(temp?.data);
  }

  // recurssive
  display1(Node? value) {
    if (value?.left == null) {
      return print(value?.data);
    }
    display1(value?.left);
  }

  inorder(Node? value) {
    if (value == null) {
      return;
    }
    inorder(value.left);
    print(value.data);
    inorder(value.right);
  }

  preOrder(Node? value) {
    if (value == null) {
      return;
    }
    print(value.data);
    inorder(value.left);
    inorder(value.right);
  }

  postOrder(Node? value) {
    if (value == null) {
      return;
    }
    inorder(value.left);
    inorder(value.right);
    print(value.data);
  }
}
