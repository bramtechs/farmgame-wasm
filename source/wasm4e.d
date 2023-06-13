module wasm4e;

import w4 = wasm4;

void pixel(int x, int y) {
    // The byte index into the framebuffer that contains (x, y)
    int idx = (y * w4.screenSize + x) >> 2;

    // Calculate the bits within the byte that corresponds to our position
    int shift = (x & 0b11) << 1;
    int mask = 0b11 << shift;

    // Use the first draw color as the pixel color
    int palette_color = *w4.drawColors & 0b1111;
    if (palette_color == 0) {
        // Transparent
        return;
    }
    int color = (palette_color - 1) & 0b11;

    // Write to the framebuffer
    w4.framebuffer[idx] =
        cast(ubyte)((color << shift) | (w4.framebuffer[idx] & ~mask));
}

void cornerlessRect(int x, int y, uint width, int height){
    w4.hline(x+1,y,width-1);
    w4.vline(x,y+1,height-1);

    w4.hline(x+1,y+height,width-1);
    w4.vline(x+width,y+1,height-1);
}