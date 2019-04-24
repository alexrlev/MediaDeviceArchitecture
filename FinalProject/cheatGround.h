
//{{BLOCK(cheatGround)

//======================================================================
//
//	cheatGround, 768x512@4, 
//	+ palette 256 entries, not compressed
//	+ 12 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 96x64 
//	Total size: 512 + 384 + 12288 = 13184
//
//	Time-stamp: 2019-04-23, 12:50:20
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_CHEATGROUND_H
#define GRIT_CHEATGROUND_H

#define cheatGroundTilesLen 384
extern const unsigned short cheatGroundTiles[192];

#define cheatGroundMapLen 12288
extern const unsigned short cheatGroundMap[6144];

#define cheatGroundPalLen 512
extern const unsigned short cheatGroundPal[256];

#endif // GRIT_CHEATGROUND_H

//}}BLOCK(cheatGround)
