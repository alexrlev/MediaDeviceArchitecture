#ifndef HEADER_H
#define HEADER_H

// GBA Video Registers and Flags
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Typedef
typedef unsigned short u16;

// Macros
#define OFFSET(r, c, rowlen) ((r)*(rowlen)+(c))
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Display status registers
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Video Buffer
extern unsigned short *videoBuffer;

// Colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)
#define PINK COLOR (31,21,29)

// Drawing functions
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void drawHorizontalLine (int row, int col, int length, unsigned short color);
void drawVerticalLine (int row, int col, int length, unsigned short color);
void fillScreen(unsigned short color);
void waitForVBlank();

#endif