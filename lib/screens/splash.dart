import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Lottie 패키지 가져오기
import 'login.dart'; // 로그인 화면 가져오기

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLogo = false;

  @override
  void initState() {
    super.initState();
    // 3초 후에 Lottie 애니메이션을 숨기고 로고 이미지를 표시
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showLogo = true;
      });
    });

    // 4초 후에 로그인 화면으로 이동
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C4A90), // 배경색 설정
      body: Padding(
        padding: const EdgeInsets.only(top: 205.0, left: 16.0, right: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!showLogo) // showLogo가 false일 때 Lottie 애니메이션 표시
                Lottie.asset(
                  'assets/loading.json',
                  width: 300,
                  height: 300,
                )
              else // showLogo가 true일 때 로고 이미지 표시
                Image.asset(
                  'assets/splash.png',
                  width: 300,
                ),
              const SizedBox(height: 0),
              if (showLogo) // 로고가 나타날 때 텍스트도 함께 표시
                const Text(
                  '부기부기',
                  style: TextStyle(
                    fontFamily: 'MainFont',
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
