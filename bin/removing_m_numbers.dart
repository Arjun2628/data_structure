void main(List<String> args) {
  LinkedList linkedList = LinkedList();
  linkedList.add(1);
  linkedList.add(3);
  linkedList.add(3);
  linkedList.add(3);
  linkedList.add(5);
  linkedList.add(6);
  linkedList.add(6);
  linkedList.add(8);

  linkedList.deleteM();
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
    Node? temp = head;
    Node node = Node(data);
    if (temp == null) {
      head = node;
      tail = node;
    } else {
      tail?.next = node;
      tail = node;
    }
  }

  // void deleteMUltiple() {
  //   Node? current = head;

  //   while (current != null) {
  //     Node? next = current.next;
  //     while (next != null && next.data == current.data) {
  //       next = next.next;
  //     }
  //     current.next = next;
  //     if (next == tail) {
  //       tail = current;
  //     }
  //     current = next;
  //   }
  // }

  void deleteM() {
    Node? temp = head;

    while (temp != null) {
      Node? next = temp.next;
      while (next != null && next.data == temp.data) {
        next = next.next;
      }
      temp.next = next;
      if (next == tail && temp.data == next?.data) {
        tail = next;
        tail?.next = null;
      }

      temp = next;
    }
  }

  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}
