
//{{BLOCK(bgLose)

//======================================================================
//
//	bgLose, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 40 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2560 + 2048 = 5120
//
//	Time-stamp: 2019-03-30, 07:59:04
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGLOSE_H
#define GRIT_BGLOSE_H

#define bgLoseTilesLen 2560
extern const unsigned short bgLoseTiles[1280];

#define bgLoseMapLen 2048
extern const unsigned short bgLoseMap[1024];

#define bgLosePalLen 512
extern const unsigned short bgLosePal[256];

#endif // GRIT_BGLOSE_H

//}}BLOCK(bgLose)
