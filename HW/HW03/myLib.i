# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 41 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawHorizontalLine(int row, int col, int length, unsigned short color);
void drawVerticalLine(int row, int col, int height, unsigned short color);
void drawDiagonalUpLine(int row, int col, int height, unsigned short color);
void drawDiagonalDownLine(int row, int col, int height, unsigned short color);
void drawRectangle(int row, int col, int height, int width, unsigned short color);
void drawBox(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);



void waitForVBlank();
# 73 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 83 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 123 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);





int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;

DMA *dma = (DMA *)0x40000B0;

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

void drawDiagonalUpLine(int row, int col, int height, unsigned short color) {
    for (int i = 0; i < height; i++) {
        setPixel((row - i), (col + i), color);
    }
}

void drawDiagonalDownLine(int row, int col, int height, unsigned short color) {
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
    for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[((row + r)*(240)+(col))], (2 << 23) | width);
    }
}

void fillScreen(volatile unsigned short color) {
    DMANow(3, &color, videoBuffer, (2 << 23) | (240 * 160));
}

void waitForVBlank() {
 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {
 return ((rowA <= (rowB + heightB)) && ((rowA + heightA) >= rowB) &&
  (colA <= (colB + widthB)) && ((colA + widthA) >= colB));
}

void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    dma[channel].cnt = 0;

    dma[channel].src = src;
    dma[channel].dst = dst;

    dma[channel].cnt = cnt | (1 << 31);

}
