# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.H" 1




typedef unsigned short u16;
# 25 "myLib.H"
extern unsigned short *videoBuffer;
# 40 "myLib.H"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 66 "myLib.H"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 77 "myLib.H"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2


void initialize();
void drawBackground();
void initializeGame();
void gameDraw();
void gameState();
void initializeLose();
void loseState();
void loseDraw();


unsigned short buttons;
unsigned short oldButtons;
unsigned short bgColor;
unsigned short textColor;


int bRow;
int bCol;
int bOldRow;
int bOldCol;
int bRVel;
int bCVel;
int bHeight;
int bWidth;


int pRow;
int pCol;
int pOldCol;
int pOldRow;
int pHeight;
int pWidth;


typedef enum {GAME, LOSE} states;
states state;

int main() {
 (*(unsigned short *)0x4000000) = 3 | (1<<10);

 state = GAME;
 initialize();

 while(1) {

  switch(state) {
   case(GAME):
    gameDraw();
    oldButtons = (*(volatile unsigned short *)0x04000130);
    gameState();
    buttons = (*(volatile unsigned short *)0x04000130);
    waitForVBlank();
    break;
   case(LOSE):
    loseDraw();
    oldButtons = (*(volatile unsigned short *)0x04000130);
    loseState();
    buttons = (*(volatile unsigned short *)0x04000130);
    waitForVBlank();
    break;
   default:
    break;
  }
 }
}

void initialize() {
 oldButtons = 0;
 buttons = (*(volatile unsigned short *)0x04000130);

 state = GAME;

 bgColor = ((6) | (20)<<5 | (6)<<10);
 drawBackground();


 bRow = 20;
 bCol = 20;
 bOldRow = bRow;
 bOldCol = bCol;
 bRVel = 1;
 bCVel = 1;
 bHeight = 7;
 bWidth = 7;


 pRow = 130;
 pCol = 113;
 pOldCol = pCol;
 pOldRow = pRow;
 pHeight = 2;
 pWidth = 20;
}

void drawBackground() {
 fillScreen(bgColor);


 for (int i = 0; i < 4; i++) {
  drawHorizontalLine(139 + (7*i), 70, 100, ((31) | (31)<<5 | (31)<<10));
 }
 for (int i = 0; i < 9; i++) {
  drawVerticalLine(139, 80 + (10*i), 21, ((31) | (31)<<5 | (31)<<10));
 }
 drawVerticalLine(139, 70, 21, ((31) | (0)<<5 | (0)<<10));
 drawVerticalLine(139, 170, 21, ((31) | (0)<<5 | (0)<<10));
}

void initializeGame() {

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

 if (bRow <= 0 || bRow + bHeight - 1 >= 160 - 1)
  bRVel *= -1;
 if (bCol <= 0 || bCol + bWidth - 1 >= 240 - 1)
  bCVel *= -1;

 if ((bRow + bHeight >= 139)) {
  if ((bCol > 70) && ((bCol + bWidth) < 170)) {
   initializeLose();
  }
  if ((bCol > 64 && bCol < 69) || (bCol > 166 && bCol < 171)
   && (bRow + bHeight == 140)) {
   bRVel *= -1;
  } else if ((bCol + bWidth - 1 == 69 && bCVel > 0)|| (bCol == 171 && bCVel < 0)) {
   bCVel *= -1;
  }
 }


 bRow += bRVel;
 bCol += bCVel;


 if (collision(bRow, bCol, bHeight, bWidth, pRow, pCol, pHeight, pWidth) == 1) {
  if ((bCol == pCol + pWidth - 1) || (bCol + bWidth - 1== pCol)) {
   bCVel *= -1;
  }
  bRVel *= -1;
 } else {
  if ((pCol > 0) && (~((*(volatile unsigned short *)0x04000130)) &((1<<5))))
   pCol--;
  if ((pCol + pWidth < 240) && (~((*(volatile unsigned short *)0x04000130)) &((1<<4))))
   pCol++;
 }


}

void gameDraw() {

 drawBox(bOldRow, bOldCol, bHeight, bWidth, bgColor);
 drawBox(pOldRow, pOldCol, pHeight, pWidth, bgColor);


 drawBox(bRow, bCol, bHeight, bWidth, ((31) | (31)<<5 | (31)<<10));
 drawBox(pRow, pCol, pHeight, pWidth, 0);


 drawBox((bRow + 1), (bCol + 4), 2, 2, 0);
 drawBox((bRow + 3), bCol, 2, 1, 0);
 drawBox((bRow + 6), (bCol + 3), 1, 2, 0);


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
 textColor = 0;
 state = LOSE;
}

void loseState() {
 if ((!(~(oldButtons) &((1<<3)))) && (~(buttons) &((1<<3)))){
  initializeGame();
 }
}

void loseDraw() {

 drawDiagonalDownLine(55, 23, 8, textColor);
 drawDiagonalUpLine(63, 31, 9, textColor);
 drawVerticalLine(64, 31, 17, textColor);

 drawRectangle(65, 40, 15, 15, textColor);

 drawRectangle(65, 60, 15, 15, textColor);
 drawHorizontalLine(65, 61, 14, bgColor);


 drawVerticalLine(55, 95, 26, textColor);

 drawRectangle(65, 100, 15, 15, textColor);

 drawHorizontalLine(65, 120, 15, textColor);
 drawVerticalLine(65, 120, 7, textColor);
 drawHorizontalLine(72, 120, 15, textColor);
 drawVerticalLine(72, 134, 8, textColor);
 drawHorizontalLine(80, 120, 15, textColor);

 drawRectangle(65, 140, 7, 15, textColor);
 drawRectangle(72, 140, 8, 15, textColor);
 drawVerticalLine(73, 155, 7, bgColor);
}
