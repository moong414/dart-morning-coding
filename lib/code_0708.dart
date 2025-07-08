void main() {
  print(tribonacci(4));
  print(tribonacci2(4));
}

// 1137. n번째 Tribonacci 수 구하기
// 정답=================================================
int tribonacci(int n) {
  //예외처리 
  if (n == 0) return 0; //n이 0일경우 0을 반환
  if (n == 1 || n == 2) return 1; // 1일경우, 2일경우는 1을 반환

  int t0 = 0, t1 = 1, t2 = 1, t3 = 0; //초기값 t0, t1, t2. t3은 계산할 값 초기화상태
  for (int i = 3; i <= n; i++) {//들어온 값만큼 for문 돌리기
    t3 = t0 + t1 + t2; //t3에 초기값 3개를 더하기
    t0 = t1; //for문을 돌리면서 값이 증가해야하기때문에 t1에 있는값을 t0에 전달
    t1 = t2; //똑같이 전달
    t2 = t3; //똑같
  }//for문이 n번째 돌면
  return t3; //t3반환
}

int tribonacci2(int n) {
  if(n == 0) return 0;
  if(n == 0) return 1;
  if(n == 2) return 1;

  List<int> list = [0, 1, 1];
  int value = 0;

  for(int i = 3; i <= n; i++){
    value = list[i-1] + list[i-2] + list[i-3];
    list.add(value);
  }

  return value;
}
