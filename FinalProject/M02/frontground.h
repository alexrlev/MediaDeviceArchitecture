
//{{BLOCK(frontground)

//======================================================================
//
//	frontground, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 16 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 1024 + 4096 = 5632
//
//	Time-stamp: 2019-04-05, 14:20:39
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FRONTGROUND_H
#define GRIT_FRONTGROUND_H

#define frontgroundTilesLen 1024
extern const unsigned short frontgroundTiles[512];

#define frontgroundMapLen 4096
extern const unsigned short frontgroundMap[2048];

#define frontgroundPalLen 512
extern const unsigned short frontgroundPal[256];

#endif // GRIT_FRONTGROUND_H

//}}BLOCK(frontground)
