import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_app1/vo/todo.dart';

class TodoProvider extends ChangeNotifier {
  Todo? todo;
  List<Todo> todoList = [];

  Future<void> fetchTodo(int id) async {
    todo = null;
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
    );
    var data = jsonDecode(response.body);
    todo = Todo.fromJson(data);
    notifyListeners();
  }

  Future<void> fetchTodoList() async {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    var data = jsonDecode(response.body) as List<dynamic>;
    todoList = data.map((todo) => Todo.fromJson(todo)).toList();
    notifyListeners();
  }
}
