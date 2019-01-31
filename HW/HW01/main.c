#include "myLib.h"

void initialize();
void frame1();
void frame2();
void frame3();
void delay();

int main() {

	initialize();

	while(1) {
		fillScreen(BLACK);
		waitForVBlank();
		frame1();
		delay(200);

		fillScreen(BLACK);
		waitForVBlank();
		frame2();
		delay(200);

		fillScreen(BLACK);
		waitForVBlank();
		frame3();
		delay(200);
	}	

}

void initialize() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;
}

void frame1() {
	//H
	drawVerticalLine(25, 25, 50, PINK);
	drawVerticalLine(25, 40, 50, PINK);
	drawHorizontalLine(50, 25, 15, PINK);
	//E
	drawVerticalLine(25, 45, 50, PINK);
	drawHorizontalLine(25, 45, 15, PINK);
	drawHorizontalLine(50, 45, 15, PINK);
	drawHorizontalLine(75, 45, 15, PINK);
	//L
	drawVerticalLine(25, 65, 50, PINK);
	drawHorizontalLine(75, 65, 15, PINK);
	//L
	drawVerticalLine(25, 85, 50, PINK);
	drawHorizontalLine(75, 85, 15, PINK);
	//O
	drawRectangle(25, 105, 50, 15, PINK);
}

void frame2() {
	//W
	drawVerticalLine(25, 25, 50, YELLOW);
	drawVerticalLine(25, 40, 50, YELLOW);
	drawVerticalLine(25, 55, 50, YELLOW);
	drawHorizontalLine(75, 25, 30, YELLOW);
	//O
	drawRectangle(25, 60, 50, 15, YELLOW);
	//R
	drawRectangle(25, 80, 30, 15, YELLOW);
	drawVerticalLine(55, 80, 20, YELLOW);
	drawDiagonalDownLine(55, 80, 20, YELLOW);
	//L
	drawVerticalLine(25, 105, 50, YELLOW);
	drawHorizontalLine(75, 105, 15, YELLOW);
	//D
	drawVerticalLine(25, 125, 50, YELLOW);
	drawDiagonalUpLine(75, 125, 26, YELLOW);
	drawDiagonalDownLine(25, 125, 25, YELLOW);
}

void frame3() {
	// :)
	//left eye
	drawRectangle(50, 50, 7, 7, CYAN);
	//right eye
	drawRectangle(50, 93, 7, 7, CYAN);
	//smile
	drawVerticalLine(80, 50, 6, CYAN);
	drawVerticalLine(80, 100, 6, CYAN);
	drawDiagonalDownLine(86, 50, 10, CYAN);
	drawDiagonalUpLine(95, 90, 10, CYAN);
	drawHorizontalLine(95, 59, 31, CYAN);
}