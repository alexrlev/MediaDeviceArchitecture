#include "myLib.h"
// TODO 2.0: Include your .h files here.
#include "bg.h"
#include "spritesheet.h"


void initialize();

unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];

typedef struct {
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} ANISPRITE;

ANISPRITE pikachu;

// States used for pikachu.aniState
// Idle does not have an actual image associated with it;
// Whenever pikachu is idle, just show whatever state pikachu was before (prevAniState)
enum { PIKAFRONT, PIKABACK, PIKARIGHT, PIKALEFT, PIKAIDLE};

int main() {

    initialize(); 

	while(1) {

		pikachu.prevAniState = pikachu.aniState;
		pikachu.aniState = PIKAIDLE;

        if(pikachu.aniCounter % 20 == 0) {
			
			pikachu.curFrame = (pikachu.curFrame + 1) % pikachu.numFrames;
		}
		
        
		if(BUTTON_HELD(BUTTON_UP)) {
			
			pikachu.aniState = PIKABACK; 
			vOff--;
		}
		if(BUTTON_HELD(BUTTON_DOWN)) {
			
			pikachu.aniState = PIKAFRONT; 
			vOff++;
		}
		if(BUTTON_HELD(BUTTON_LEFT)) {
			
			pikachu.aniState = PIKALEFT; 
			hOff--;
		}
		if(BUTTON_HELD(BUTTON_RIGHT)) {
			
			pikachu.aniState = PIKARIGHT; 
			hOff++;
		}

		if (pikachu.aniState == PIKAIDLE) {
			pikachu.curFrame = 0;
			pikachu.aniCounter = 0;
			pikachu.aniState = pikachu.prevAniState;
		} else {
			pikachu.aniCounter++;
		}

        shadowOAM[0].attr0 = pikachu.row | ATTR0_SQUARE;
        shadowOAM[0].attr1 = pikachu.col | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(pikachu.curFrame * 2, pikachu.aniState * 2);
    	
    	DMANow(3, &shadowOAM, OAM, 128*4);

		waitForVBlank();

        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;
	}

	return 0;
}


void initialize() {

    // TODO 2.1: Load the Background's Palette and the Tiles/Map into the appropriate CHARBLOCK and SCREENBLOCK
	DMANow(3, bgPal, PALETTE, bgPalLen);
	DMANow(3, bgTiles, &CHARBLOCK[0], bgTilesLen/2);
	DMANow(3, bgMap, &SCREENBLOCK[28], bgMapLen/2);
    
    // TODO 3.0: Load the spritesheet Tiles and Pal into their correct spaces in memory
    // (Remember Sprite Palette and Background Palette are 2 different things)
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);

    // TODO 3.2: Hide all sprites with hideSprites().  You must complete this function yourself in myLib.c.
    hideSprites();
    
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; // TODO 3.3: Enable Sprites here
    
    // TODO 2.2: Set up Background 0
    REG_BG0CNT = BG_SIZE_LARGE | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    pikachu.width = 16;
    pikachu.height = 16;
    pikachu.rdel = 1;
    pikachu.cdel = 1;
	pikachu.row = SCREENHEIGHT/2-pikachu.width/2;
	pikachu.col = SCREENWIDTH/2-pikachu.height/2;

	// TODO 4.0: Just read this (carefully).  No code needs to be edited here.
	/*	=== Animation Variables ===
	*	aniCounter: Used to count how many frames have passed
	*	curFrame: which frame of animation pikachu is in (row in spritesheet)
    *   numFrames: the total number of frames
	*	aniState: which state of animation pikachu is in (column in spritesheet)
	*/
	pikachu.aniCounter = 0;
    pikachu.curFrame = 0;
    pikachu.numFrames = 3;

	pikachu.aniState = PIKAFRONT; 

    buttons = BUTTONS;
    
    // Because why not start here?
	hOff = 0;
	vOff = 100;

}