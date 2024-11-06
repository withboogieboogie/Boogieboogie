import 'package:flutter/material.dart';
import 'custom_bottom_navigation_bar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        toolbarHeight: 0, // 상단 앱바 제거
      ),
      body: Column(
        children: [
         // 설정 항목 리스트
          Expanded(
            child: ListView(
              children: [
                _buildSettingItem(context, "회원정보수정", Icons.person, () {
                  // 회원정보수정 페이지로 이동
                }),
                _buildSettingItem(context, "로그아웃", Icons.logout, () {
                  // 로그아웃 기능 처리
                }),
                _buildSettingItem(context, "회원탈퇴", Icons.delete, () {
                  // 회원탈퇴 기능 처리
                }),
                _buildSettingItem(context, "FAQ_자주묻는 질문", Icons.help, () {
                  // FAQ 페이지로 이동
                }),
                _buildSettingItem(context, "테마 변경", Icons.color_lens, () {
                  // 테마 변경 기능 처리
                }),
              ],
            ),
          ),
        ],
      ),
      // 하단 네비게이션 바
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: 0),
    );
  }

  // 설정 항목 위젯 생성 함수
  Widget _buildSettingItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: onTap,
    );
  }
}
