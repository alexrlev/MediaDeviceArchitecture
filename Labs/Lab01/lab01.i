# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"
# 23 "lab01.c"
void setPixel(int, int, unsigned short);
void drawTriangle(int, int);


unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    (*(unsigned short *)0x4000000) = 3 | (1<<10);

    drawTriangle(50, 60);
    drawTriangle(30, 20);
    drawTriangle(90, 100);

    while(1);
}



void setPixel(int row, int col, unsigned short color) {

 videoBuffer[((row)*(240)+(col))] = color;

}

void drawTriangle(int row, int col) {

    int length = 25;

    for (int i = 0; i < length; i++) {
  setPixel(row + i, col, ((0) | (31)<<5 | (0)<<10));
  setPixel(row, col + i, ((0) | (31)<<5 | (0)<<10));
  setPixel((row + length - i), (col + i), ((0) | (31)<<5 | (0)<<10));
 }

}
