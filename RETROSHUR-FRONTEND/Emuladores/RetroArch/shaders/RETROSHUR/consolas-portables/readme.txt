GBA-standard-x tries to replicate how Gameboy Advance colors looks like. Good for most games.
GBA-high-x tries to replicate how the screen looks like in strong sunlight. 
Better for dark games such as the 1st Castlevania, Metroid games...
GBA-LUT-x is more GPU dependant, uses a lookup table and needs more video memory.
It gives deeper colors (more "ideals" than similar to the GBA screen). Use the contrast setting depending on games.

DS-no-border tries to be similar to the original Nintendo DS, without border.
DS-64-x with unrealistic border for DeSmuME core options -> screen gap = 64. (gives the ideal gap between screens)
DS-90-x with Dsi ratio border for DeSmuME core options -> screen gap = 90.

GB-x is a gameboy shader
GB-pocket-x for the gameboy pocket.
GB-pocket-high-contrast-x gets away from the original machine to give more contrast in black & white.
GB-color-x for the gameboy color. Gambatte has an option to simulate the original screen colors.

Game-Gear-x is a Game Gear shader. It's possible you'll see some scaling problems at various sizes because of the non-square pixels the machine uses.
Some games like Mickey Castle of Illusion or Prince of Persia were ported directly from the Master System and used an adapter to scale their resolution down to the Game Gear screen.
Most (all?) emulators can't do the same. You can try to lower the SCALE option to 0.66 to make up for it, even if far from perfect.

NGPC-x for the Neo-Geo Pocket Color.

WSwan-x for the Bandai WonderSwan Color.



Borders have more details than the ones found in Libretro shader repository (for size limitation there):
-Game Gear and NGPC are less compressed
-Gameboy and Gameboy pocket have a dithering applied to limit the bending of the glass light effect



credits:

dmg-shader (Game Boy) made by hi-ban from Harlequin original work.
LCD shader made by CGWG.
image-adjustment-v2 shader and some parameters addition made by hunterk.
DS, GBA LUT and color settings made by Pokefan531.
GameBoy Pocket / Color / Advance picture drawn by BLUEamnesiac.
Other pictures taken from wikipedia / wikimedia.
Other work if I forget any linked to Libretro shader repository: https://github.com/libretro/common-shaders
Everything glued together by Tatsuya79.