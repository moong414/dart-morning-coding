void main(){
  stars();
  startReverse();
  quadrangle();
}

//별5줄정방향
void stars(){
  int rows = 6;
  for(int i = 0; i < rows; i++){
    String star = '';
    for(int j = 0; j < i; j++){
      star += '*';
    }
    print(star);
  }
}

//별5줄역방향
void startReverse(){
  int rows = 5;
  for(int i = rows; i > 0; i--){
    String star = '*' * i;
    print(star);
  }
}

//별로사각형
void quadrangle(){
  int rows = 5;
  for(int i = 0; i < rows; i++){
    String star = '';
    star += '*' * rows;
    print(star);
  }
}

//별로사각형2
void quadrangle2(){
  int rows = 5;
  for(int i = 1; i < rows; i++){
    String star = '';
    for(int j = 1; j < rows; j++){
      star = '*' * rows;
    }
    print(star);
  }
}