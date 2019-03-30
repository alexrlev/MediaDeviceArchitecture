#include "myLib.h"
#include "bg.h"
#include "bgStart.h"
#include "bgLose.h"
#include "bgWin.h"
#include "game.h"
#include "spritesheet.h"

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

unsigned short buttons;
unsigned short oldButtons;

//states
typedef enum {START, GAME, PAUSE, WIN, LOSE} states;
states state;

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
		waitForVBlank();
	}

	return 0;
}


void initialize() {
    
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    

    hideSprites();

    goToStart();

    oldButtons = 0;
    buttons = BUTTONS;
}

void goToStart() {

    REG_BG0CNT = BG_SIZE_LARGE | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	DMANow(3, bgStartPal, PALETTE, bgStartPalLen);
	DMANow(3, bgStartTiles, &CHARBLOCK[0], bgStartTilesLen/2);
	DMANow(3, bgStartMap, &SCREENBLOCK[28], bgStartMapLen/2);

	DMANow(3, shadowOAM, OAM, 128 * 4);

	waitForVBlank();

	state = START;
}
void start() {
	
	seed++;

	waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    	initGame();
}
void goToGame(){
	
	REG_BG0CNT = BG_SIZE_LARGE | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	DMANow(3, bgPal, PALETTE, bgPalLen);
	DMANow(3, bgTiles, &CHARBLOCK[0], bgTilesLen/2);
	DMANow(3, bgMap, &SCREENBLOCK[28], bgMapLen/2);
	
	waitForVBlank();

	state = GAME;
}
void game(){

	updateGame();
	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START))
        goToPause();

     if (livesRemaining <= 0)
    	goToLose();

    if (enemiesRemaining == 0)
    	goToWin();
}
void goToPause(){

	hideSprites();

	waitForVBlank();
    
	state = PAUSE;
}
void pause(){

	waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();

 	if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}
void goToWin(){

	REG_BG0CNT = BG_SIZE_LARGE | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	DMANow(3, bgWinPal, PALETTE, bgWinPalLen);
	DMANow(3, bgWinTiles, &CHARBLOCK[0], bgWinTilesLen/2);
	DMANow(3, bgWinMap, &SCREENBLOCK[28], bgWinMapLen/2);

	hideSprites();

	state = WIN;
}
void win(){

	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}
void goToLose(){

	REG_BG0CNT = BG_SIZE_LARGE | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	DMANow(3, bgLosePal, PALETTE, bgLosePalLen);
	DMANow(3, bgLoseTiles, &CHARBLOCK[0], bgLoseTilesLen/2);
	DMANow(3, bgLoseMap, &SCREENBLOCK[28], bgLoseMapLen/2);

	hideSprites();

	state = LOSE;
}
void lose(){

	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}