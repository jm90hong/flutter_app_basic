import 'package:flutter/material.dart';
import 'package:my_app1/screens/mypage_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs3MhBBT_RKyvyfxLitlk6sgavjAx9QcFP_A&s',
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                '안녕하세요1',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text('안녕하세요21111111111111111111111111'),
            SizedBox(height: 30),
            Text('안녕하세요3'),
            Text('안녕하세요4'),
            Text('안녕하세요5'),
            Text('안녕하세요6'),
            Text('안녕하세요7'),
            Text('안녕하세요8'),

            Row(
              children: [
                Text('로우1'),
                Text('로우1'),
                Text('로우1'),
                Text('로우1'),
                Text('로우1'),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MypageScreen()),
                );
              },
              child: Text('마이페이지 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
