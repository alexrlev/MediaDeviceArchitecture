#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"

//prototypes
void initialize();
void drawBackground();
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
		
		oldButtons= buttons;
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
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	goToStart();

	oldButtons = 0;
	buttons = BUTTONS;
}

void drawBackground() {
	fillScreen(DARKGREEN);

	//draw goal
	for (int i = 0; i < 4; i++) {
		drawHorizontalLine(139 + (7*i), 70, 100, WHITE);	
	}
	for (int i = 0; i < 9; i++) {
		drawVerticalLine(139, 80 + (10*i), 21, WHITE);	
	}
	drawVerticalLine(139, 70, 21, RED);
	drawVerticalLine(139, 170, 21, RED);
}

void goToStart() {
	drawBackground();
	state = START;

	drawString(20, 10, "Skeet Soccer", BLACK);
	drawHorizontalLine(28, 10, 72, BLACK);
	drawString(40, 10, "Press Start to Continue", WHITE);
}

void start() {
	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstr();
    }

}

void goToInstr() {
	drawBackground();
	state = INSTR;

	drawString(30, 10, "Press A to shoot soccer balls", WHITE);
	drawString(40, 10, "Press Start to pause game", WHITE);
	drawString(50, 10, "Don't let any balls enter the goal", WHITE);
	drawString(70, 10, "Press Start to Begin!", WHITE);

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
	drawBackground();

	state = GAME;

	drawString(140, 5, "Balls ", BLACK);
	drawString(150, 5, "Left: ", BLACK);
}

void game() {
	updateGame();

	waitForVBlank();
	drawGame();

	drawBox(150, 41, 8, 6, DARKGREEN);
    drawChar(150, 41, ballsRemaining + '0', BLACK);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    } else if (ballsRemaining == 0) {
        goToWin();
    } else if (losing) {
    	goToLose();
    }

}

void goToPause() {
	drawBackground();

	drawString(10, 10, "Pause", BLACK);
	drawString(30, 10, "Press Start to resume game", WHITE);
	drawString(40, 10, "Prese Select to restart", WHITE);

	state = PAUSE;
}

void pause() {
	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
	} else if (BUTTON_PRESSED(BUTTON_SELECT)){
        goToStart();
	}
}

void goToWin() {
	drawBackground();

	drawString(10, 10, "You win!!", BLACK);
	drawString(30, 10, "Press Start to play again", WHITE);

	state = WIN;

}

void win() {
	waitForVBlank();

	if(BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}

void goToLose() {
	drawBackground();
	drawBox(142, 41, 8, 6, DARKGREEN);

	drawString(10, 10, "You lose", BLACK);
	drawString(30, 10, "Press Start to play again", WHITE);

	state = LOSE;
}

void lose() {
	waitForVBlank();

	if(BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}