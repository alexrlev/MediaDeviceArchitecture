
//{{BLOCK(skyTiles)

//======================================================================
//
//	skyTiles, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 18 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1152 + 2048 = 3712
//
//	Time-stamp: 2019-03-12, 16:33:55
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SKYTILES_H
#define GRIT_SKYTILES_H

#define skyTilesTilesLen 1152
extern const unsigned short skyTilesTiles[576];

#define skyTilesMapLen 2048
extern const unsigned short skyTilesMap[1024];

#define skyTilesPalLen 512
extern const unsigned short skyTilesPal[256];

#endif // GRIT_SKYTILES_H

//}}BLOCK(skyTiles)
