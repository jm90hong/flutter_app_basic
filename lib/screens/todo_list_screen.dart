import 'package:flutter/material.dart';
import 'package:my_app1/screens/todo_screen.dart';
import 'package:my_app1/vo/todo.dart';
import 'package:provider/provider.dart';
import 'package:my_app1/providers/todo_provider.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).fetchTodoList();
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Color(0xFFEEEEEE), height: 1),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFF5F5F5),
        child: todoProvider.todoList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 64,
                      color: Color(0xFFBDBDBD),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '할 일이 없습니다',
                      style: TextStyle(fontSize: 16, color: Color(0xFF757575)),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: todoProvider.todoList.length,
                itemBuilder: (context, index) {
                  return TodoListItem(todo: todoProvider.todoList[index]);
                },
              ),
      ),
    );
  }
}

class TodoListItem extends StatelessWidget {
  final Todo todo;

  TodoListItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TodoScreen(id: todo.id)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // 체크박스
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: todo.completed ? Color(0xFFFF6F0F) : Color(0xFFE0E0E0),
                  width: 2,
                ),
                color: todo.completed ? Color(0xFFFF6F0F) : Colors.white,
              ),
              child: todo.completed
                  ? Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            SizedBox(width: 16),
            // 텍스트 영역
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: todo.completed
                          ? Color(0xFF757575)
                          : Colors.black87,
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 14,
                        color: Color(0xFFBDBDBD),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'User ${todo.userId}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 상태 아이콘
            Icon(
              todo.completed
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: todo.completed ? Color(0xFFFF6F0F) : Color(0xFFBDBDBD),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
