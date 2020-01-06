#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
BALL balls[BALLCOUNT];
unsigned short bgColor;
int ballsRemaining;
int losing;

// Initialize game
void initGame() {

	initPlayer();
    initBullets();
    initBalls();

    bgColor = DARKGREEN;

    losing = 0;

    // Initialize score
	ballsRemaining = BALLCOUNT;
}

// Updates the game each frame
void updateGame() {

	updatePlayer();

	// Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullet(&bullets[i]);

	// Update all the balls
	for (int i = 0; i < BALLCOUNT; i++)
		updateBall(&balls[i]);
}

// Draws the game each frame
void drawGame() {

	drawPlayer();

	// Draw all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		drawBullet(&bullets[i]);

	// Draw all the balls
	for (int i = 0; i < BALLCOUNT; i++)
		drawBall(&balls[i]);
}

// Initialize the player
void initPlayer() {

	player.row = 130;
	player.col = 113;
	player.oldRow = player.row;
	player.oldCol = player.col;
	player.cdel = 1;
	player.height = 2;
	player.width = 20;
	player.color = BLACK;
	player.bulletTimer = 20;
}

// Handle every-frame actions of the player
void updatePlayer() {
	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A) && player.bulletTimer >= 20) {

		fireBullet();
		player.bulletTimer = 0;
	}

	player.bulletTimer++;
}

// Draw the player
void drawPlayer() {

	drawBox(player.oldRow, player.oldCol, player.height, player.width, DARKGREEN);
	drawBox(player.row, player.col, player.height, player.width, player.color);

	player.oldRow = player.row;
	player.oldCol = player.col;
}

// Initialize the pool of bullets
void initBullets() {

	for (int i = 0; i < BULLETCOUNT; i++) {

		bullets[i].height = 2;
		bullets[i].width = 1;
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].oldRow = player.row;
		bullets[i].oldCol = player.col;
		bullets[i].rdel = -2;
		bullets[i].color = WHITE;
		bullets[i].active = 0;
		bullets[i].erased = 1;
	}
}

// Spawn a bullet
void fireBullet() {

	// Find the first inactive bullet
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {

			// Position the new bullet
			bullets[i].row = player.row;
			bullets[i].col = player.col + player.width/2
				- bullets[i].width/2;

			// Take the bullet out of the pool
			bullets[i].active = 1;
			bullets[i].erased = 0;

			// Break out of the loop
			break;
		}
	}
}

// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {

	// If active, update; otherwise ignore
	if (b->active) {
		if (b->row + b->height-1 >= 0) {
			b->row += b->rdel;
		} else {
			b->active = 0;
		}
	}
}

// Draw a bullet
void drawBullet(BULLET* b) {

	if(b->active) {
		drawBox(b->oldRow, b->oldCol, b->height, b->width, DARKGREEN);
		drawBox(b->row, b->col, b->height, b->width, b->color);
	} else if (!b->erased) {
		drawBox(b->oldRow, b->oldCol, b->height, b->width, DARKGREEN);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}

// Initialize the balls
void initBalls() {

	for (int i = 0; i < BALLCOUNT; i++) {

		balls[i].height = 7;
		balls[i].width = 7;
		balls[i].row = 15;
		balls[i].col = rand() % 130 + 10;
		balls[i].oldRow = player.row;
		balls[i].oldCol = player.col;
		balls[i].rdel = 1;
		balls[i].cdel = 1;
		balls[i].color = WHITE;
		balls[i].active = 1;
		balls[i].erased = 0;
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
		//bounce ball off outside of goal
		if ((b->row + b->height) >= 139) {
			if ((b->col > 70) && ((b->col + b->width) < 170)) {
				losing = 1;
				//goToLose(); //ball enters goal:(
			} 
			if (((b->col < 69) || (b->col > 166 && b->col < 171)) 
				&& (b->row + b->height == 140)) {
				b->rdel *= -1; //bounce up off side poles
			} else if (((b->col + b->width - 1) == 69 && b->cdel > 0)|| (b->col == 171 && b->cdel < 0)) {
				b->cdel *= -1; //bounce left/right off side poles
			}
		}

		//bounce rectangle off paddle
		if (collision(b->row, b->col, b->height, b->width, 
				player.row, player.col, player.height, player.width) == 1) {
			if ((b->col == player.col + player.width - 1) || (b->col + b->width - 1 == player.col)) {
				b->cdel *= -1;
			}
			b->rdel *= -1;
		} else {
			if ((player.col > 0) && BUTTON_HELD(BUTTON_LEFT)) //paddle left movement
				player.col--;
			if ((player.col + player.width < 240) && BUTTON_HELD(BUTTON_RIGHT)) //paddle right
				player.col++;
		}

		// Move the ball
		b->row += b->rdel;
		b->col += b->cdel;

		// Handle ball-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active && collision(b->row, b->col, b->height, b->width,
				bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {

				// Put ball back in the pool
				bullets[i].active = 0;
				b->active = 0;

				// Update the score
				ballsRemaining--;
			}
		}
	}
}

// Draw a ball
void drawBall(BALL* b) {

	if(b->active) {
		drawBox(b->oldRow, b->oldCol, b->height, b->width, bgColor);
		//draw new rectangle & paddle positions
		drawBox(b->row, b->col, b->height, b->width, WHITE);

		//draw spots on soccer ball
		drawBox((b->row + 1), (b->col + 4), 2, 2, BLACK);
		drawBox((b->row + 3), b->col, 2, 1, BLACK);
		drawBox((b->row + 6), (b->col + 3), 1, 2, BLACK);

		//make rectangle a little rounder
		setPixel(b->row, b->col, bgColor);
		setPixel(b->row, (b->col + b->width - 1), bgColor);
		setPixel((b->row + b->height - 1), b->col, bgColor);
		setPixel((b->row + b->height - 1), (b->col + b->width - 1), bgColor);
	} else if (!b->erased) {
		drawBox(b->oldRow, b->oldCol, b->height, b->width, DARKGREEN);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}