void main(List<String> args) {
  LinkedList linkedList = LinkedList();
  linkedList.add(10);
  linkedList.add(0);
  linkedList.add(50);
  linkedList.add(70);
  linkedList.add(15);
  linkedList.add(60);
  linkedList.display();
  print('reversed');
  linkedList.reverse();
  linkedList.display();
}

class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head;
  Node? tail;

  void add(int data) {
    Node node = Node(data);
    Node? temp = head;
    if (temp == null) {
      head = node;
      tail = node;
      return;
    }

    tail?.next = node;
    tail = node;
  }

  void reverse() {
    Node? current = head;
    Node? next;
    Node? prev;
    while (current != null) {
      next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    head = prev;
  }

  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}
