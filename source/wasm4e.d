module wasm4e;

import w4 = wasm4;

void hollowRect(int x, int y, uint w, uint h)
{
    w4.line(x, y, x + w, y);
    w4.line(x + w, y, x + w, y + h);
    w4.line(x, y + h, x + w, y + h);
    w4.line(x, y + h, x, y + h);
}
