module gfx.noiserect;

import app;
import w4 = wasm4;
import w4e = wasm4e;

const MAX_NOISE_RECT_SIZE = 32 * 32;

struct NoiseRect
{
    ubyte[MAX_NOISE_RECT_SIZE] filled;
    bool generated;
    int w;
    int h;

    this(int w, int h)
    {
        if (w * h >= MAX_NOISE_RECT_SIZE)
        {
            w4.trace("NoiseRect too big!");
            return;
        }
        this.w = w;
        this.h = h;
    }

    public void makeNoise(ubyte bgColor, ubyte fgColor, int chance = 50)
    {
        for (int i = 0; i < MAX_NOISE_RECT_SIZE; i++)
        {
            int rng = rand() % 100;
            filled[i] = rng < chance ? fgColor : bgColor;
        }
        generated = true;
    }

    public void render(uint x, uint y, int offset=0)
    {
        for (int yy = 0; yy < h; yy++){
            for (int xx = 0; xx < w; xx++){
                int i = (yy * w + xx + offset) % MAX_NOISE_RECT_SIZE;
                *w4.drawColors = filled[i];
                w4e.pixel(x+xx, y+yy);
            }
        }
    }
}
