#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Set a pixel on the screen in Mode 3
void setPixel3(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

// Set a pixel on the screen in Mode 4
void setPixel4(int row, int col, unsigned char colorIndex) {

    // TODO 1.0: Write this function
    unsigned short pixel = videoBuffer[OFFSET(row, col, SCREENWIDTH)/2];
    if (col & 1) {
        pixel &= 0x00FF;
        pixel |= (colorIndex << 8);
    } else {
        pixel &= 0xFF00;
        pixel |= colorIndex;
    }
    videoBuffer[OFFSET(row, col, SCREENWIDTH)/2] = pixel;

}

// Draw a rectangle at the specified location and size in Mode 3
void drawRect3(int row, int col, int height, int width, volatile unsigned short color) {

	for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
	}
}

// Draw a rectangle at the specified location and size in Mode 4
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex) {

    // TODO 5.0: Write this function using DMA
    volatile unsigned short c = colorIndex | (colorIndex << 8);
    for (int r = 0; r < height; r++) {
        if (col & 1) { //odd col
            if (width & 1) {  //odd width
                setPixel4(row + r, col, colorIndex);
                if (width > 1) {
                    DMANow(3, &c, &videoBuffer[OFFSET(r+row, col+1, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
                }
            } else {  //even width
                setPixel4(row + r, col, colorIndex);
                if (width > 2) {
                    DMANow(3, &c, &videoBuffer[OFFSET(r+row, col+1, SCREENWIDTH)/2], DMA_SOURCE_FIXED | (width/2-1));
                }
                setPixel4(row + r, col+width-1, colorIndex);
            }
        } else { //even col
            if (width & 1) {  //odd width
                if (width > 1) {
                    DMANow(3, &c, &videoBuffer[OFFSET(r+row, col, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
                }
                setPixel4(row + r, col+width-1, colorIndex);
            } else {  //even width
                DMANow(3, &c, &videoBuffer[OFFSET(r+row, col, SCREENWIDTH)/2], DMA_SOURCE_FIXED | width/2);
            }
        }
    }
}

// Fill the entire screen with a single color in Mode 3
void fillScreen3(volatile unsigned short color) {

	DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

// Fill the entire screen with a single color in Mode 4
void fillScreen4(volatile unsigned char colorIndex) {
    
    // TODO 2.0: Write this function using DMA
    volatile unsigned int pixel = colorIndex << 24 | colorIndex << 16 | colorIndex << 8 | colorIndex;
    DMANow(3, &pixel, videoBuffer, 1 << 31 | 1 << 26 | 1 << 24 | 9600);

}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int row, int col, int height, int width, const unsigned short *image) {

    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(r, 0, width)], &videoBuffer[OFFSET((row + r), col, SCREENWIDTH)], width);
    }
}

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage4(int row, int col, int height, int width, const unsigned short *image) {

    // TODO 4.0: Write this function using DMA
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(r, 0, width)/2], &videoBuffer[OFFSET((row + r), col, SCREENWIDTH)/2], width/2);
    }
}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage4(const unsigned short *image) {

    // TODO 3.0: Write this function using DMA
    DMANow(3, image, videoBuffer, (SCREENWIDTH * SCREENHEIGHT) / 2);
}

// Pause code execution until vertical blank begins
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage() {

    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // Turn DMA off
    dma[channel].cnt = 0;

    // Set source and destination
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Set control and begin
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}