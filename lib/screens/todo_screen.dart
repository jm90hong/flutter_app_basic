import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app1/providers/todo_provider.dart';

class TodoScreen extends StatefulWidget {
  final int id;

  TodoScreen({required this.id});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).fetchTodo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final todo = todoProvider.todo;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Todo 상세',
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
        padding: EdgeInsets.all(16),
        child: todo == null
            ? Center(child: CircularProgressIndicator(color: Color(0xFFFF6F0F)))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 메인 카드
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 상태 표시
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: todo.completed
                                        ? Color(0xFFFF6F0F)
                                        : Color(0xFFE0E0E0),
                                    width: 2,
                                  ),
                                  color: todo.completed
                                      ? Color(0xFFFF6F0F)
                                      : Colors.white,
                                ),
                                child: todo.completed
                                    ? Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                              SizedBox(width: 12),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: todo.completed
                                      ? Color(0xFFFF6F0F).withOpacity(0.1)
                                      : Color(0xFFE0E0E0).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  todo.completed ? '완료' : '진행중',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: todo.completed
                                        ? Color(0xFFFF6F0F)
                                        : Color(0xFF757575),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          // 제목
                          Text(
                            todo.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 24),
                          // 구분선
                          Container(height: 1, color: Color(0xFFEEEEEE)),
                          SizedBox(height: 20),
                          // 상세 정보
                          _buildInfoRow(
                            icon: Icons.tag,
                            label: 'ID',
                            value: '${todo.id}',
                          ),
                          SizedBox(height: 16),
                          _buildInfoRow(
                            icon: Icons.person_outline,
                            label: '사용자',
                            value: 'User ${todo.userId}',
                          ),
                          SizedBox(height: 16),
                          _buildInfoRow(
                            icon: todo.completed
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            label: '상태',
                            value: todo.completed ? '완료됨' : '미완료',
                            valueColor: todo.completed
                                ? Color(0xFFFF6F0F)
                                : Color(0xFF757575),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Color(0xFFBDBDBD)),
        SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF757575),
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: valueColor ?? Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
