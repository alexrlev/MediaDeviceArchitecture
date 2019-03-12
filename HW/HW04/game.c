#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "brick.h"

// Variables
PLAYER player1;
PLAYER player2;
BLOCK blocks[BLOCKCOUNT];
BALL balls[BALLCOUNT];
int blocksRemaining;
int losing;

void initGame() {

	initPlayer();
    initBlocks();
    initBalls();

	blocksRemaining = BLOCKCOUNT;

    unsigned short colors[NUMCOLORS] = {BLACK, PURPLE, RED, WHITE, YELLOW};

    DMANow(3, brickPal, PALETTE, brickPalLen);

    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

    losing = 0;
}

// Updates the game each frame
void updateGame() {

	updatePlayer();

	// Update all the balls
	for (int i = 0; i < BALLCOUNT; i++)
		updateBall(&balls[i]);
}

// Draws the game each frame
void drawGame() {

	fillScreen4(PURPLEID);
	drawPlayer();

	// Draw all the bullets
	for (int i = 0; i < BLOCKCOUNT; i++)
		drawBlock(&blocks[i]);

	// Draw all the balls
	for (int i = 0; i < BALLCOUNT; i++)
		drawBall(&balls[i]);
}

// Initialize the player
void initPlayer() {
	
	//player 1
	player1.row = 146;
	player1.col = 120;
	player1.cdel = 1;
	player1.height = 2;
	player1.width = 27;
	player1.color = BLACKID;
	
	//player 2
	player2.row = 146;
	player2.col = 60;
	player2.cdel = 1;
	player2.height = 2;
	player2.width = 27;
	player2.color = REDID;
}

// Handle every-frame actions of the player
void updatePlayer() {

	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT)
		&& player1.col >= 1) {

		player1.col -= player1.cdel;

	} else if (BUTTON_HELD(BUTTON_RIGHT)
		&& player1.col + player1.width - 1 < SCREENWIDTH - player1.cdel) {
		
		player1.col += player1.cdel;
	}

	if (BUTTON_HELD(BUTTON_B)
		&& player2.col >= 1) {

		player2.col -= player2.cdel;

	} else if (BUTTON_HELD(BUTTON_A)
		&& player2.col + player2.width - 1 < SCREENWIDTH - player2.cdel) {

		player2.col += player2.cdel;

	}
}

// Draw the player
void drawPlayer() {

	drawRect4(player1.row, player1.col, player1.height, player1.width, player1.color);
	drawRect4(player2.row, player2.col, player2.height, player2.width, player2.color);
}

// Initialize the pool of bullets
void initBlocks() {

	for (int i = 0; i < BLOCKCOUNT; i++) {

		blocks[i].height = 9;
		blocks[i].width = 9;
		blocks[i].row = rand() % 50 + 2;
		blocks[i].col = rand()%220;
		blocks[i].active = 1;
	}
}

// Draw a bullet
void drawBlock(BLOCK* b) {

	if(b->active) {
		drawImage4(b->row, b->col, b->height, b->width, brickBitmap);
	}
}

// Initialize the balls
void initBalls() {

	for (int i = 0; i < BALLCOUNT; i++) {

		balls[i].height = 7;
		balls[i].width = 7;
		balls[i].row = 120;
		balls[i].col = rand() % 130 + 10;
		balls[i].rdel = -1;
		balls[i].cdel = 1;
		balls[i].color = YELLOWID;
		balls[i].active = 1;
	}
}

// Handle every-frame actions of a ball
void updateBall(BALL* b) {

	if (b->active) {

		//bounce rectangle off walls
		if ((b->row <= 0) || ((b->row + b->height - 1) >= (SCREENHEIGHT - 1))) {
			b->rdel *= -1;
		}
		if ((b->col <= 0) || ((b->col + b->width - 1) >= (SCREENWIDTH - 1))) {
			b->cdel *= -1;
		}

		//bounce balls off text
		if ((b->col < 89) && ((b->row + b->height) > 150)) {
			b->rdel = -1;
		}

		//bounce rectangle off paddle
		if (collision(b->row, b->col, b->height, b->width, 
				player1.row, player1.col, player1.height, player1.width) == 1) {
			b->rdel = -1;
		}

		if (collision(b->row, b->col, b->height, b->width, 
				player2.row, player2.col, player2.height, player2.width) == 1) {
			if ((b->col == player2.col + player2.width - 1) || (b->col + b->width - 1 == player2.col)) {
				b->cdel *= -1;
			}
			b->rdel *= -1;
		}

		if ((b->row + b->height) >= 159) 
			losing = 1;

		// Handle ball-bullet collisions
		for (int i = 0; i < BLOCKCOUNT; i++) {
			if (blocks[i].active && collision(b->row, b->col, b->height, b->width,
				blocks[i].row, blocks[i].col, blocks[i].height, blocks[i].width)) {

				b->rdel *= -1;
				blocks[i].active = 0;
				blocksRemaining--;
			}
		}

		// Move the ball
		b->row += b->rdel;
		b->col += b->cdel;
	}
}

// Draw a ball
void drawBall(BALL* b) {

	if(b->active) 
		drawRect4(b->row, b->col, b->height, b->width, b->color);
}