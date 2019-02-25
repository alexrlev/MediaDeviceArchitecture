# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
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
# 2 "text.c" 2
# 1 "text.h" 1

void drawChar(int, int, char, unsigned short);
void drawString(int, int, char *, unsigned short);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2


void drawChar(int row, int col, char ch, unsigned short color) {

    for (int i = 0; i < 8; i++) {
     for (int j = 0; j < 6; j++) {
      if (fontdata_6x8[48*ch + ((i)*(6)+(j))]) {
                setPixel(row + i, col + j, color);
            }
     }
    }


}


void drawString(int row, int col, char *str, unsigned short color) {

 while (*str != '\0') {
  drawChar(row, col, *str, color);
  col += 6;
  str++;
 }

}
