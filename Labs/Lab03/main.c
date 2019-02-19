#include "myLib.h"
#include "coords.h"

// Prototypes
void initialize();
void drawCacti();
void drawPerson(int rows[], int cols[], int numCoords, unsigned short color);
void drawBackground();
void drawCactus(int col);
void eraseCactus(int col);
void advanceCacti();
void swap(int *old, int *new);

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Game-specific properties
#define SKYCOLOR COLOR(15, 15, 31)
#define SANDCOLOR COLOR(31, 31, 15)
#define CACTUSCOLOR COLOR(3, 31, 3)

// Game-specific arrays
// TODO 4.0: Change to 0, 73, 147
int cactusCols[] = {0, 110};
int oldCactusCols[] = {0, 110};

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // Update game logic
        advanceCacti();
        if (BUTTON_PRESSED(BUTTON_START)) {
            // TODO 3.1: For each coordinate in the row and column arrays, use the swap function to swap the visible and invisible coordinates
            for (int i = 0; i < NUMCOORDS; i++) {
                swap(&visiblePersonRows[i], &invisiblePersonRows[i]);
                swap(&visiblePersonCols[i], &invisiblePersonCols[i]);
            }
        }

        waitForVBlank();

        // Draw the game
        // TODO 2.2: Erase the invisible person
        drawPerson(invisiblePersonRows, invisiblePersonCols, NUMCOORDS, SKYCOLOR);
        // TODO 1.2: Call the drawCacti function
        drawCacti();
        // TODO 2.3: Draw the visible person
        drawPerson(visiblePersonRows, visiblePersonCols, NUMCOORDS, WHITE);
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    drawBackground();
}

// TODO 3.0: Write a function called "swap" that swaps two integers
void swap(int *old, int *new) {
    int temp = *old;
    *old = *new;
    *new = temp;
}

// Draw the cacti
void drawCacti() {
    // TODO 1.1: For each catcus column, erase the old cactus location (eraseCactus) and draw the new one (drawCactus)
    int length = sizeof(cactusCols)/sizeof(cactusCols[0]);
    for (int i = 0; i < length; i++) {
        eraseCactus(oldCactusCols[i]);
        drawCactus(cactusCols[i]);
    }
}

// Draw a person pixel-by-pixel at the specified coordinates
void drawPerson(int rows[], int cols[], int numCoords, unsigned short color) {

    // TODO 2.1: Draw a pixel at each row and column pair

    for (int i = 0; i < numCoords; i++) {
        setPixel(rows[i], cols[i], color);
    }
}

// Draw the background of the scene
void drawBackground() {

    // Draw sky
    int i;
    for (i = 0; i < 240*100; i++) {
        videoBuffer[i] = SKYCOLOR;
    }

    // Draw ground
    for (; i < 240*160; i++) {
        videoBuffer[i] = SANDCOLOR;
    }
}

// Draw a cactus at specified col
void drawCactus(int col) {

    int row = 72;
    drawRect(row + 7, col, 9, 4, CACTUSCOLOR);
    drawRect(row + 12, col + 4, 4, 3, CACTUSCOLOR);
    drawRect(row, col + 7, 30, 6, CACTUSCOLOR);
    drawRect(row + 15, col + 13, 4, 3, CACTUSCOLOR);
    drawRect(row + 10, col + 16, 9, 4, CACTUSCOLOR);
}

// Erase a cactus at specified col
void eraseCactus(int col) {

    int row = 72;
    drawRect(row, col, 100 - row, 20, SKYCOLOR);
    drawRect(100, col, 30 - (100 - row), 20, SANDCOLOR);
}

// Move the cacti to the right, and loop around the screen
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