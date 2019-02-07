# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 40 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 66 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 77 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
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


void drawBox(int row, int col, int height, int width, unsigned short color) {
    for(int i = 0; i < height; i++) {
     for(int j = 0; j < width; j++) {
      setPixel(row + i, col + j, color);
     }
    }
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 38400; i++) {
  videoBuffer[i] = color;
 }
}

void waitForVBlank() {
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {
 return ((rowA <= (rowB + heightB)) && ((rowA + heightA) >= rowB) &&
  (colA <= (colB + widthB)) && ((colA + widthA) >= colB));
}
