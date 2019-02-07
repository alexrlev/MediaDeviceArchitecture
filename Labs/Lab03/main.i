# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "coords.h" 1

extern int visiblePersonRows[190];
extern int visiblePersonCols[190];
extern int invisiblePersonRows[190];
extern int invisiblePersonCols[190];
# 3 "main.c" 2


void initialize();
void drawCacti();
void drawPerson(int rows[], int cols[], int numCoords, unsigned short color);
void drawBackground();
void drawCactus(int col);
void eraseCactus(int col);
void advanceCacti();
void swap(int *old, int *new);


unsigned short buttons;
unsigned short oldButtons;
# 25 "main.c"
int cactusCols[] = {0, 110};
int oldCactusCols[] = {0, 110};

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        advanceCacti();
        if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

            for (int i = 0; i < 190; i++) {
                swap(&visiblePersonRows[i], &invisiblePersonRows[i]);
                swap(&visiblePersonCols[i], &invisiblePersonCols[i]);
            }
        }

        waitForVBlank();



        drawPerson(invisiblePersonRows, invisiblePersonCols, 190, ((15) | (15)<<5 | (31)<<10));

        drawCacti();

        drawPerson(visiblePersonRows, visiblePersonCols, 190, ((31) | (31)<<5 | (31)<<10));
    }
}


void initialize() {

    (*(unsigned short *)0x4000000) = 3 | (1<<10);
    drawBackground();
}


void swap(int *old, int *new) {
    int temp = *old;
    *old = *new;
    *new = temp;
}


void drawCacti() {

    int length = sizeof(cactusCols)/sizeof(cactusCols[0]);
    for (int i = 0; i < length; i++) {
        eraseCactus(oldCactusCols[i]);
        drawCactus(cactusCols[i]);
    }
}


void drawPerson(int rows[], int cols[], int numCoords, unsigned short color) {



    for (int i = 0; i < numCoords; i++) {
        setPixel(rows[i], cols[i], color);
    }
}


void drawBackground() {


    int i;
    for (i = 0; i < 240*100; i++) {
        videoBuffer[i] = ((15) | (15)<<5 | (31)<<10);
    }


    for (; i < 240*160; i++) {
        videoBuffer[i] = ((31) | (31)<<5 | (15)<<10);
    }
}


void drawCactus(int col) {

    int row = 72;
    drawRect(row + 7, col, 9, 4, ((3) | (31)<<5 | (3)<<10));
    drawRect(row + 12, col + 4, 4, 3, ((3) | (31)<<5 | (3)<<10));
    drawRect(row, col + 7, 30, 6, ((3) | (31)<<5 | (3)<<10));
    drawRect(row + 15, col + 13, 4, 3, ((3) | (31)<<5 | (3)<<10));
    drawRect(row + 10, col + 16, 9, 4, ((3) | (31)<<5 | (3)<<10));
}


void eraseCactus(int col) {

    int row = 72;
    drawRect(row, col, 100 - row, 20, ((15) | (15)<<5 | (31)<<10));
    drawRect(100, col, 30 - (100 - row), 20, ((31) | (31)<<5 | (15)<<10));
}


void advanceCacti() {

    int arraylen = sizeof(cactusCols)/sizeof(cactusCols[0]);
    for (int i = 0; i < arraylen; i++) {
        oldCactusCols[i] = cactusCols[i];

        cactusCols[i]++;
        if (cactusCols[i] > 240 - 20) {
            cactusCols[i] = 0;
        }
    }
}
