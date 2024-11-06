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
                  Image.asset(
                    'assets/splash.png', // 로고 파일 경로 설정
                    height: 150,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '부기부기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MainFont', // 원하는 폰트 설정
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // 이름 입력 필드
              CustomTextField(
                label: '이름',
                textStyle: textFieldStyle,
                //width: 300, // 원하는 너비로 설정
                height: 40, // 원하는 높이로 설정
              ),
              SizedBox(height: 10),
              // 생년월일 입력 필드
              CustomTextField(
                label: '생년월일',
                textStyle: textFieldStyle,
                //width: 300,
                height: 40,
              ),
              SizedBox(height: 10),

              // 아이디 입력 필드
              CustomTextField(
                label: '아이디',
                hintText: '(example@google.com)',
                textStyle: textFieldStyle,
                width: 300,
                height: 50,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: '인증번호',
                      textStyle: textFieldStyle,
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('인증번호'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // 인증번호 입력 필드
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: '인증번호',
                      textStyle: textFieldStyle,
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('확인'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // 비밀번호 입력 필드
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: '비밀번호',
                      obscureText: true,
                      textStyle: textFieldStyle,
                      height: 50,
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
              SizedBox(height: 10),
              // 비밀번호 확인 입력 필드
              CustomTextField(
                label: '비밀번호 확인',
                obscureText: true,
                textStyle: textFieldStyle,
                width: 300,
                height: 50,
              ),
              SizedBox(height: 10),
              // 제1트랙 입력 필드
              CustomTextField(
                label: '제 1트랙',
                textStyle: textFieldStyle,
                width: 300,
                height: 50,
              ),
              SizedBox(height: 20),
              // 회원가입 버튼
              ElevatedButton(
                onPressed: () {
                  // 회원가입 버튼을 누르면 LoginPage로 돌아감
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // 버튼 색상
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
  final TextStyle textStyle; // 텍스트 필드의 스타일을 위한 변수
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
      width: width,   // 너비 설정
      height: height, // 높이 설정
      child: TextFormField(
        obscureText: obscureText,
        style: textStyle,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
