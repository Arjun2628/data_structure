void main(List<String> args) {
  QueueLInkedList queue = QueueLInkedList();
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  queue.enqueue(4);
  queue.dequeue();
  queue.dequeue();

  queue.display();
}

class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class QueueLInkedList {
  Node? front;
  Node? rear;

  void enqueue(int data) {
    Node node = Node(data);
    if (rear == null) {
      front = node;
      rear = node;
      return;
    }

    rear?.next = node;
    rear = node;
  }

  void dequeue() {
    if (front == null) {
      print('no data');
      rear = null;
      return;
    }
    front = front?.next;
  }

  void display() {
    Node? temp = front;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}
