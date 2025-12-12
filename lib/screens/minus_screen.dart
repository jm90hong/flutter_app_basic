import 'package:flutter/material.dart';
import 'package:my_app1/screens/plus_sceen.dart';
import 'package:provider/provider.dart';
import 'package:my_app1/providers/count_provider.dart';

class MinusScreen extends StatefulWidget {
  const MinusScreen({super.key});

  @override
  State<MinusScreen> createState() => _MinusScreenState();
}

class _MinusScreenState extends State<MinusScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Minus Screen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${countProvider.count}',
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.decrement();
        },
        child: Icon(Icons.remove),
      ),
    );
  }
}
