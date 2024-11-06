import 'package:flutter/material.dart';
import 'my_page.dart';
import 'mission_page.dart';
import 'chat_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return;

    Widget page;
    if (index == 0) {
      page = const MyPage();
    } else if (index == 1) {
      page = const ChatPage();
    } else {
      page = const MissionPage();
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false, // 이전 스택을 모두 제거하여 새 페이지로 이동
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => _onItemTapped(context, index),
          selectedItemColor: const Color(0xFF1C4A90),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '마이페이지',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(), // 가운데 공간 확보를 위해 빈 위젯 사용
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: '일일미션',
            ),
          ],
        ),
        Positioned(
          bottom: 10, // BottomNavigationBar 위에 FloatingActionButton을 배치
          child: FloatingActionButton(
            onPressed: () {
              _onItemTapped(context, 1); // 채팅 페이지로 이동
            },
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/chat.png', // 채팅 아이콘 경로 확인
              width: 40,
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}
