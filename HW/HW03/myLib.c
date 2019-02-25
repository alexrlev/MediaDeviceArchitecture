#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

DMA *dma = (DMA *)0x40000B0;

void setPixel(int row, int col, unsigned short color) {
	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
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

//rectangle outline
void drawRectangle(int row, int col, int height, int width, unsigned short color) {
    drawVerticalLine(row, col, height, color);
    drawVerticalLine(row, col + width, height + 1, color);
    drawHorizontalLine(row, col, width, color);
    drawHorizontalLine(row + height, col, width + 1, color);
}

//filled-in rectangle
void drawBox(int row, int col, int height, int width, unsigned short color) {
    for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(row + r, col, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
    }
}

void fillScreen(volatile unsigned short color) {
    DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

void waitForVBlank() {
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {
	return ((rowA <= (rowB + heightB)) && ((rowA + heightA) >= rowB) &&
		(colA <= (colB + widthB)) && ((colA + widthA) >= colB));
}

void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    dma[channel].cnt = 0;

    dma[channel].src = src;
    dma[channel].dst = dst;

    dma[channel].cnt = cnt | DMA_ON;

}