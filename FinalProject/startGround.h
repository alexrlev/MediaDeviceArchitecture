
//{{BLOCK(startGround)

//======================================================================
//
//	startGround, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 304 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 19456 + 2048 = 22016
//
//	Time-stamp: 2019-04-24, 12:44:25
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTGROUND_H
#define GRIT_STARTGROUND_H

#define startGroundTilesLen 19456
extern const unsigned short startGroundTiles[9728];

#define startGroundMapLen 2048
extern const unsigned short startGroundMap[1024];

#define startGroundPalLen 512
extern const unsigned short startGroundPal[256];

#endif // GRIT_STARTGROUND_H

//}}BLOCK(startGround)
