import 'package:flutter/material.dart';
import 'custom_bottom_navigation_bar.dart';

// Mission 모델
class Mission {
  final String title;
  late final int progress;
  final int goal;
  bool isCompleted;

  Mission({
    required this.title,
    required this.progress,
    required this.goal,
    this.isCompleted = false,
  });

  // 현재 진행 상황에 따른 완료 여부 업데이트
  void updateProgress(int newProgress) {
    progress = newProgress;
    isCompleted = progress >= goal;
  }
}

class MissionPage extends StatefulWidget {
  const MissionPage({super.key});

  @override
  State<MissionPage> createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  Future<List<Mission>> fetchMissions() async {
    // 서버로부터 미션 데이터를 가져오는 코드 (예: HTTP GET 요청)
    // 예시용으로 더미 데이터를 반환합니다.
    return [
      Mission(title: '상상부기에게 3일간 말 걸기', progress: 1, goal: 3),
      Mission(title: '상상부기에게 손 흔들기', progress: 0, goal: 1),
      Mission(title: '나의 시간표 등록하기', progress: 1, goal: 1),
      Mission(title: '학교 시설과 관련된 질문 하기', progress: 1, goal: 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("일일미션"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Mission>>(
          future: fetchMissions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Failed to load missions'));
            } else {
              final missions = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Image.asset('assets/boogieboogie_logo.png'),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "BoogieBoogie",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: missions.length,
                      itemBuilder: (context, index) {
                        final mission = missions[index];
                        return MissionItem(
                          mission: mission,
                          onMissionUpdated: () {
                            setState(() {}); // 진행도 업데이트 후 UI 갱신
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedIndex: 2, // 미션 페이지에 해당하는 인덱스 설정
      ),
      backgroundColor: const Color(0xFF1C4A90),
    );
  }
}

// MissionItem 위젯
class MissionItem extends StatelessWidget {
  final Mission mission;
  final VoidCallback onMissionUpdated;

  const MissionItem({
    super.key,
    required this.mission,
    required this.onMissionUpdated,
  });

  void completeMission() {
    // 미션 완료 API 호출 예시 코드
    // 완료 후 onMissionUpdated 호출하여 UI 갱신
    mission.updateProgress(mission.goal);
    onMissionUpdated();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mission.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 진행도 표시 (progress / goal)
                Expanded(
                  child: LinearProgressIndicator(
                    value: mission.progress / mission.goal,
                    backgroundColor: Colors.grey[300],
                    color: mission.isCompleted ? Colors.green : Colors.blue,
                  ),
                ),
                const SizedBox(width: 10),
                mission.isCompleted
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : Text("${mission.progress}/${mission.goal}"),
              ],
            ),
            if (!mission.isCompleted)
              TextButton(
                onPressed: completeMission,
                child: const Text("미션 진행"),
              ),
          ],
        ),
      ),
    );
  }
}
