
//{{BLOCK(winGround)

//======================================================================
//
//	winGround, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 290 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 18560 + 2048 = 21120
//
//	Time-stamp: 2019-04-24, 12:43:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINGROUND_H
#define GRIT_WINGROUND_H

#define winGroundTilesLen 18560
extern const unsigned short winGroundTiles[9280];

#define winGroundMapLen 2048
extern const unsigned short winGroundMap[1024];

#define winGroundPalLen 512
extern const unsigned short winGroundPal[256];

#endif // GRIT_WINGROUND_H

//}}BLOCK(winGround)
