//singly linkedlist
import 'dart:io';

void main(List<String> arguments) {
  LinkedList linkedList = LinkedList();

  print('enter limit');
  int limit = int.parse(stdin.readLineSync()!);
  print('enter numbers');
  for (int i = 0; i < limit; i++) {
    linkedList.add(int.parse(stdin.readLineSync()!));
  }
  print('the numbers are ,');
  linkedList.display();

  /**
   * !insert
  print('inserrted');
  linkedList.insert(20, 55);
  linkedList.display();

   * !delete
   print('deleted');  
  linkedList.delete(10);
  linkedList.display();
   */
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

  void delete(int data) {
    Node? temp = head;
    Node? prev;
    if (temp?.data != null && temp?.data == data) {
      head = temp?.next;
    }

    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }
    if (temp?.data == null) {
      return;
    }
    if (temp == tail) {
      tail = prev;
      tail?.next = null;
      return;
    }
    prev?.next = temp?.next;
  }

  void insert(int after, int data) {
    Node? newnode = Node(data);
    Node? temp = head;
    while (temp != null && temp.data != after) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail?.next = newnode;
      tail = newnode;
      return;
    }

    newnode.next = temp.next;
    temp.next = newnode;
  }

  void display() {
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}
