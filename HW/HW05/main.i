# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 65 "myLib.h"
extern unsigned short *videoBuffer;
# 86 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 158 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 201 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 212 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 252 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[1248];


extern const unsigned short bgMap[1024];


extern const unsigned short bgPal[256];
# 3 "main.c" 2
# 1 "bgStart.h" 1
# 22 "bgStart.h"
extern const unsigned short bgStartTiles[3552];


extern const unsigned short bgStartMap[1024];


extern const unsigned short bgStartPal[256];
# 4 "main.c" 2
# 1 "bgLose.h" 1
# 22 "bgLose.h"
extern const unsigned short bgLoseTiles[1280];


extern const unsigned short bgLoseMap[1024];


extern const unsigned short bgLosePal[256];
# 5 "main.c" 2
# 1 "bgWin.h" 1
# 22 "bgWin.h"
extern const unsigned short bgWinTiles[1376];


extern const unsigned short bgWinMap[1024];


extern const unsigned short bgWinPal[256];
# 6 "main.c" 2
# 1 "game.h" 1

typedef struct {
 int row;
 int col;
 int oldRow;
 int oldCol;
 int cdel;
 int height;
 int width;
 int bulletTimer;
} PLAYER;


typedef struct {
 int row;
 int col;
 int rdel;
 int height;
 int width;
 int active;
 int erased;
 int num;
} BULLET;


typedef struct {
 int row;
 int col;
    int rdel;
    int cdel;
 int width;
    int height;
    int aniState;
    int active;
    int botRow;
} ENEMY;


extern PLAYER player;
extern ENEMY enemy1[8];
extern ENEMY enemy2[8];
extern ENEMY enemy2b[8];
extern ENEMY enemy3[8];
extern ENEMY enemy3b[8];
extern BULLET bullets[5];


extern int enemiesRemaining;
extern int livesRemaining;
extern int losing;
extern int seed;


void initGame();
void updateGame();
void initPlayer();
void updatePlayer();
void initBullets();
void fireBullet();
void fireEnemy();
void updateBullet(BULLET *);
void updateBulletE();
void initEnemies();
void updateEnemy();
void initLives();
void drawLives();
# 7 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 8 "main.c" 2


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


typedef enum {START, GAME, PAUSE, WIN, LOSE} states;
states state;

int main() {

    initialize();

 while(1) {

  oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 510/2);

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);


    hideSprites();

    goToStart();

    oldButtons = 0;
    buttons = (*(volatile unsigned short *)0x04000130);
}

void goToStart() {

    (*(volatile unsigned short*)0x4000008) = (3<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
 DMANow(3, bgStartPal, ((unsigned short *)0x5000000), 512);
 DMANow(3, bgStartTiles, &((charblock *)0x6000000)[0], 7104/2);
 DMANow(3, bgStartMap, &((screenblock *)0x6000000)[28], 2048/2);

 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

 waitForVBlank();

 state = START;
}
void start() {

 seed++;

 waitForVBlank();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToGame();
     initGame();
}
void goToGame(){

 (*(volatile unsigned short*)0x4000008) = (3<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
 DMANow(3, bgPal, ((unsigned short *)0x5000000), 510);
 DMANow(3, bgTiles, &((charblock *)0x6000000)[0], 2496/2);
 DMANow(3, bgMap, &((screenblock *)0x6000000)[28], 2048/2);

 waitForVBlank();

 state = GAME;
}
void game(){

 updateGame();
 waitForVBlank();

 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
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

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToGame();

  if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))
        goToStart();
}
void goToWin(){

 (*(volatile unsigned short*)0x4000008) = (3<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
 DMANow(3, bgWinPal, ((unsigned short *)0x5000000), 512);
 DMANow(3, bgWinTiles, &((charblock *)0x6000000)[0], 2752/2);
 DMANow(3, bgWinMap, &((screenblock *)0x6000000)[28], 2048/2);

 hideSprites();

 state = WIN;
}
void win(){

 waitForVBlank();

 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToStart();
}
void goToLose(){

 (*(volatile unsigned short*)0x4000008) = (3<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
 DMANow(3, bgLosePal, ((unsigned short *)0x5000000), 512);
 DMANow(3, bgLoseTiles, &((charblock *)0x6000000)[0], 2560/2);
 DMANow(3, bgLoseMap, &((screenblock *)0x6000000)[28], 2048/2);

 hideSprites();

 state = LOSE;
}
void lose(){

 waitForVBlank();

 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToStart();
}
