
//{{BLOCK(frontground)

//======================================================================
//
//	frontground, 768x512@4, 
//	+ palette 256 entries, not compressed
//	+ 12 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 96x64 
//	Total size: 512 + 384 + 12288 = 13184
//
//	Time-stamp: 2019-04-22, 10:46:54
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FRONTGROUND_H
#define GRIT_FRONTGROUND_H

#define frontgroundTilesLen 384
extern const unsigned short frontgroundTiles[192];

#define frontgroundMapLen 12288
extern const unsigned short frontgroundMap[6144];

#define frontgroundPalLen 512
extern const unsigned short frontgroundPal[256];

#endif // GRIT_FRONTGROUND_H

//}}BLOCK(frontground)
