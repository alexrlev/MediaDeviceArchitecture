
//{{BLOCK(bg)

//======================================================================
//
//	bg, 256x256@8, 
//	+ palette 255 entries, not compressed
//	+ 39 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 510 + 2496 + 2048 = 5054
//
//	Time-stamp: 2019-03-30, 10:58:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG_H
#define GRIT_BG_H

#define bgTilesLen 2496
extern const unsigned short bgTiles[1248];

#define bgMapLen 2048
extern const unsigned short bgMap[1024];

#define bgPalLen 510
extern const unsigned short bgPal[256];

#endif // GRIT_BG_H

//}}BLOCK(bg)
