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
# 184 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 195 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 235 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 291 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2
# 1 "sampleBackground.h" 1
# 22 "sampleBackground.h"
extern const unsigned short sampleBackgroundTiles[7840];


extern const unsigned short sampleBackgroundMap[2048];


extern const unsigned short sampleBackgroundPal[256];
# 3 "main.c" 2
# 1 "frontground.h" 1
# 22 "frontground.h"
extern const unsigned short frontgroundTiles[512];


extern const unsigned short frontgroundMap[2048];


extern const unsigned short frontgroundPal[256];
# 4 "main.c" 2
# 1 "game.h" 1

enum {BLACKID=(256-5), REDID, WHITEID, YELLOWID};
extern unsigned short colors[5];
# 5 "main.c" 2

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

unsigned short buttons;
unsigned short oldButtons;


typedef enum {START, INSTR, GAME, PAUSE, WIN, LOSE} states;
states state;

int hOff;

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
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
            default:
                break;
        }

  oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);
 }
}

void initialize() {

 unsigned short colors[5] = {((0) | (0)<<5 | (0)<<10), ((31) | (0)<<5 | (0)<<10), ((31) | (31)<<5 | (31)<<10), ((31) | (31)<<5 | (0)<<10)};

 (*(unsigned short *)0x4000000) = (0<<0) | (1<<8) | (1<<9);

 (*(volatile unsigned short*)0x400000A) = (0<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
 (*(volatile unsigned short*)0x4000008) = (1<<14) | ((1)<<2) | ((30)<<8);

 DMANow(3, sampleBackgroundPal, ((unsigned short *)0x5000000), 256);

 DMANow(3, sampleBackgroundTiles, &((charblock *)0x6000000)[0], 15680/2);

 DMANow(3, sampleBackgroundMap, &((screenblock *)0x6000000)[28], 1024/2);

 DMANow(3, frontgroundTiles, &((charblock *)0x6000000)[1], 1024/2);

 DMANow(3, frontgroundMap, &((screenblock *)0x6000000)[30], 4096/2);

 hOff = 0;

 buttons = (*(volatile unsigned short *)0x04000130);

 goToStart();
}

void goToStart() {
 state = START;
 waitForVBlank();
 flipPage();
}

void start() {

 waitForVBlank();


 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToInstr();
 }
}

void goToInstr() {
 state = INSTR;
 waitForVBlank();
 flipPage();
}

void instr () {

 waitForVBlank();


 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToGame();
 }
}

void goToGame() {
 state = GAME;
 waitForVBlank();
 flipPage();
}

void game() {

 hOff++;

 (*(volatile unsigned short *)0x04000014) = hOff / 2;
 (*(volatile unsigned short *)0x04000010) = hOff;

 waitForVBlank();
 flipPage();

 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToPause();
 }
 if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
  goToLose();
 }
}

void goToPause() {
 state = PAUSE;
 waitForVBlank();
 flipPage();
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
 state = LOSE;
 waitForVBlank();
 flipPage();
}

void lose() {

 waitForVBlank();

 if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToStart();
 }
}
