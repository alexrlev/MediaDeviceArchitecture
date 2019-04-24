# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 66 "myLib.h"
extern unsigned short *videoBuffer;
# 87 "myLib.h"
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
# 159 "myLib.h"
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
# 202 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 213 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 253 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 343 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

typedef struct
{
    int row;
    int col;
    int rdel;
    int cdel;
    int size;
    u16 color;
    int AI_STATE;
} MOVOBJ;




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[3072];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 3 "main.c" 2
# 1 "startGround.h" 1
# 22 "startGround.h"
extern const unsigned short startGroundTiles[9728];


extern const unsigned short startGroundMap[1024];


extern const unsigned short startGroundPal[256];
# 4 "main.c" 2
# 1 "instrGround.h" 1
# 22 "instrGround.h"
extern const unsigned short instrGroundTiles[8544];


extern const unsigned short instrGroundMap[1024];


extern const unsigned short instrGroundPal[256];
# 5 "main.c" 2
# 1 "game.h" 1





extern int hOff;
extern int vOff;
extern int vFOff;
extern int hFOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE person;
extern int winBool;

extern int foodCounter;
extern int highScore;
extern int moneyCounter;
extern int foodPrice;
extern int couponPrice;


void initGame();
void updateGame();
void drawGame();
void drawScore();

void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void testCollisions();

void initCashier();
void drawCashier();


typedef struct {
 int row;
 int col;
 int height;
 int width;
} CASHIER;


typedef struct {
 int row;
 int col;
 int height;
 int width;
 int frame;
 int active;
 int erased;
 int timer;
} FOOD;


void initFood();
void updateFood();
void drawFood();


typedef struct {
 int row;
 int col;
 int height;
 int width;
 int frame;
 int active;
 int erased;
 int timer;
 int curFrame;
 int numFrames;
} COUPON;


void initCoupons();
void updateCoupons();
void drawCoupons();
# 6 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 7 "main.c" 2
# 1 "pauseGround.h" 1
# 22 "pauseGround.h"
extern const unsigned short pauseGroundTiles[6176];


extern const unsigned short pauseGroundMap[1024];


extern const unsigned short pauseGroundPal[256];
# 8 "main.c" 2
# 1 "loseGround.h" 1
# 22 "loseGround.h"
extern const unsigned short loseGroundTiles[8416];


extern const unsigned short loseGroundMap[1024];


extern const unsigned short loseGroundPal[256];
# 9 "main.c" 2
# 1 "frontground.h" 1
# 22 "frontground.h"
extern const unsigned short frontgroundTiles[192];


extern const unsigned short frontgroundMap[6144];


extern const unsigned short frontgroundPal[256];
# 10 "main.c" 2
# 1 "winGround.h" 1
# 22 "winGround.h"
extern const unsigned short winGroundTiles[9280];


extern const unsigned short winGroundMap[1024];


extern const unsigned short winGroundPal[256];
# 11 "main.c" 2
# 1 "softJazz.h" 1
# 20 "softJazz.h"
extern const unsigned char softJazz[330750];
# 12 "main.c" 2
# 1 "cheatGround.h" 1
# 22 "cheatGround.h"
extern const unsigned short cheatGroundTiles[192];


extern const unsigned short cheatGroundMap[6144];


extern const unsigned short cheatGroundPal[256];
# 13 "main.c" 2
# 1 "numberSheet.h" 1
# 21 "numberSheet.h"
extern const unsigned short numberSheetTiles[16384];


extern const unsigned short numberSheetPal[256];
# 14 "main.c" 2

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


SOUND soundA;


typedef enum {START, INSTR, GAME, CHEAT, PAUSE, WIN, LOSE} states;
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

 (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<12);

 goToStart();
}

void goToStart() {

 waitForVBlank();

 playSoundA(softJazz, 330750, 11025, 1);

 DMANow(3, startGroundPal, ((unsigned short *)0x5000000), 256);
 DMANow(3, startGroundTiles, &((charblock *)0x6000000)[0], 19456/2);
 DMANow(3, startGroundMap, &((screenblock *)0x6000000)[28], 2048/2);

 DMANow(3, numberSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, numberSheetPal, ((unsigned short *)0x5000200), 512/2);
    hideSprites();

 (*(volatile unsigned short *)0x04000012) = 0;
 (*(volatile unsigned short *)0x04000010) = 0;

 (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((28)<<8);

 state = START;
}

void start() {

 waitForVBlank();

 int temp = highScore;
 int i = 0;
    do {
        shadowOAM[50 + i].attr0 = (0xFF & 152) | (0<<14);
        shadowOAM[50 + i].attr1 = (0x1FF & (53 - 4*i)) | (1<<14);
        shadowOAM[50 + i].attr2 = ((0)<<12) | (((temp % 10) * 2)*32+(0));
        temp /= 10;
        i++;
    } while (temp);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);


 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToInstr();
 }
}

void goToInstr() {

 waitForVBlank();

 hideSprites();

 (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((31)<<8);

 DMANow(3, instrGroundPal, ((unsigned short *)0x5000000), 256);
 DMANow(3, instrGroundTiles, &((charblock *)0x6000000)[0], 17088/2);
 DMANow(3, instrGroundMap, &((screenblock *)0x6000000)[31], 2048/2);

 state = INSTR;
}

void instr () {

 waitForVBlank();

 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  goToStart();
 }
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  state = GAME;
  goToGame();
  initGame();
 }
}

void goToGame() {

 (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<12) | (1<<9);

 (*(volatile unsigned short*)0x400000A) = (0<<14)| (1<<7) | ((0)<<2) | ((26)<<8) | ((2)<<0);
 DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 256);
 DMANow(3, backgroundTiles, &((charblock *)0x6000000)[0], 6144/2);
 DMANow(3, backgroundMap, &((screenblock *)0x6000000)[26], 2048/2);

 (*(volatile unsigned short*)0x4000008) = (1<<14) | (0<<7) | ((1)<<2) | ((30)<<8) | ((0)<<0);
 DMANow(3, frontgroundTiles, &((charblock *)0x6000000)[1], 384/2);
 DMANow(3, frontgroundMap, &((screenblock *)0x6000000)[30], 12288/2);
 (*(volatile unsigned short *)0x04000012) = vFOff;
    (*(volatile unsigned short *)0x04000010) = hFOff;

 (*(volatile unsigned short *)0x04000016) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff;

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512/2);
    hideSprites();

    foodPrice = 10;
    couponPrice = 5;

    waitForVBlank();

 state = GAME;
}

void game() {

 updateGame();
 drawGame();

 if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
  goToCheat();
    }
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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
 (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<12) | (1<<9);

 (*(volatile unsigned short*)0x400000A) = (0<<14) | (1<<7) | ((0)<<2) | ((26)<<8) | ((2)<<0);
 DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 256);
 DMANow(3, backgroundTiles, &((charblock *)0x6000000)[0], 6144/2);
 DMANow(3, backgroundMap, &((screenblock *)0x6000000)[26], 2048/2);

 (*(volatile unsigned short*)0x4000008) = (1<<14) | (0<<7) | ((1)<<2) | ((30)<<8) | ((0)<<0);
 DMANow(3, cheatGroundTiles, &((charblock *)0x6000000)[1], 384/2);
 DMANow(3, cheatGroundMap, &((screenblock *)0x6000000)[30], 12288/2);
 (*(volatile unsigned short *)0x04000012) = vFOff;
    (*(volatile unsigned short *)0x04000010) = hFOff;

 DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512/2);
    hideSprites();

 (*(volatile unsigned short *)0x04000016) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff;

    foodPrice = 1;
    couponPrice = 0;

 state = CHEAT;
}

void cheat() {

 updateGame();
 drawGame();

 if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
  goToGame();
    }
 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
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

 (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<12);
 (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((28)<<8);

 DMANow(3, pauseGroundPal, ((unsigned short *)0x5000000), 256);
 DMANow(3, pauseGroundTiles, &((charblock *)0x6000000)[0], 12352/2);
 DMANow(3, pauseGroundMap, &((screenblock *)0x6000000)[28], 2048/2);

 (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

 state = PAUSE;
}

void pause() {

 waitForVBlank();

 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToGame();
 }
 if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
  goToStart();
 }
}

void goToLose() {

 waitForVBlank();

 hideSprites();

 (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<12);
 (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((31)<<8);

 DMANow(3, loseGroundPal, ((unsigned short *)0x5000000), 256);
 DMANow(3, loseGroundTiles, &((charblock *)0x6000000)[0], 16832/2);
 DMANow(3, loseGroundMap, &((screenblock *)0x6000000)[31], 2048/2);

 (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

 state = LOSE;
}

void lose() {

 waitForVBlank();

 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToStart();
 }
}

void goToWin() {

 waitForVBlank();

 hideSprites();

 (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<12);
 (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((31)<<8);

 DMANow(3, winGroundPal, ((unsigned short *)0x5000000), 256);
 DMANow(3, winGroundTiles, &((charblock *)0x6000000)[0], 18560/2);
 DMANow(3, winGroundMap, &((screenblock *)0x6000000)[31], 2048/2);

 DMANow(3, numberSheetTiles, &((charblock *)0x6000000)[4], 32768/2);
    DMANow(3, numberSheetPal, ((unsigned short *)0x5000200), 512/2);
    hideSprites();

 (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

    if (foodCounter > highScore) {
     highScore = foodCounter;
    }

    int i = 0;
    do {
        shadowOAM[60 + i].attr0 = (0xFF & 153) | (0<<14);
        shadowOAM[60 + i].attr1 = (0x1FF & (39 - 4*i)) | (1<<14);
        shadowOAM[60 + i].attr2 = ((0)<<12) | (((foodCounter % 10) * 2)*32+(0));
        foodCounter /= 10;
        i++;
    } while (foodCounter);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

 state = WIN;
}

void win() {

 waitForVBlank();

 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToStart();
 }
}
