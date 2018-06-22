#include <stdio.h>

int sum(int, int); // プロトタイプ宣言

// C言語ではmain関数が一番初めに動作する関数
int main(void) {
  int one = 1;
  int two = 2;
  int x = one + two;
  int value;

  printf("Hello World!\n");
  printf("%d\n", x);
  value = sum(0, 100);
  printf("%d\n", value);
  return 0;
}

// 自作関数、プロトタイプ宣言してから実行する
int sum(int min, int max) {
  int num;
  num = (min + max) * (max - min + 1) / 2;
  return num;
}
