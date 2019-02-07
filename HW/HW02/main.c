#include "myLib.H"

//prototypes
void initialize();
void drawBackground();
void initializeGame();
void gameDraw();
void gameState();
void initializeLose();
void loseState();
void loseDraw();

// variables
unsigned short buttons;
unsigned short oldButtons;
unsigned short bgColor;
unsigned short textColor;

// bouncing rectangle
int bRow;
int bCol;
int bOldRow;
int bOldCol;
int bRVel;
int bCVel;
int bHeight;
int bWidth;

// paddle
int pRow;
int pCol;
int pOldCol;
int pOldRow;
int pHeight;
int pWidth;

//states
typedef enum {GAME, LOSE} states;
states state;

int main() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	state = GAME;
	initialize();

	while(1) {
		
		switch(state) {
			case(GAME):
				gameDraw();
				oldButtons = BUTTONS;
				gameState(); //update() for game state
				buttons = BUTTONS;
				waitForVBlank();
				break;
			case(LOSE):
				loseDraw();
				oldButtons = BUTTONS;
				loseState(); //update() for lose state
				buttons = BUTTONS;
				waitForVBlank();
				break;
			default:
				break;
		}
	}
}

void initialize() {
	oldButtons = 0;
	buttons = BUTTONS;

	state = GAME;

	bgColor = DARKGREEN;
	drawBackground();

	//make bouncing rectangle
	bRow = 20;
	bCol = 20;
	bOldRow = bRow;
	bOldCol = bCol;
	bRVel = 1;
	bCVel = 1;
	bHeight = 7;
	bWidth = 7;

	//make paddle
	pRow = 130;
	pCol = 113;
	pOldCol = pCol;
	pOldRow = pRow;
	pHeight = 2;
	pWidth = 20;
}

void drawBackground() {
	fillScreen(bgColor);

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

void initializeGame() {
	//reset bouncing rectangle
	bRow = 20;
	bCol = pCol;

	bOldRow = 0;
	bOldCol = 0;
	pOldRow = 0;
	pOldCol = 0;

	drawBackground();

	state = GAME;
}

void gameState() {
	//bounce rectangle off walls
	if (bRow <= 0 || bRow + bHeight - 1 >= SCREENHEIGHT - 1)
		bRVel *= -1;
	if (bCol <= 0 || bCol + bWidth - 1 >= SCREENWIDTH - 1)
		bCVel *= -1;
	//bounce ball off outside of goal
	if ((bRow + bHeight >= 139)) {
		if ((bCol > 70) && ((bCol + bWidth) < 170)) {
			initializeLose();
		} 
		if ((bCol > 64 && bCol < 69) || (bCol > 166 && bCol < 171) 
			&& (bRow + bHeight == 140)) {
			bRVel *= -1; //bounce up off side poles
		} else if ((bCol + bWidth - 1 == 69 && bCVel > 0)|| (bCol == 171 && bCVel < 0)) {
			bCVel *= -1; //bounce left/right off side poles
		}
	}

	//set new position of bouncing rectangle
	bRow += bRVel;
	bCol += bCVel;

	//bounce rectangle off paddle
	if (collision(bRow, bCol, bHeight, bWidth, pRow, pCol, pHeight, pWidth) == 1) {
		if ((bCol == pCol + pWidth - 1) || (bCol + bWidth - 1== pCol)) {
			bCVel *= -1;
		}
		bRVel *= -1;
	} else {
		if ((pCol > 0) && BUTTON_HELD(BUTTON_LEFT)) //paddle left movement
			pCol--;
		if ((pCol + pWidth < 240) && BUTTON_HELD(BUTTON_RIGHT)) //paddle right
			pCol++;
	}

	
}

void gameDraw() {
	//erase old rectangle & paddle positions
	drawBox(bOldRow, bOldCol, bHeight, bWidth, bgColor);
	drawBox(pOldRow, pOldCol, pHeight, pWidth, bgColor);

	//draw new rectangle & paddle positions
	drawBox(bRow, bCol, bHeight, bWidth, WHITE);
	drawBox(pRow, pCol, pHeight, pWidth, BLACK);

	//draw spots on soccer ball
	drawBox((bRow + 1), (bCol + 4), 2, 2, BLACK);
	drawBox((bRow + 3), bCol, 2, 1, BLACK);
	drawBox((bRow + 6), (bCol + 3), 1, 2, BLACK);

	//make rectangle a little rounder
	setPixel(bRow, bCol, bgColor);
	setPixel(bRow, (bCol + bWidth - 1), bgColor);
	setPixel((bRow + bHeight - 1), bCol, bgColor);
	setPixel((bRow + bHeight - 1), (bCol + bWidth - 1), bgColor);

	bOldRow = bRow;
	bOldCol = bCol;
	pOldRow = pRow;
	pOldCol = pCol;
}

void initializeLose() {
	drawBackground();
	textColor = BLACK;
	state = LOSE;
}

void loseState() {
	if (BUTTON_PRESSED(BUTTON_START)){
		initializeGame();
	}
}

void loseDraw() {
	//y
	drawDiagonalDownLine(55, 23, 8, textColor);
	drawDiagonalUpLine(63, 31, 9, textColor);
	drawVerticalLine(64, 31, 17, textColor);
	//o
	drawRectangle(65, 40, 15, 15, textColor);
	//u
	drawRectangle(65, 60, 15, 15, textColor);
	drawHorizontalLine(65, 61, 14, bgColor);
	
	//l
	drawVerticalLine(55, 95, 26, textColor);
	//o
	drawRectangle(65, 100, 15, 15, textColor);
	//s 
	drawHorizontalLine(65, 120, 15, textColor);
	drawVerticalLine(65, 120, 7, textColor);
	drawHorizontalLine(72, 120, 15, textColor);
	drawVerticalLine(72, 134, 8, textColor);
	drawHorizontalLine(80, 120, 15, textColor);
	//e
	drawRectangle(65, 140, 7, 15, textColor);
	drawRectangle(72, 140, 8, 15, textColor);
	drawVerticalLine(73, 155, 7, bgColor);
}