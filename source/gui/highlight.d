module gui.highlight;

import w4 = wasm4;
import w4e = wasm4e;
import farm.farmplot;
import config;

void renderHighlight() {
    int posX = (cast(int) (*w4.mouseX / CELLS_W)) * CELLS_W;
    int posY = (cast(int) (*w4.mouseY / CELLS_H)) * CELLS_H;

    *w4.drawColors = CDARK;
    w4e.cornerlessRect(posX, posY, CELLS_W-1, CELLS_H-1);
}