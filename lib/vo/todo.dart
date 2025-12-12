class Todo {
  int id;
  String title;
  bool completed;
  int userId;

  //named constructor
  Todo({this.id = 0, this.title = '', this.completed = false, this.userId = 0});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }
}
