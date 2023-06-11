module gui.palette;

import w4 = wasm4;
import primitive.point;
import std.format;

const int COLORS = 4;
const int BAR_WIDTH = 20;
const int BAR_HEIGHT = 10;

void drawPalette() {
    auto offset = Point(20,20);
    static char[2] text;
    text[1] = '\0';
    for (ushort i = 0; i <= COLORS; i++){
        *w4.drawColors = i;
        w4.rect(offset.x,offset.y, BAR_WIDTH, BAR_HEIGHT);

        *w4.drawColors = i != 4 ? 4:1;
        text[0] = cast(char)(i+48);
        w4.text(cast(const char*) &text, offset.x, offset.y);

        offset = offset.add(0,BAR_HEIGHT);
    }
}