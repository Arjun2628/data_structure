void main(List<String> args) {
  StackLinkedList stack = StackLinkedList();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  // stack.display();
  stack.pop();

  stack.pop();
  stack.display();
}

class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class StackLinkedList {
  Node? top;

  void push(int data) {
    Node node = Node(data);

    if (top == null) {
      top = node;
    } else {
      node.next = top;
      top = node;
    }
  }

  void pop() {
    if (top == null) {
      print('stack underflow');
      return;
    }
    // print(top?.data);
    top = top?.next;
  }

  void display() {
    Node? temp = top;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}
