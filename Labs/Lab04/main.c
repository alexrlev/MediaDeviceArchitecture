#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();

// State Prototypes
// TODO 1.2: Add your state and state transition function prototypes here
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();


// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;


// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        // TODO 1.0: Make the state machine here
        switch(state) {

            case START:
                start();
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
        }
        
               
    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    // TODO 1.3: Call your goToStart function here
    goToStart();

}

// TODO 1.1: Make your state and state transition functions

//start state
void goToStart() {

    fillScreen(CYAN);
    state = START;

    //random seed
    seed = 0;

}

void start() {

    seed++;

    waitForVBlank();

    //START -> game
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
}


//game state
void goToGame() {

    fillScreen(BLACK);
    state = GAME;
}

void game() {

    updateGame();
    waitForVBlank();
    drawGame();
    
    //START -> pause
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    //A -> win
    if (ballsRemaining == 0) {
         goToWin();
    }
    //B -> lose
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
}

//pause state
void goToPause() {

    fillScreen(GRAY);
    state = PAUSE;
}

void pause() {

    //START -> game
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    //SELECT -> start
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

//win state:)
void goToWin() {

    fillScreen(GREEN);
    state = WIN;
}

void win() {

    //START -> start
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

//lose state:(
void goToLose() {

    fillScreen(RED);
    state = LOSE;
}

void lose() {

    //START -> start
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}