import 'package:flutter/material.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  String nowCategory = '공지사항';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          '마이페이지',
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFF5F5F5),
        child: Column(
          children: [
            SizedBox(height: 24),
            //프로필
            Row(
              children: [
                ProfileBox(
                  imgUrl:
                      'https://img.freepik.com/free-photo/closeup-shot-adorable-white-puppy-blurred-background_181624-15998.jpg?semt=ais_hybrid&w=740&q=80',
                  imgSize: 64,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'jm90.hong@gmail.com',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '프로필 메세지를 입력하세요.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 32),

            //카테고리 버튼 박스
            Row(
              children: [
                CategoryBox(
                  text: '내정보',
                  isSelected: nowCategory == '내정보' ? true : false,
                  onClick: () {
                    setState(() {
                      nowCategory = '내정보';
                    });
                  },
                ),
                CategoryBox(
                  text: '공지사항',
                  isSelected: nowCategory == '공지사항' ? true : false,
                  onClick: () {
                    setState(() {
                      nowCategory = '공지사항';
                    });
                  },
                ),
                CategoryBox(
                  text: '결제내역',
                  isSelected: nowCategory == '결제내역' ? true : false,
                  onClick: () {
                    setState(() {
                      nowCategory = '결제내역';
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 24),
            //회원리스트 박스
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '회원리스트',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5, // 예시 데이터 개수
                        itemBuilder: (context, index) {
                          return MemberListItem(
                            name: '회원 ${index + 1}',
                            email: 'member${index + 1}@example.com',
                            imgUrl:
                                'https://img.freepik.com/free-photo/closeup-shot-adorable-white-puppy-blurred-background_181624-15998.jpg?semt=ais_hybrid&w=740&q=80',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onClick;

  CategoryBox({
    required this.text,
    required this.isSelected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFF6F0F) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: isSelected ? Color(0xFFFF6F0F) : Color(0xFFE0E0E0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF757575),
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class ProfileBox extends StatelessWidget {
  final double imgSize;
  final String imgUrl;

  ProfileBox({this.imgSize = 60, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imgSize,
      height: imgSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xFFEEEEEE), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imgSize / 2),
        child: Image.network(
          imgUrl,
          width: imgSize,
          height: imgSize,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Color(0xFFF5F5F5),
              child: Icon(
                Icons.person,
                color: Color(0xFFBDBDBD),
                size: imgSize * 0.6,
              ),
            );
          },
        ),
      ),
    );
  }
}

class MemberListItem extends StatelessWidget {
  final String name;
  final String email;
  final String imgUrl;

  MemberListItem({
    required this.name,
    required this.email,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ProfileBox(imgUrl: imgUrl, imgSize: 56),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Color(0xFF757575)),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Color(0xFFBDBDBD), size: 24),
        ],
      ),
    );
  }
}
