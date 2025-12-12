import 'package:flutter/material.dart';
import 'package:my_app1/screens/minus_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_app1/providers/count_provider.dart';

class PlusSceen extends StatefulWidget {
  const PlusSceen({super.key});

  @override
  State<PlusSceen> createState() => _PlusSceenState();
}

class _PlusSceenState extends State<PlusSceen> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Plus Screen', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MinusScreen()),
                );
              },
              child: Text('- 로 이동'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
