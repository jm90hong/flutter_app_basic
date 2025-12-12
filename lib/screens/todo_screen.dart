import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_app1/vo/todo.dart';
import 'package:provider/provider.dart';
import 'package:my_app1/providers/todo_provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextStyle textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).fetchTodo(2);
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Todo')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Todo', style: textStyle),
            Text('id: ${todoProvider.todo?.id}', style: textStyle),
            Text('title: ${todoProvider.todo?.title}', style: textStyle),
            Text(
              'completed: ${todoProvider.todo?.completed.toString()}',
              style: textStyle,
            ),
            Text('userId: ${todoProvider.todo?.userId}', style: textStyle),
          ],
        ),
      ),
    );
  }
}
