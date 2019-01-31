# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
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
# 2 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {
 videoBuffer[((row)*(240)+(col))] = color;
}

void drawHorizontalLine(int row, int col, int width, unsigned short color) {
 for (int i = 0; i < width; i++) {
  setPixel(row, col++, color);
 }
}

void drawVerticalLine(int row, int col, int height, unsigned short color) {
 for (int i = 0; i < height; i++) {
  setPixel(row++, col, color);
 }
}

void drawDiagonalUpLine(int row, int col, int height, unsigned short color){
 for (int i = 0; i < height; i++) {
  setPixel((row - i), (col + i), color);
 }
}

void drawDiagonalDownLine(int row, int col, int height, unsigned short color){
 for (int i = 0; i < height; i++) {
  setPixel((row + i), (col + i), color);
 }
}

void drawRectangle(int row, int col, int height, int width, unsigned short color) {
 drawVerticalLine(row, col, height, color);
 drawVerticalLine(row, col + width, height + 1, color);
 drawHorizontalLine(row, col, width, color);
 drawHorizontalLine(row + height, col, width + 1, color);
}

void fillScreen(unsigned short color) {
 for (int i = 0; i < 38400; i++) {
  videoBuffer[i] = color;
 }
}

void delay(int amount) {
    volatile int trash = 0;
    for(int i=0; i < amount*1000; i++) {
     trash++;
    }
}

void waitForVBlank() {
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}
