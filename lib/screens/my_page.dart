import 'package:flutter/material.dart';
import 'custom_bottom_navigation_bar.dart';
import 'settings.dart';

class MyPage extends StatelessWidget {
  final String userName = "홍길동"; // 사용자 이름 (DB에서 가져옴)
  final String department = "디지털콘텐츠/가상현실"; // 학과 (DB에서 가져옴)
  final String profileImageUrl = "assets/splash.jpg"; // 프로필 사진 URL (DB에서 가져옴)

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
          // 상단 파란색 프로필 영역
          Container(
            color: Colors.blue[700],
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Stack(
              children: [
                // 프로필 사진과 이름/학과 정보 정렬
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 프로필 이미지
                    CircleAvatar(
                      radius: 50.0, // 이미지 크기 증가
                      backgroundImage: NetworkImage(profileImageUrl),
                    ),
                    SizedBox(width: 16.0), // 이미지와 텍스트 간격
                    // 이름과 학과 정보
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName, // 사용자 이름
                            style: TextStyle(fontSize: 22.0, color: Colors.white),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            department, // 학과 정보
                            style: TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // 상단 오른쪽 구석에 설정 아이콘 배치
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                  child: Text(
                    "MY HISTORY",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: ListView(
                      children: [
                        // 이 부분은 DB에서 미션 데이터를 불러와서 표시
                        _buildHistoryItem("나의 시간을 등록하여 일일미션 달성!", "10시"),
                        _buildHistoryItem("처음 부기부기에 참여했어요!", "10분 전"),
                        // 다른 기록 추가 가능
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: 0),
    );
  }
  Widget _buildHistoryItem(String message, String time) {
    return ListTile(
      leading: Icon(Icons.check_circle, color: Colors.blue),
      title: Text(message),
      subtitle: Text(time),
    );
  }
}
