module gfx.noiserect;

import app;
import w4 = wasm4;

const MAX_NOISE_RECT_SIZE = 32 * 32;

struct NoiseRect
{
    ubyte[MAX_NOISE_RECT_SIZE] filled;
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

    public void makeNoise(ubyte bgColor, ubyte fgColor, float chance = 0.5f)
    {
        for (int i = 0; i < w * h; i++)
        {
            filled[i] = rand() < chance ? fgColor : bgColor;
        }
    }

    public void render(uint x, uint y)
    {
        w4.blit(cast(const ubyte*) &filled, x, y, w, h, 0);
    }
}
