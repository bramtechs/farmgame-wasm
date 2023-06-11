module farm.states.rough;
import farm.farmplot;
import gfx.noiserect;
import config;

import w4 = wasm4;

struct RoughPlot {
    static NoiseRect noise;

    private void cut(int x, int y) const {
        const radius = 5;
        *w4.drawColors = 0x22;
        w4.oval(x-radius/2,y-radius/2,radius,radius);
    }

    void render(int x, int y)
    {
        int hash = x * y * y * x + x;

        if (!noise.generated){
            noise = NoiseRect(CELLS_W, CELLS_H);
            noise.makeNoise(CMEDIUM, CLIGHT, 85);
            w4.trace("Generated noise rectangle!");
        }

        const BORDER = 1;
        noise.render(x * CELLS_W, y * CELLS_H, hash);

        cut((x+0)*CELLS_W, (y+0)*CELLS_H);
        cut((x+1)*CELLS_W, (y+0)*CELLS_H);
        cut((x+0)*CELLS_W, (y+1)*CELLS_H);
        cut((x+1)*CELLS_W, (y+1)*CELLS_H);

        *w4.drawColors = 0x02;
        w4.rect(x*CELLS_W+BORDER,y*CELLS_H+BORDER,CELLS_W-BORDER-1,CELLS_H-BORDER-1);

    }
}