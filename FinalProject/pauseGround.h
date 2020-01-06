
//{{BLOCK(pauseGround)

//======================================================================
//
//	pauseGround, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 193 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12352 + 2048 = 14912
//
//	Time-stamp: 2019-04-22, 14:25:51
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEGROUND_H
#define GRIT_PAUSEGROUND_H

#define pauseGroundTilesLen 12352
extern const unsigned short pauseGroundTiles[6176];

#define pauseGroundMapLen 2048
extern const unsigned short pauseGroundMap[1024];

#define pauseGroundPalLen 512
extern const unsigned short pauseGroundPal[256];

#endif // GRIT_PAUSEGROUND_H

//}}BLOCK(pauseGround)
