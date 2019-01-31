#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {
	videoBuffer[OFFSET(row, col, 240)] = color;
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
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}