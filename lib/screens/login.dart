import 'package:flutter/material.dart';
import 'chat_page.dart'; // 메인 화면 가져오기



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // 로그인 로직 추가
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C4A90),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C4A90),
        elevation: 0, // AppBar 그림자 제거
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 125.0, left: 16.0, right: 16.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start, // Column을 위쪽 정렬
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 로고 이미지
            Image.asset(
              'assets/splash.png', // 실제 이미지 경로로 변경
              height: 300,
            ),
            const SizedBox(height: 0),
            const Text(
              '부기부기',
              style: TextStyle(
                fontFamily: 'MainFont',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // 회원가입 및 로그인 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 회원가입 버튼 로직 추가 (예: 회원가입 화면으로 이동)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3263AF), // 버튼 배경색
                    foregroundColor: Colors.white, // 버튼 텍스트 색상
                    minimumSize: const Size(150, 65),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 19, // 텍스트 크기 조정
                      fontWeight: FontWeight.bold, // 필요 시 텍스트 굵기 조정
                    ),
                  ),
                ),

                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF767676), // 로그인 버튼 배경색
                    foregroundColor: Colors.white, // 로그인 버튼 텍스트 색상
                    minimumSize: const Size(150,65),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      fontSize: 19, // 텍스트 크기 조정
                      fontWeight: FontWeight.bold, // 필요 시 텍스트 굵기 조정
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
