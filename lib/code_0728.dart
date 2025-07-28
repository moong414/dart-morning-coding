import 'dart:collection';

void main() {
  RecentCounter recentcounter = RecentCounter();
  print(recentcounter.ping(1));  
  print(recentcounter.ping(100)); 
  print(recentcounter.ping(3001));  
  print(recentcounter.ping(3002)); 
}

//933. 최근 호출 수 
//문제 풀지못함.....................................
//정답=============================================
class RecentCounter {
  RecentCounter();

  List<int> list = [];

  int ping(int t) {
    list.add(t); // 요청 추가

    // 오래된 요청 제거 (t - 3000보다 작은 값)
    while (list.isNotEmpty && list.first < t - 3000) {
      list.removeAt(0); // 큐처럼 맨 앞 제거
    }

    return list.length;
  }
}

//정답=============================================
class RecentCounter2 {
  Queue<int> queue = Queue<int>();

  RecentCounter2();

  int ping(int t) {
    queue.add(t);
    
    // 큐의 첫 번째 요소가 범위에 속하지 않으면 제거
    while (queue.isNotEmpty && queue.first < t - 3000) {
      queue.removeFirst();
    }

    // 큐의 길이가 호출 횟수
    return queue.length;
  }
}