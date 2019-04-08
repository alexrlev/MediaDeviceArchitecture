#include "myLib.h"
#include "sampleBackground.h"
#include "frontground.h"
#include "game.h"

void initialize();
void goToGame();
void game();
void goToStart();
void start();
void goToInstr();
void instr();
void goToPause();
void pause();
void goToLose();
void lose();

unsigned short buttons;
unsigned short oldButtons;

//states
typedef enum {START, INSTR, GAME, PAUSE, WIN, LOSE} states;
states state;

int hOff;

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
            case LOSE:
                lose();
                break;
            default:
                break;
        }
		
		oldButtons = buttons;
		buttons = BUTTONS;
	}
}

void initialize() {

	unsigned short colors[NUMCOLORS] = {BLACK, RED, WHITE, YELLOW};
	
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;

	REG_BG1CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

	DMANow(3, sampleBackgroundPal, PALETTE, 256);

	DMANow(3, sampleBackgroundTiles, &CHARBLOCK[0], sampleBackgroundTilesLen/2);

	DMANow(3, sampleBackgroundMap, &SCREENBLOCK[28], 1024/2);

	DMANow(3, frontgroundTiles, &CHARBLOCK[1], frontgroundTilesLen/2);

	DMANow(3, frontgroundMap, &SCREENBLOCK[30], frontgroundMapLen/2);
	
	hOff = 0;

	buttons = BUTTONS;

	goToStart();
}

void goToStart() {
	state = START;
	waitForVBlank();
	flipPage();
}

void start() {

	waitForVBlank();
	//drawString4(10, 10, "Start!", BLACKID);

	if(BUTTON_PRESSED(BUTTON_START)) {
		goToInstr();
	}
}

void goToInstr() {
	state = INSTR;
	waitForVBlank();
	flipPage();
}

void instr () {

	waitForVBlank();
	//drawString4(10, 10, "Instructions", BLACKID);

	if(BUTTON_PRESSED(BUTTON_START)) {	
		goToGame();
	}
}

void goToGame() {
	state = GAME;
	waitForVBlank();
	flipPage();
}

void game() {

	hOff++;

	REG_BG1HOFF = hOff / 2;
	REG_BG0HOFF = hOff;  

	waitForVBlank();
	flipPage();

	if(BUTTON_PRESSED(BUTTON_START)) {
		goToPause();
	}
	if(BUTTON_PRESSED(BUTTON_A)) {
		goToLose();
	}
}

void goToPause() {
	state = PAUSE;	
	waitForVBlank();
	flipPage();
}

void pause() {

	waitForVBlank();
	//drawString4(10, 10, "Paused", BLACKID);

	if(BUTTON_PRESSED(BUTTON_START)) {				
		goToGame();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)) {		
		goToStart();
	}
}

void goToLose() {
	state = LOSE;	
	waitForVBlank();
	flipPage();
}

void lose() {

	waitForVBlank();

	if(BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}