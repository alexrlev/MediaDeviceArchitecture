#include "myLib.h"
#include "background.h"
#include "startGround.h"
#include "instrGround.h"
#include "game.h"
#include "spritesheet.h"
#include "pauseGround.h"
#include "loseGround.h"
#include "frontground.h"
#include "winGround.h"
#include "softJazz.h"
#include "cheatGround.h"
#include "numberSheet.h"

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
void goToWin();
void win();
void goToCheat();
void cheat();

unsigned short buttons;
unsigned short oldButtons;

int highScore;
int foodCounter;

OBJ_ATTR shadowOAM[128];

// sound
SOUND soundA;

//states
typedef enum {START, INSTR, GAME, CHEAT, PAUSE, WIN, LOSE} states;
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
            case INSTR:
                instr();
                break;
            case GAME:
                game();
                break;
            case CHEAT:
            	cheat();
            	break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
            case WIN:
            	win();
            	break;
            default:
                break;
        }
	}
}

void initialize() {

	waitForVBlank();

	highScore = 0;
	
	setupSounds();
	setupInterrupts();

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	
	goToStart();
}

void goToStart() {

	waitForVBlank();

	playSoundA(softJazz, SOFTJAZZLEN, SOFTJAZZFREQ, 1);

	DMANow(3, startGroundPal, PALETTE, 256);
	DMANow(3, startGroundTiles, &CHARBLOCK[0], startGroundTilesLen/2);
	DMANow(3, startGroundMap, &SCREENBLOCK[28], startGroundMapLen/2);

	DMANow(3, numberSheetTiles, &CHARBLOCK[4], numberSheetTilesLen/2);
    DMANow(3, numberSheetPal, SPRITEPALETTE, numberSheetPalLen/2);
    hideSprites();

	REG_BG0VOFF = 0;
	REG_BG0HOFF = 0;

	REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	
	state = START;
}

void start() {

	waitForVBlank();

	int temp = highScore;
	int i = 0;
    do {
        shadowOAM[50 + i].attr0 = (ROWMASK & 152) | ATTR0_SQUARE;
        shadowOAM[50 + i].attr1 = (COLMASK & (53 - 4*i)) | ATTR1_SMALL;
        shadowOAM[50 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((temp % 10) * 2, 0);
        temp /= 10;
        i++;
    } while (temp);
    DMANow(3, shadowOAM, OAM, 128*4);


	if(BUTTON_PRESSED(BUTTON_START)) {
		goToInstr();
	}
}

void goToInstr() {
	
	waitForVBlank();

	hideSprites();

	REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
	
	DMANow(3, instrGroundPal, PALETTE, 256);
	DMANow(3, instrGroundTiles, &CHARBLOCK[0], instrGroundTilesLen/2);
	DMANow(3, instrGroundMap, &SCREENBLOCK[31], instrGroundMapLen/2);

	state = INSTR;
}

void instr () {

	waitForVBlank();

	if(BUTTON_PRESSED(BUTTON_SELECT)) {	
		goToStart();
	}
	if(BUTTON_PRESSED(BUTTON_START)) {	
		state = GAME;
		goToGame();
		initGame();
	}
}

void goToGame() {

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE | BG1_ENABLE;

	REG_BG1CNT = BG_SIZE_SMALL| BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(26) | BG_PRIORITY(2);
	DMANow(3, backgroundPal, PALETTE, 256);
	DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen/2);
	DMANow(3, backgroundMap, &SCREENBLOCK[26], backgroundMapLen/2);

	REG_BG0CNT = BG_SIZE_WIDE | BG_4BPP | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_PRIORITY(0);
	DMANow(3, frontgroundTiles, &CHARBLOCK[1], frontgroundTilesLen/2);
	DMANow(3, frontgroundMap, &SCREENBLOCK[30], frontgroundMapLen/2);
	REG_BG0VOFF = vFOff;
    REG_BG0HOFF = hFOff;
	
	REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    hideSprites();

    foodPrice = 10;
    couponPrice = 5;

    waitForVBlank();

	state = GAME;
}

void game() {

	updateGame();
	drawGame();

	if(BUTTON_PRESSED(BUTTON_B)) {
		goToCheat();
    }
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToPause();
	}
	if(moneyCounter <= 0) {
		goToLose();
	}
	if(winBool) {
		goToWin();
	}
}

void goToCheat() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE | BG1_ENABLE;

	REG_BG1CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(26) | BG_PRIORITY(2);
	DMANow(3, backgroundPal, PALETTE, 256);
	DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen/2);
	DMANow(3, backgroundMap, &SCREENBLOCK[26], backgroundMapLen/2);

	REG_BG0CNT = BG_SIZE_WIDE | BG_4BPP | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_PRIORITY(0);
	DMANow(3, cheatGroundTiles, &CHARBLOCK[1], cheatGroundTilesLen/2);
	DMANow(3, cheatGroundMap, &SCREENBLOCK[30], cheatGroundMapLen/2);
	REG_BG0VOFF = vFOff;
    REG_BG0HOFF = hFOff;

	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    hideSprites();
	
	REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;

    foodPrice = 1;
    couponPrice = 0;
	
	state = CHEAT;
}

void cheat() {

	updateGame();
	drawGame();

	if(BUTTON_PRESSED(BUTTON_B)) {
		goToGame();
    }
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToPause();
	}
	if(moneyCounter <= 0) {
		goToLose();
	}
	if(winBool) {
		goToWin();
	}
}

void goToPause() {
	
	waitForVBlank();

	hideSprites();

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

	DMANow(3, pauseGroundPal, PALETTE, 256);
	DMANow(3, pauseGroundTiles, &CHARBLOCK[0], pauseGroundTilesLen/2);
	DMANow(3, pauseGroundMap, &SCREENBLOCK[28], pauseGroundMapLen/2);

	REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

	state = PAUSE;	
}

void pause() {

	waitForVBlank();

	if(BUTTON_PRESSED(BUTTON_START)) {				
		goToGame();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)) {		
		goToStart();
	}
}

void goToLose() {
	
	waitForVBlank();

	hideSprites();

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

	DMANow(3, loseGroundPal, PALETTE, 256);
	DMANow(3, loseGroundTiles, &CHARBLOCK[0], loseGroundTilesLen/2);
	DMANow(3, loseGroundMap, &SCREENBLOCK[31], loseGroundMapLen/2);

	REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

	state = LOSE;
}

void lose() {

	waitForVBlank();

	if(BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}

void goToWin() {
	
	waitForVBlank();

	hideSprites();

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

	DMANow(3, winGroundPal, PALETTE, 256);
	DMANow(3, winGroundTiles, &CHARBLOCK[0], winGroundTilesLen/2);
	DMANow(3, winGroundMap, &SCREENBLOCK[31], winGroundMapLen/2);

	DMANow(3, numberSheetTiles, &CHARBLOCK[4], numberSheetTilesLen/2);
    DMANow(3, numberSheetPal, SPRITEPALETTE, numberSheetPalLen/2);
    hideSprites();

	REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    if (foodCounter > highScore) {
    	highScore = foodCounter;
    }

    int i = 0;
    do {
        shadowOAM[60 + i].attr0 = (ROWMASK & 153) | ATTR0_SQUARE;
        shadowOAM[60 + i].attr1 = (COLMASK & (39 - 4*i)) | ATTR1_SMALL;
        shadowOAM[60 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((foodCounter % 10) * 2, 0);
        foodCounter /= 10;
        i++;
    } while (foodCounter);
    DMANow(3, shadowOAM, OAM, 128*4);

	state = WIN;
}

void win() {

	waitForVBlank();

	if(BUTTON_PRESSED(BUTTON_START)) {
		goToStart();
	}
}