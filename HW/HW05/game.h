// Player Struct
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

// Bullet Struct
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

// Enemy Struct
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

// Characters
extern PLAYER player;
extern ENEMY enemy1[8];
extern ENEMY enemy2[8];
extern ENEMY enemy2b[8];
extern ENEMY enemy3[8];
extern ENEMY enemy3b[8];
extern BULLET bullets[5];

// Variables
extern int enemiesRemaining;
extern int livesRemaining;
extern int losing;
extern int seed;

// Prototypes
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