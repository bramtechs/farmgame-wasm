module farm.farmplot;

import w4 = wasm4;
import w4e = wasm4e;

import primitive.polygon;
import primitive.point;
import farm.farmplots;
import gfx.noiserect;

const CELLS_W = w4.screenSize / CELLS_X;
const CELLS_H = w4.screenSize / CELLS_Y;

struct FarmPlot
{
    static NoiseRect noise;

    static this(){
        noise = NoiseRect(CELLS_W, CELLS_H);
        noise.makeNoise(0, 1, 0.5f);
    }

    int x;
    int y;

    this(int x, int y)
    {
        this.x = x;
        this.y = y;
    }

    void update(float delta)
    {

    }

    void render()
    {
        *w4.drawColors = 1;
        w4e.hollowRect(x*CELLS_W, y*CELLS_H, CELLS_W, CELLS_H);
    }
}
