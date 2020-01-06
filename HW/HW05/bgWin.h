
//{{BLOCK(bgWin)

//======================================================================
//
//	bgWin, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 43 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2752 + 2048 = 5312
//
//	Time-stamp: 2019-03-30, 09:54:09
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGWIN_H
#define GRIT_BGWIN_H

#define bgWinTilesLen 2752
extern const unsigned short bgWinTiles[1376];

#define bgWinMapLen 2048
extern const unsigned short bgWinMap[1024];

#define bgWinPalLen 512
extern const unsigned short bgWinPal[256];

#endif // GRIT_BGWIN_H

//}}BLOCK(bgWin)
