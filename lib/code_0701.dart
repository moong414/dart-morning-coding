void main() {
  pyramid();
  pyramid2();
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];
  matrixSquare(matrix);
}

//피라미드만들기
void pyramid() {
  int rows = 5;
  for (int i = 1; i <= rows; i++) {
    String spaces = ' ' * (rows - i);
    String stars = '*' * (2 * i - 1);
    print(spaces + stars);
  }
}

//피라미드만들기2
void pyramid2() {
  int rows = 5;

  for (int i = 1; i <= rows; i++) {
    String spaces = '';
    String stars = '';

    // 공백 만들기 (왼쪽 정렬용)
    for (int j = 1; j <= rows - i; j++) {
      spaces += ' ';
    }

    // 별 만들기 (홀수개: 1, 3, 5, ...)
    for (int k = 1; k <= 2 * i - 1; k++) {
      stars += '*';
    }

    // 결과 출력
    print(spaces + stars);
  }
}

//대각선 리스트 더하기
matrixSquare(List<List<int>> matrix){
  int sumLeft = 0;
  int sumRight = 0;
  
  for(int i=0; i<matrix.length; i++){
    for(int j=0; j<matrix.length; j++){
      if(i == j){
        sumLeft += matrix[i][j];
      }
      if(i+j == matrix.length - 1){
        sumRight += matrix[i][j];
      }
    }
  }
  print('Left: $sumLeft, Right: $sumRight');
}