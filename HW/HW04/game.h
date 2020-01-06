// Player Struct
typedef struct {
	int row;
	int col;
	int cdel;
	int height;
	int width;
	unsigned short color;
} PLAYER;

// Blocks Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
} BLOCK;

// Ball Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
} BALL;

// Constants
#define BLOCKCOUNT 8
#define BALLCOUNT 3

// Variables
extern PLAYER player;
extern PLAYER player2;
extern BLOCK blocks[BLOCKCOUNT];
extern BALL balls[BALLCOUNT];
extern int blocksRemaining;
extern int losing;

// game color palette
#define NUMCOLORS 5
enum {BLACKID=(256-NUMCOLORS), PURPLEID, REDID, WHITEID, YELLOWID};
extern unsigned short colors[NUMCOLORS];

// Prototypes
void initGame();
void updateGame();
void drawGame();
void drawBar();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initBlocks();
void drawBlock(BLOCK *);
void initBalls();
void updateBall(BALL *);
void drawBall(BALL *);