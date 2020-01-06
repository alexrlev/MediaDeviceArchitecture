#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "collisionMap.h"
#include "spritesheet.h"
#include "chaChing.h"

// sounds
SOUND soundB;

// Variables
int hOff;
int vOff;
int hFOff;
int vFOff;
int winBool;

// Sprites
ANISPRITE person;

FOOD can;
FOOD apple;
FOOD poptart;

COUPON yellow;
COUPON pink;

CASHIER cashier;

// Food & coupon variables
int foodCounter;
int moneyCounter;
int foodPrice;
int couponPrice;

OBJ_ATTR shadowOAM[128];

// person animation states for aniState
enum {PERSONFRONT, PERSONBACK, PERSONRIGHT, PERSONLEFT, PERSONIDLE};

// coupon animation states
enum {COUPONLEFT, COUPONSTRAIGHT, COUPONRIGHT};

// Initialize the game
void initGame() {

	// Place screen on map
    vOff = 0;
    hOff = 0;

    hFOff = 65;
    vFOff = 65;

    moneyCounter = 35;
    foodCounter = 0;

    foodPrice = 10;
    couponPrice = 5;

    winBool = 0;

    srand(78);

    initPlayer();
    initCashier();
    initFood();
    initCoupons();
}

// Updates the game each frame
void updateGame() {

   	updatePlayer();
    updateFood();
    updateCoupons();
}

// Draws the game each frame
void drawGame() {

    drawPlayer();
    drawCashier();
    drawFood();
    drawCoupons();
    drawScore();

    waitForVBlank();
    
    DMANow(3, shadowOAM, OAM, 128*4);

    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;

    REG_BG0HOFF = hFOff;
    REG_BG0VOFF = vFOff;
}

void drawScore() {
    shadowOAM[6].attr0 = (ROWMASK & 1) | ATTR0_SQUARE;
    shadowOAM[6].attr1 = (COLMASK & 1) | ATTR1_SMALL;
    shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14, 0) | ATTR2_PRIORITY(0);
    int foodTemp = foodCounter;
    int tempCol = 8;
    int i = 0;
    do {
        shadowOAM[7 + i].attr0 = (ROWMASK & 5) | ATTR0_SQUARE;
        shadowOAM[7 + i].attr1 = (COLMASK & tempCol) | ATTR1_SMALL;
        shadowOAM[7 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((foodTemp % 10) * 2, 8) | ATTR2_PRIORITY(0);
        foodTemp /= 10;
        tempCol -= 4;
        i++;
    } while (foodTemp);
    int moneyTemp = moneyCounter;
    tempCol = 234;
    i = 0;
    do {
        shadowOAM[20 + i].attr0 = (ROWMASK & 2) | ATTR0_SQUARE;
        shadowOAM[20 + i].attr1 = (COLMASK & tempCol) | ATTR1_SMALL;
        shadowOAM[20 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((moneyTemp % 10) * 2, 8) | ATTR2_PRIORITY(0);
        moneyTemp /= 10;
        tempCol -= 4;
        i++;
    } while (moneyTemp);
    shadowOAM[20 + i].attr0 = (ROWMASK & 1) | ATTR0_SQUARE;
    shadowOAM[20 + i].attr1 = (COLMASK & (tempCol - 2)) | ATTR1_SMALL;
    shadowOAM[20 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 8) | ATTR2_PRIORITY(0);
}

// Initialize the player
void initPlayer() {

    person.width = 5;
    person.height = 12;
    person.rdel = 1;
    person.cdel = 1;
    person.hide = 0;
    person.worldRow = 1;
    person.worldCol = 5;
    person.aniCounter = 0;
    person.curFrame = 0;
    person.numFrames = 2;
    person.aniState = PERSONFRONT;
}

// Handle every-frame actions of the player
void updatePlayer() {

    if(BUTTON_HELD(BUTTON_UP)) {
        if (person.worldRow > 0 && collisionMapBitmap[OFFSET((person.worldRow - person.rdel), person.worldCol, 256)]
        	&& collisionMapBitmap[OFFSET((person.worldRow - person.rdel), (person.worldCol + person.width - person.cdel), 256)]) {
        	// Update person's world position if the above is true
        	person.worldRow--;
            if (vOff > 0 && person.screenRow < SCREENHEIGHT / 2) {
                // Update background offset variable if the above is true
        		vOff--;
            } else {
                vFOff++;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (person.worldRow + person.height < 256 && collisionMapBitmap[OFFSET((person.worldRow + person.height), person.worldCol, 256)]
        	&& collisionMapBitmap[OFFSET((person.worldRow + person.height), (person.worldCol + person.width - person.cdel), 256)]) {
        	// Update person's world position if the above is true
        	person.worldRow++;
            if (vOff < 96 && person.screenRow > SCREENHEIGHT / 2) {
                // Update background offset variable if the above is true
        		vOff++;
            } else {
                vFOff--;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (person.worldCol > 0 && collisionMapBitmap[OFFSET(person.worldRow, (person.worldCol - person.cdel), 256)]
        && collisionMapBitmap[OFFSET((person.worldRow + person.height - person.rdel), (person.worldCol), 256)]) {
        	// Update person's world position if the above is true
			person.worldCol--;
            if (hOff > 0 && person.screenCol < SCREENWIDTH / 2) {
                // Update background offset variable if the above is true
            	hOff--;
            } else {
                hFOff++;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (person.worldCol + person.width < 256 && collisionMapBitmap[OFFSET(person.worldRow, (person.worldCol + person.width + 1), 256)]
        && collisionMapBitmap[OFFSET((person.worldRow + person.height - person.rdel), (person.worldCol + person.width), 256)]) {
            // Update person's world position if the above is true
            person.worldCol++;
            if (hOff < 16 && person.screenCol > SCREENWIDTH / 2) {
                // Update background offset variable if the above is true
                hOff++;
            } else {
                hFOff--;
            }
        }
    }

    person.screenRow = person.worldRow - vOff;
    person.screenCol = person.worldCol - hOff;

    animatePlayer();
    testCollisions();
}

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    person.prevAniState = person.aniState;
    person.aniState = PERSONIDLE;

    // Change the animation frame every 20 frames of gameplay
    if(person.aniCounter % 20 == 0) {
        person.curFrame = (person.curFrame + 1) % person.numFrames;
    }
    
    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_UP))
        person.aniState = PERSONBACK;
    if(BUTTON_HELD(BUTTON_DOWN))
        person.aniState = PERSONFRONT;
    if(BUTTON_HELD(BUTTON_LEFT))
        person.aniState = PERSONLEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        person.aniState = PERSONRIGHT;

    // If the person aniState is idle, frame is person standing
    if (person.aniState == PERSONIDLE) {
        person.curFrame = 0;
        person.aniCounter = 0;
        person.aniState = person.prevAniState;
    } else {
        person.aniCounter++;
    }
}

// Test if person collides with item
void testCollisions() {
    //reduce money by 10, increase foodCount by 1 if collide with food
    if (can.active && collision(person.screenRow, person.screenCol, person.height, person.width, (can.row - vOff), (can.col - hOff), can.height, can.width)) {
        moneyCounter -= foodPrice;
        foodCounter++;
        can.active = 0;
        can.timer = 0;
        playSoundB(chaChing, CHACHINGLEN, CHACHINGFREQ, 0);
    }
    if (apple.active && collision(person.screenRow, person.screenCol, person.height, person.width, (apple.row - vOff), (apple.col - hOff), apple.height, apple.width)) {
        moneyCounter -= foodPrice;
        foodCounter++;
        apple.active = 0;
        apple.timer = 0;
        playSoundB(chaChing, CHACHINGLEN, CHACHINGFREQ, 0);
    }
    if (poptart.active && collision(person.screenRow, person.screenCol, person.height, person.width, (poptart.row - vOff), (poptart.col - hOff), poptart.height, poptart.width)) {
        moneyCounter -= foodPrice;
        foodCounter++;
        poptart.active = 0;
        poptart.timer = 0;
        playSoundB(chaChing, CHACHINGLEN, CHACHINGFREQ, 0);
    }

    //increase money by 5 if collide with coupon
    if (yellow.active && collision(person.screenRow, person.screenCol, person.height, person.width, (yellow.row - vOff), (yellow.col - hOff), yellow.height, yellow.width)) {
        moneyCounter += couponPrice;
        yellow.active = 0;
        yellow.timer = 0;
        playSoundB(chaChing, CHACHINGLEN, CHACHINGFREQ, 0);
    }
    if (pink.active && collision(person.screenRow, person.screenCol, person.height, person.width, (pink.row - vOff), (pink.col - hOff), pink.height, pink.width)) {
        moneyCounter += couponPrice;
        pink.active = 0;
        pink.timer = 0;
        playSoundB(chaChing, CHACHINGLEN, CHACHINGFREQ, 0);
    }

    //win by reaching the cashier
    if (collision(person.screenRow, person.screenCol, person.height, person.width, (cashier.row - vOff), (cashier.col - hOff), cashier.height, cashier.width)) {
    	winBool = 1;
    }
}

// Draw the player
void drawPlayer() {

    if (person.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & person.screenRow) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & person.screenCol) | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(person.curFrame * 2, person.aniState * 2) | ATTR2_PRIORITY(0);
    }
}

// Initialize cashier
void initCashier() {
    cashier.width = 5;
    cashier.height = 12;
    cashier.row = 210;
    cashier.col = 245;
}

// Draw cashier
void drawCashier() {
	shadowOAM[40].attr0 = (ROWMASK & (cashier.row - vOff)) | ATTR0_SQUARE;
    shadowOAM[40].attr1 = (COLMASK & (cashier.col - hOff)) | ATTR1_SMALL;
    shadowOAM[40].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(16, 0) | ATTR2_PRIORITY(1);
}

// Initialize food
void initFood() {

    can.width = 9;
    can.height = 12;
    can.active = 0;
    can.frame = 4;
    can.timer = 1;

    apple.width = 9;
    apple.height = 12;
    apple.active = 0;
    apple.frame = 5;
    apple.timer = 1;
    
    poptart.width = 9;
    poptart.height = 12;
    poptart.active = 0;
    poptart.frame = 6;
    poptart.timer = 1;
}

// Update food
void updateFood() {

    can.timer++;
    apple.timer++;
    poptart.timer++;

    if(can.timer == 90) {
        can.active = 1;
        can.row = (rand() % 50) + 20;
        can.col = 3;
    }
    if(apple.timer == 180) {
        apple.active = 1;
        apple.row = (rand() % 100) + 20;
        apple.col = (rand() % 40) + 111;
    }
    if(poptart.timer == 270) {
        poptart.active = 1;
        poptart.row = (rand() % 50) + 20;
        poptart.col = 180;
    }
}

// Draw food
void drawFood() {

    if (can.active == 1){
        shadowOAM[1].attr0 = (ROWMASK & (can.row - vOff)) | ATTR0_SQUARE;
        shadowOAM[1].attr1 = (COLMASK & (can.col - hOff)) | ATTR1_SMALL;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 0) | ATTR2_PRIORITY(1);
    } else {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    }
    if (apple.active == 1){
        shadowOAM[2].attr0 = (ROWMASK & (apple.row - vOff)) | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (COLMASK & (apple.col - hOff)) | ATTR1_SMALL;
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 0) | ATTR2_PRIORITY(1);
    } else {
        shadowOAM[2].attr0 |= ATTR0_HIDE;
    }
    if (poptart.active == 1){
        shadowOAM[3].attr0 = (ROWMASK & (poptart.row - vOff)) | ATTR0_SQUARE;
        shadowOAM[3].attr1 = (COLMASK & (poptart.col - hOff)) | ATTR1_SMALL;
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12, 0) | ATTR2_PRIORITY(1);
    } else {
        shadowOAM[3].attr0 |= ATTR0_HIDE;
    }
}
// Initialize coupons
void initCoupons() {
    
    yellow.width = 14;
    yellow.height = 11;
    yellow.active = 0;
    yellow.frame = 2;
    yellow.timer = 1;
    yellow.curFrame = 0;
    yellow.numFrames = 2;
    
    pink.width = 14;
    pink.height = 11;
    pink.active = 0;
    pink.frame = 3;
    pink.timer = 1;
    pink.curFrame = 0;
    pink.numFrames = 2;
}

// Update coupons
void updateCoupons() {
    
    yellow.timer++;
    pink.timer++;

    if(yellow.timer == 260) {
        yellow.active = 1;
        yellow.row = 5;
        yellow.col = (rand() % 200);
    }
    if(yellow.timer % 20 == 0) {
        yellow.curFrame = (yellow.curFrame + 1) % yellow.numFrames;
    }

    if(pink.timer == 460) {
        pink.active = 1;
        pink.row = 230;
        pink.col = (rand() % 200);
    }
    if(pink.timer % 20 == 0) {
        pink.curFrame = (pink.curFrame + 1) % pink.numFrames;
    }
}

// Draw coupons
void drawCoupons() {

    if (yellow.active == 1) {
        shadowOAM[4].attr0 = (ROWMASK & (yellow.row - vOff)) | ATTR0_SQUARE;
        shadowOAM[4].attr1 = (COLMASK & (yellow.col - hOff)) | ATTR1_SMALL;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, yellow.curFrame * 2) | ATTR2_PRIORITY(1);
    } else {
        shadowOAM[4].attr0 |= ATTR0_HIDE;
    }
    if (pink.active == 1) {
        shadowOAM[5].attr0 = (ROWMASK & (pink.row - vOff)) | ATTR0_SQUARE;
        shadowOAM[5].attr1 = (COLMASK & (pink.col - hOff)) | ATTR1_SMALL;
        shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, pink.curFrame * 2) | ATTR2_PRIORITY(1);
    } else {
        shadowOAM[5].attr0 |= ATTR0_HIDE;
    }
}
