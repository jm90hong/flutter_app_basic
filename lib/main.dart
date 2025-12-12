import 'package:flutter/material.dart';
import 'package:my_app1/screens/index_screen.dart';
import 'package:my_app1/screens/mypage_screen.dart';
import 'package:my_app1/screens/plus_sceen.dart';
import 'package:my_app1/screens/todo_screen.dart';
import 'package:my_app1/screens/todo_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_app1/providers/count_provider.dart';
import 'package:my_app1/providers/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: TodoListScreen(),
      ),
    );
  }
}
