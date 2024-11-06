import 'package:flutter/material.dart';
import 'login.dart'; // LoginPage 파일을 import

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  // 텍스트 필드 스타일을 상수로 정의하지 않고 인스턴스 변수로 선언
  final textFieldStyle = const TextStyle(
    fontFamily: 'MainFont', // 원하는 폰트 패밀리 이름을 지정
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E56A0), // 배경색 설정
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 로고와 '부기부기' 텍스트
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 15), // 좌측 여백
                  Image.asset(
                    'assets/splash.png', // 로고 파일 경로 설정
                    height: 140,
                  ),
                  SizedBox(width: 0), // 로고와 텍스트 사이의 간격 조정
                  Text(
                    '부기부기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MainFont', // 원하는 폰트 설정
                    ),
                  ),
                  SizedBox(width: 40), // 우측 여백
                ],
              ),
              SizedBox(height: 20),
              // 이름 입력 필드
              CustomTextField(
                label: '이름',
                textStyle: textFieldStyle,
                height: 40,
              ),
              SizedBox(height: 10),
              // 생년월일 입력 필드
              CustomTextField(
                label: '생년월일',
                textStyle: textFieldStyle,
                height: 40,
              ),
              SizedBox(height: 10),
              // 아이디 입력 필드
              CustomTextField(
                label: '아이디',
                hintText: '(example@google.com)',
                textStyle: textFieldStyle,
                height: 40,
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: '인증번호',
                      textStyle: textFieldStyle,
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE7E7E7), // 버튼 배경색
                      foregroundColor: const Color(0xFF888888), // 텍스트 색상
                      shadowColor: Colors.grey, // 그림자 색상
                      elevation: 5, // 그림자 깊이
                      fixedSize: Size(100, 40),
                      //adding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // 둥근 모서리
                      ),
                    ),
                    onPressed: () {},
                    child: Text('인증번호'),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: '인증번호',
                      textStyle: textFieldStyle,
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE7E7E7), // 버튼 배경색
                      foregroundColor: const Color(0xFF888888), // 텍스트 색상
                      shadowColor: Colors.grey, // 그림자 색상
                      elevation: 5, // 그림자 깊이
                      fixedSize: Size(100, 40), //버튼 크기
                      //adding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // 둥근 모서리
                      ),
                    ),
                    onPressed: () {},
                    child: Text('확인'),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: '비밀번호',
                      obscureText: true,
                      textStyle: textFieldStyle,
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('숨김', style: TextStyle(fontSize: 12)),
                  ),
                  SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('표시', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              SizedBox(height: 7),
              CustomTextField(
                label: '비밀번호 확인',
                obscureText: true,
                textStyle: textFieldStyle,
                height: 40,
              ),
              SizedBox(height: 10),
              CustomTextField(
                label: '제 1트랙',
                textStyle: textFieldStyle,
                height: 40,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    color: Color(0xFF1E56A0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 커스텀 텍스트 필드 위젯
class CustomTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool obscureText;
  final TextStyle textStyle;
  final double? width;
  final double? height;

  CustomTextField({
    required this.label,
    this.hintText,
    this.obscureText = false,
    required this.textStyle,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0), // 둥근 모서리 설정
      ),
      padding: EdgeInsets.symmetric(horizontal: 16), // 텍스트 필드 안쪽 여백
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: obscureText,
        style: textStyle,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none, // 기본 테두리 제거
        ),
      ),
    );
  }
}
