void main(List<String> args) {
  DlinkedList dlinkedList = DlinkedList();
  dlinkedList.add(1);
  dlinkedList.add(2);
  dlinkedList.add(5);
  dlinkedList.add(7);
  dlinkedList.add(9);
  dlinkedList.add(33);

  dlinkedList.insertBefore(33, 66);
  dlinkedList.display();
}

class Node {
  int? data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class DlinkedList {
  Node? head;
  Node? tail;

  void add(int data) {
    Node node = Node(data);
    Node? temp = head;
    if (temp == null) {
      head = node;
    } else {
      tail?.next = node;
      node.prev = tail;
    }
    tail = node;
  }

  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void displayReverse() {
    Node? temp = tail;
    while (temp != null) {
      print(temp.data);
      temp = temp.prev;
    }
  }

  void insert(int after, int data) {
    Node node = Node(data);
    Node? temp = head;
    while (temp != null && temp.data != after) {
      temp = temp.next;
    }

    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail?.next = node;
      tail = node;
      return;
    }
    node.next = temp.next;
    temp.next = node;
    node.prev = temp;
  }

  void insertBefore(int before, int data) {
    Node node = Node(data);
    Node? temp = head;

    while (temp != null && temp.data != before) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == head) {
      temp.prev = node;
      node.next = temp;
      head = node;

      return;
    }
    if (temp == tail) {
      tail?.prev?.next = node;
      tail?.prev = node;
      node.next = tail;
      return;
    }

    temp.prev?.next = node;
    node.next = temp;
  }

  void delete(int data) {
    Node? temp = head;
    while (temp != null && temp.data != data) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == head) {
      head = temp.next;
      temp.prev = null;
      return;
    }

    if (temp == tail) {
      tail = tail?.prev;
      tail?.next = null;
      return;
    }
    temp.prev?.next = temp.next;
    temp.next?.prev = temp.prev;
  }
}
