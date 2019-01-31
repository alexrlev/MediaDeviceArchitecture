# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1
# 10 "myLib.h"
typedef unsigned short u16;
# 20 "myLib.h"
extern unsigned short *videoBuffer;
# 34 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void drawHorizontalLine (int row, int col, int length, unsigned short color);
void drawVerticalLine (int row, int col, int length, unsigned short color);
void fillScreen(unsigned short color);
void waitForVBlank();
# 2 "main.c" 2


void frame1();
void frame2();
void frame3();
void delay();

int main() {

 (*(unsigned short *)0x4000000) = 3 | (1<<10);

 while(1) {
  fillScreen(0);
  waitForVBlank();
  frame1();
  delay(200);

  fillScreen(0);
  waitForVBlank();
  frame2();
  delay(200);

  fillScreen(0);
  waitForVBlank();
  frame3();
  delay(200);
 }

}

void frame1() {

 drawVerticalLine(25, 25, 50, ((31) | (21)<<5 | (29)<<10));
 drawVerticalLine(25, 40, 50, ((31) | (21)<<5 | (29)<<10));
 drawHorizontalLine(50, 25, 15, ((31) | (21)<<5 | (29)<<10));

 drawVerticalLine(25, 45, 50, ((31) | (21)<<5 | (29)<<10));
 drawHorizontalLine(25, 45, 15, ((31) | (21)<<5 | (29)<<10));
 drawHorizontalLine(50, 45, 15, ((31) | (21)<<5 | (29)<<10));
 drawHorizontalLine(75, 45, 15, ((31) | (21)<<5 | (29)<<10));

 drawVerticalLine(25, 65, 50, ((31) | (21)<<5 | (29)<<10));
 drawHorizontalLine(75, 65, 15, ((31) | (21)<<5 | (29)<<10));

 drawVerticalLine(25, 85, 50, ((31) | (21)<<5 | (29)<<10));
 drawHorizontalLine(75, 85, 15, ((31) | (21)<<5 | (29)<<10));

 drawRectangle(25, 105, 50, 15, ((31) | (21)<<5 | (29)<<10));
}

void frame2() {

 drawVerticalLine(25, 25, 50, ((31) | (31)<<5 | (0)<<10));
 drawVerticalLine(25, 40, 50, ((31) | (31)<<5 | (0)<<10));
 drawVerticalLine(25, 55, 50, ((31) | (31)<<5 | (0)<<10));
 drawHorizontalLine(75, 25, 30, ((31) | (31)<<5 | (0)<<10));

 drawRectangle(25, 60, 50, 15, ((31) | (31)<<5 | (0)<<10));

 drawRectangle(25, 80, 30, 15, ((31) | (31)<<5 | (0)<<10));
 drawVerticalLine(55, 80, 20, ((31) | (31)<<5 | (0)<<10));
 drawDiagonalDownLine(55, 80, 20, ((31) | (31)<<5 | (0)<<10));

 drawVerticalLine(25, 105, 50, ((31) | (31)<<5 | (0)<<10));
 drawHorizontalLine(75, 105, 15, ((31) | (31)<<5 | (0)<<10));

 drawVerticalLine(25, 125, 50, ((31) | (31)<<5 | (0)<<10));
 drawDiagonalUpLine(75, 125, 26, ((31) | (31)<<5 | (0)<<10));
 drawDiagonalDownLine(25, 125, 25, ((31) | (31)<<5 | (0)<<10));
}

void frame3() {


 drawRectangle(50, 50, 7, 7, ((0) | (31)<<5 | (31)<<10));

 drawRectangle(50, 93, 7, 7, ((0) | (31)<<5 | (31)<<10));

 drawVerticalLine(80, 50, 6, ((0) | (31)<<5 | (31)<<10));
 drawVerticalLine(80, 100, 6, ((0) | (31)<<5 | (31)<<10));
 drawDiagonalDownLine(86, 50, 10, ((0) | (31)<<5 | (31)<<10));
 drawDiagonalUpLine(95, 90, 10, ((0) | (31)<<5 | (31)<<10));
 drawHorizontalLine(95, 59, 31, ((0) | (31)<<5 | (31)<<10));
}
