#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "wall.h"


//prototypes
void initialize();
void goToStart();
void start();
void goToInstr();
void instr();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// variables
unsigned short buttons;
unsigned short oldButtons;
unsigned short textColor;

//states
typedef enum {START, INSTR, GAME, PAUSE, WIN, LOSE} states;
states state;

//random seed
int seed;

// Text Buffer
char buffer[41];

int main() {

    initialize();

    while(1) {

        oldButtons = buttons;
        buttons = BUTTONS;
                
        //state machine
        switch(state) {
            case START:
                start();
                break;
            case INSTR:
                instr();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
            default:
                break;
        }
               
    }
}

void initialize() {

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    goToStart();

    oldButtons = 0;
    buttons = BUTTONS;
}

void goToStart() {

    unsigned short colors[NUMCOLORS] = {BLACK, PURPLE, RED, WHITE, YELLOW};

    DMANow(3, wallPal, PALETTE, 256);

    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

    drawFullscreenImage4(wallBitmap);

    drawRect4(75, 59, 10, 122, WHITEID);
    drawString4(76, 60, "Press Start to Begin", BLACKID);
    waitForVBlank();
    flipPage();

    state = START;
}

void start() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {

        goToInstr();
    }
}

void goToInstr() {
    
    fillScreen4(PURPLEID);
    drawString4(10, 10, "Press A and B to control", WHITEID);
        drawString4(20, 20, "the Red player", WHITEID);
    drawString4(40, 10, "Press Right and Left to control", WHITEID);
        drawString4(50, 20, "the Black player", WHITEID);
    drawString4(70, 10, "Don't let any blocks hit", WHITEID);
        drawString4(80, 20, "the bottom of the screen", WHITEID);
    drawString4(100, 10, "Burst all the bricks to win", WHITEID);
    drawString4(125, 10, "Press Start to Begin!", WHITEID);

    waitForVBlank();
    flipPage();

    state = INSTR;

    seed = 0;
}

void instr() {
    seed++;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
}

void goToGame() {

    state = GAME;
}

void game() {

    updateGame();
    drawGame();

    drawHorizontalLine4(150, 0, 88, WHITEID);
    drawVerticalLine4(150, 88, 10, WHITEID);
    sprintf(buffer, "Bricks Left: %d", blocksRemaining);
    drawString4(152, 2, buffer, WHITEID);

    waitForVBlank();
    flipPage();

    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    else if (blocksRemaining == 0)
        goToWin();
    else if (losing)
        goToLose();
}

void goToPause() {

    fillScreen4(PURPLEID);
    drawString4(10, 10, "Pause", BLACKID);
    drawString4(30, 10, "Press Start to resume game", WHITEID);
    drawString4(40, 10, "Prese Select to restart", WHITEID);

    waitForVBlank();
    flipPage();

    state = PAUSE;
}

void pause() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

void goToWin() {

    fillScreen4(PURPLEID);
    drawString4(10, 10, "You win!!", BLACKID);
    drawString4(30, 10, "Press Start to play again", WHITEID);

    waitForVBlank();
    flipPage();

    state = WIN;
}

void win() {
    
    waitForVBlank();
 
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}

// Sets up the lose state
void goToLose() {

    fillScreen4(PURPLEID);
    //drawRect4(142, 41, 8, 6, DARKGREENID);

    drawString4(10, 10, "You lose", BLACKID);
    drawString4(30, 10, "Press Start to play again", WHITEID);

    waitForVBlank();
    flipPage();    

    state = LOSE;
}

void lose() {
     
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) 
        goToStart();
}