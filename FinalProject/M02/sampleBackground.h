
//{{BLOCK(sampleBackground)

//======================================================================
//
//	sampleBackground, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 245 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 15680 + 4096 = 20288
//
//	Time-stamp: 2019-04-05, 14:19:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SAMPLEBACKGROUND_H
#define GRIT_SAMPLEBACKGROUND_H

#define sampleBackgroundTilesLen 15680
extern const unsigned short sampleBackgroundTiles[7840];

#define sampleBackgroundMapLen 4096
extern const unsigned short sampleBackgroundMap[2048];

#define sampleBackgroundPalLen 512
extern const unsigned short sampleBackgroundPal[256];

#endif // GRIT_SAMPLEBACKGROUND_H

//}}BLOCK(sampleBackground)
