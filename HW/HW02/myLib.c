#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

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

//rectangle outline
void drawRectangle(int row, int col, int height, int width, unsigned short color) {
    drawVerticalLine(row, col, height, color);
    drawVerticalLine(row, col + width, height + 1, color);
    drawHorizontalLine(row, col, width, color);
    drawHorizontalLine(row + height, col, width + 1, color);
}

//filled-in rectangle
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
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {
	return ((rowA <= (rowB + heightB)) && ((rowA + heightA) >= rowB) &&
		(colA <= (colB + widthB)) && ((colA + widthA) >= colB));
}