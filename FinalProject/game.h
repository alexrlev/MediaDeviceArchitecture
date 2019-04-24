// Constants
#define MAPHEIGHT 300
#define MAPWIDTH 300

// Variables
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

// Prototypes
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

//cashier
typedef struct {
	int row;
	int col;
	int height;
	int width;
} CASHIER;

//food
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

//int foodNum = 3;
void initFood();
void updateFood();
void drawFood();

//coupons
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

//int couponNum = 2;
void initCoupons();
void updateCoupons();
void drawCoupons();