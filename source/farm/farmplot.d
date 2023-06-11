module farm.farmplot;

import w4 = wasm4;
import w4e = wasm4e;

import primitive.polygon;
import primitive.point;

import farm.farmplots;
import farm.states.rough;

import gfx.noiserect;
import config;
import app;

export const CELLS_W = w4.screenSize / CELLS_X;
export const CELLS_H = w4.screenSize / CELLS_Y;

enum PlotGraphic {
    NONE = 0,
    ROUGH = 1,
    SOIL = 2,
}

struct FarmPlot
{
    int x;
    int y;
    int hash;

    union {
        RoughPlot rough;
    }
    PlotGraphic graphic;

    this(int x, int y)
    {
        this.x = x;
        this.y = y;
        this.graphic = cast(PlotGraphic) (rand() % 3);
    }

    void update(float delta)
    {

    }

    void render()
    {
        switch (graphic){
            case PlotGraphic.ROUGH:
                rough.render(x,y);
                return;
            case PlotGraphic.SOIL:
                return;
            default:
                return;
        }
    }
}
