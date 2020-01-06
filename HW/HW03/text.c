#include "myLib.h"
#include "text.h"
#include "font.h"

// Draws character
void drawChar(int row, int col, char ch, unsigned short color) {

    for (int i = 0; i < 8; i++) {
    	for (int j = 0; j < 6; j++) {
    		if (fontdata_6x8[48*ch + OFFSET(i, j, 6)]) {
                setPixel(row + i, col + j, color);
            }
    	}
    }
}

// Draws string
void drawString(int row, int col, char *str, unsigned short color) {

	while (*str != '\0') {
		drawChar(row, col, *str, color);
		col += 6;
		str++;
	}
}