#include <stdio.h>
#include <stdlib.h>
#include "myLib.h"
#include "spritesheet.h"
#include "game.h"

// Game Structures
PLAYER player;
ENEMY enemy1[8];
ENEMY enemy2[8];
ENEMY enemy2b[8];
ENEMY enemy3[8];
ENEMY enemy3b[8];
BULLET bullets[5];
BULLET enemyBullets[1];


// Game Variables
int enemiesRemaining;
int livesRemaining;
int enemyBulletTimer;
int enemyType;
int seed;
int lifeIndex;

// ShadowOAM Structure
OBJ_ATTR shadowOAM[128];

// Frame Variable
int frameCounter;

void initGame() { //sprites are showing up black ???? help ????

    initEnemies();
    initPlayer();
    initLives();

    for (int i = 0; i < 5; i++) {
		initBullets(&bullets[i]);
	}

	buttons = BUTTONS;
	frameCounter = 0;
	seed = 0;
}

void updateGame(){
	seed++;
	frameCounter++;

	srand(seed);

	updatePlayer();
	updateEnemy();

	for (int i = 0; i < 5; i++) {
		updateBullet(&bullets[i]);
	}
	updateBulletE();

	waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
}

void initEnemies() {
	int r = 5;
	int c = 5;
	
	enemiesRemaining = 40;
	enemyBulletTimer = 0;

	for (int i = 0; i < 8; i++) {
		enemy1[i].row = r;
		enemy1[i].col = c;
		enemy1[i].rdel = 3;
	    enemy1[i].cdel = 3;
		enemy1[i].width = 16;
	    enemy1[i].height = 16;
	    enemy1[i].active = 1;
	    enemy1[i].aniState = 0;
	    enemy1[i].botRow = 0;

	    enemy2[i].row = r + 18;
		enemy2[i].col = c;
		enemy2[i].rdel = 3;
	    enemy2[i].cdel = 3;
		enemy2[i].width = 16;
	    enemy2[i].height = 16;
	    enemy2[i].active = 1;
	    enemy2[i].aniState = 0;
	    enemy2[i].botRow = 0;

	   	enemy2b[i].row = r + 36;
		enemy2b[i].col = c;
		enemy2b[i].rdel = 3;
	    enemy2b[i].cdel = 3;
		enemy2b[i].width = 16;
	    enemy2b[i].height = 16;
	    enemy2b[i].active = 1;
	    enemy2b[i].aniState = 0;
	    enemy2b[i].botRow = 0;
	    
	    enemy3[i].row = r + 54;
		enemy3[i].col = c;
		enemy3[i].rdel = 3;
	    enemy3[i].cdel = 3;
		enemy3[i].width = 16;
	    enemy3[i].height = 16;
	    enemy3[i].active = 1;
	    enemy3[i].aniState = 0;
	    enemy3[i].botRow = 0;

	   	enemy3b[i].row = r + 72;
		enemy3b[i].col = c;
		enemy3b[i].rdel = 3;
	    enemy3b[i].cdel = 3;
		enemy3b[i].width = 16;
	    enemy3b[i].height = 16;
	    enemy3b[i].active = 1;
	    enemy3b[i].aniState = 0;
	    enemy3b[i].botRow = 1;
	    
	    c+=18;
	}
}

void updateEnemy(){

	if(frameCounter % 20 == 0) {
		for (int i = 0; i < 8; i++) {
			enemy1[i].aniState = (enemy1[i].aniState + 1) % 2;
			enemy2[i].aniState = (enemy2[i].aniState + 1) % 2;
			enemy2b[i].aniState = (enemy2b[i].aniState + 1) % 2;
			enemy3[i].aniState = (enemy3[i].aniState + 1) % 2;
			enemy3b[i].aniState = (enemy3b[i].aniState + 1) % 2;
		}
	}

	if(frameCounter % 100 == 0 && frameCounter > 0) {
		enemyBulletTimer++;
	}

	for (int i = 0; i < 8; i++) {

		if (enemy1[i].active) {
			shadowOAM[i+1].attr0 = (enemy1[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i+1].attr1 = (enemy1[i].col) | ATTR1_SMALL;
		    shadowOAM[i+1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, enemy1[i].aniState*2);
		} else {
			shadowOAM[i+1].attr0 = ATTR0_HIDE;
		}

		if (enemy2[i].active) {
			shadowOAM[i+17].attr0 = (enemy2[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i+17].attr1 = (enemy2[i].col) | ATTR1_SMALL;
		    shadowOAM[i+17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, enemy2[i].aniState*2);
		} else {
			shadowOAM[i+17].attr0 = ATTR0_HIDE;
		}

		if (enemy2[i].active) {
			shadowOAM[i+25].attr0 = (enemy2b[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i+25].attr1 = (enemy2b[i].col) | ATTR1_SMALL;			
		    shadowOAM[i+25].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, enemy2b[i].aniState*2);
		} else {
			shadowOAM[i+25].attr0 = ATTR0_HIDE;
		}

		if (enemy3[i].active) {
			shadowOAM[i+33].attr0 = (enemy3[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
		    shadowOAM[i+33].attr1 = (enemy3[i].col) | ATTR1_SMALL;
		    shadowOAM[i+33].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, enemy3[i].aniState*2);
		} else {
			shadowOAM[i+33].attr0 = ATTR0_HIDE;
		}

		if (enemy3b[i].active) {
			shadowOAM[i+41].attr0 = (enemy3b[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    	shadowOAM[i+41].attr1 = (enemy3b[i].col) | ATTR1_SMALL;
		    shadowOAM[i+41].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, enemy3b[i].aniState*2);
		} else {
			shadowOAM[i+41].attr0 = ATTR0_HIDE;
		}

	    if (enemy1[i].col + enemy1[i].width > SCREENWIDTH - 5 || enemy1[i].col < 5) {
	    	for (int i = 0; i < 8; i++) {
	    		enemy1[i].row+=enemy1[i].rdel;
	    		enemy1[i].cdel *= -1;
	    		enemy1[i].col+=enemy1[i].cdel;
	    	}
	    } else {
	    	if (frameCounter % 20 == 0) {
		    	enemy1[i].col+=enemy1[i].cdel;
	    	}
	    }
	    	
	    if (enemy2[i].col + enemy2[i].width > SCREENWIDTH - 5 || enemy2[i].col < 5) {
	    	for (int i = 0; i < 8; i++) {
	    		enemy2[i].row+=enemy2[i].rdel;
	    		enemy2[i].cdel *= -1;
	    		enemy2[i].col+=enemy2[i].cdel;
	    	}
	    } else {
	    	if (frameCounter % 20 == 0) {
		    	enemy2[i].col+=enemy2[i].cdel;
	    	}
	    }

	    if (enemy2b[i].col + enemy2b[i].width > SCREENWIDTH - 5 || enemy2b[i].col < 5) {
	    	for (int i = 0; i < 8; i++) {
	    		enemy2b[i].row+=enemy2b[i].rdel;
	    		enemy2b[i].cdel *= -1;
	    		enemy2b[i].col+=enemy2b[i].cdel;
	    	}
	    } else {
	    	if (frameCounter % 20 == 0) {
		    	enemy2b[i].col+=enemy2b[i].cdel;
	    	}
	    }
	    
		if (enemy3[i].col + enemy3[i].width > SCREENWIDTH - 5 || enemy3[i].col < 5) {
	    	for (int i = 0; i < 8; i++) {
	    		enemy3[i].row+=enemy3[i].rdel;
	    		enemy3[i].cdel *= -1;
	    		enemy3[i].col+=enemy3[i].cdel;
	    	}
	    } else {
	    	if (frameCounter % 20 == 0) {
		    	enemy3[i].col+=enemy3[i].cdel;
	    	}
	    }

	    if (enemy3b[i].col + enemy3b[i].width > SCREENWIDTH - 5 || enemy3b[i].col < 5) {
	    	for (int i = 0; i < 8; i++) {
	    		enemy3b[i].row+=enemy3b[i].rdel;
	    		enemy3b[i].cdel *= -1;
	    		enemy3b[i].col+=enemy3b[i].cdel;
	    	}
	 	} else {
	    	if (frameCounter % 20 == 0) {
		    	enemy3b[i].col+=enemy3b[i].cdel;
	    	}
	    }

	    if (enemy1[i].row + enemy1[i].height >= player.row) {
	    	livesRemaining-=3;
	    	goToLose();
	    } else if (enemy2[i].row + enemy2[i].height >= player.row) {
	    	livesRemaining-=3;
	    	goToLose();
	    } else if (enemy2b[i].row + enemy2b[i].height >= player.row) {
	    	livesRemaining-=3;
	    	goToLose();
	    } else if (enemy3[i].row + enemy3[i].height >= player.row) {
	    	livesRemaining-=3;
	    	goToLose();
	    } else if (enemy3b[i].row + enemy3b[i].height >= player.row) {
	    	livesRemaining-=3;
	    	goToLose();
	    }

		for (int j=0; j<5; j++) {
			if (bullets[j].active) {
				if (enemy3b[i].active &&
					collision(enemy3b[i].row, enemy3b[i].col, enemy3b[i].height, enemy3b[i].width, bullets[j].row, bullets[j].col, bullets[j].height, bullets[j].width) ) {
					bullets[j].active = 0;
					enemy3b[i].active = 0;
					enemiesRemaining--;
					if (enemy3[i].active) {
						enemy3[i].botRow = 1;
					} else if (enemy2b[i].active) {
						enemy2b[i].botRow = 1; 
					} else if (enemy2[i].active) {
						enemy2[i].botRow = 1;
					} else if (enemy1[i].active) {
						enemy1[i].botRow = 1;
					}
					break;
				}
				if (enemy3[i].active &&
					collision(enemy3[i].row, enemy3[i].col, enemy3[i].height, enemy3[i].width, bullets[j].row, bullets[j].col, bullets[j].height, bullets[j].width) ) {
					bullets[j].active = 0;
					enemy3[i].active = 0;
					enemiesRemaining--;
					if (enemy2b[i].active) {
						enemy2b[i].botRow = 1; 
					} else if (enemy2[i].active) {
						enemy2[i].botRow = 1;
					} else if (enemy1[i].active) {
						enemy1[i].botRow = 1;
					}
					break;
				}
				if (enemy2b[i].active &&
					collision(enemy2b[i].row, enemy2b[i].col, enemy2b[i].height, enemy2b[i].width, bullets[j].row, bullets[j].col, bullets[j].height, bullets[j].width) ) {
					bullets[j].active = 0;
					enemy2b[i].active = 0;
					enemiesRemaining--;
					if (enemy2[i].active) {
						enemy2[i].botRow = 1;
					} else if (enemy1[i].active) {
						enemy1[i].botRow = 1;
					}
					break;
				}
				if (enemy2[i].active &&
					collision(enemy2[i].row, enemy2[i].col, enemy2[i].height, enemy2[i].width, bullets[j].row, bullets[j].col, bullets[j].height, bullets[j].width) ) {
					bullets[j].active = 0;
					enemy2[i].active = 0;
					enemiesRemaining--;
					if (enemy1[i].active) {
						enemy1[i].botRow = 1;
					}
					break;
				}				
				if (enemy1[i].active &&
					collision(enemy1[i].row, enemy1[i].col, enemy1[i].height, enemy1[i].width, bullets[j].row, bullets[j].col, bullets[j].height, bullets[j].width) ) {
					bullets[j].active = 0;
					enemy1[i].active = 0;
					enemiesRemaining--;
					break;
				}
			}
		}
		
		if (!enemyBullets[0].active) {
			int randTimer = rand() % 1000;
			if (enemy1[i].active && enemy1[i].botRow && (enemyBulletTimer % randTimer == 0)) {
				enemyType = 3;
				fireEnemy(enemy1[i].row, enemy1[i].col);
			}
			if (enemy2[i].active && enemy2[i].botRow && (enemyBulletTimer % randTimer == 0)) {
				enemyType = 2;
				fireEnemy(enemy2[i].row, enemy2[i].col);
			}
			if (enemy2b[i].active && enemy2b[i].botRow && (enemyBulletTimer % randTimer == 0)) {
				enemyType = 2;
				fireEnemy(enemy2b[i].row, enemy2b[i].col);
			}
			if (enemy3[i].active && enemy3[i].botRow && (enemyBulletTimer % randTimer == 0)) {
				enemyType = 1;
				fireEnemy(enemy3[i].row, enemy3[i].col);
			}
			if (enemy3b[i].active && enemy3b[i].botRow && (enemyBulletTimer % randTimer == 0)) {
				enemyType = 1;
				fireEnemy(enemy3b[i].row, enemy3b[i].col);
			}
		}
	}

}

void initPlayer(){

	player.width = 16;
    player.height = 16;
    player.cdel = 1;
	player.row = SCREENHEIGHT-player.width-2;
	player.col = SCREENWIDTH/2-player.height/2;
	player.bulletTimer = 50;
}

void updatePlayer(){

	if (collision(player.row, player.col, player.height, player.width, enemyBullets[0].row, enemyBullets[0].col, enemyBullets[0].height, enemyBullets[0].width) ){
		shadowOAM[58].attr0 = ATTR0_HIDE;
		enemyBullets[0].active = 0;
		livesRemaining--;
		shadowOAM[lifeIndex].attr0 = ATTR0_HIDE;
		lifeIndex--;
	}

	if(BUTTON_HELD(BUTTON_LEFT) && (player.col > 5)) {
		player.col -= player.cdel;

	}
	if(BUTTON_HELD(BUTTON_RIGHT) && ((player.col + player.width) < (SCREENWIDTH - 5))) {
		player.col += player.cdel;
	}
	if(BUTTON_HELD(BUTTON_A) && player.bulletTimer >= 60) {
		fireBullet();
		player.bulletTimer = 0;
	}

    shadowOAM[0].attr0 = (player.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (player.col) | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 0);

    player.bulletTimer++;
}


void initBullets(){

	for (int i = 0; i < 5; i++) {
		bullets[i].height = 5;
		bullets[i].width = 2;
		bullets[i].active = 0;
		bullets[i].num = i;
	}
	
	enemyBullets[0].height = 5;
	enemyBullets[0].width = 2;
	enemyBullets[0].active = 0;
}

void fireBullet(){

	for (int i = 0; i <5; i++) {
		if (bullets[i].active == 0) {
			bullets[i].rdel = -2;
			bullets[i].row = player.row;
			bullets[i].col = player.col;
			bullets[i].active = 1;
			bullets[i].erased = 0;
			break;
		}
	}
}

void fireEnemy(int row, int col){

	if (enemyBullets[0].active == 0) {
		enemyBullets[0].rdel = 1;
		enemyBullets[0].row = row + 17;
		enemyBullets[0].col = col + 7;
		enemyBullets[0].active = 1;
		enemyBullets[0].erased = 0;
	}
}

void updateBullet(BULLET *b){
	if (b->active) {

		if (b->row <= 0) {
			b->active = 0;
		}
		b->row += b->rdel;

		shadowOAM[49 + b->num].attr0 = (b->row) | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[49 + b->num].attr1 = (b->col) | ATTR1_SMALL;
		shadowOAM[49 + b->num].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 4);

	} else if (!b->erased) {
		shadowOAM[49 + b->num].attr0 = ATTR0_HIDE;
		b->erased = 1;
	}
}

void updateBulletE() {

	if (enemyBullets[0].active) {
		if (enemyBullets[0].row >= SCREENHEIGHT) {
			enemyBullets[0].active = 0;
		}
		enemyBullets[0].row += enemyBullets[0].rdel;
		
		shadowOAM[58].attr0 = (enemyBullets[0].row) | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[58].attr1 = (enemyBullets[0].col) | ATTR1_SMALL;
		shadowOAM[58].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((enemyType - 1)*2, 4);

	}
}

void initLives() {
	
	livesRemaining = 3;
	lifeIndex = 56;
	drawLives();
}


void drawLives() {

	// Heart Sprites
	int c = 207;
	for (int i = 0; i < livesRemaining; i++) {
		shadowOAM[54 + i].attr0 = (11) | ATTR0_4BPP | ATTR0_SQUARE;
	    shadowOAM[54 + i].attr1 = (c) | ATTR1_SMALL;
	    shadowOAM[54 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3, 2);
	    c+=8;
	}
}