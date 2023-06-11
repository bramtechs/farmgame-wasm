module app;

import w4 = wasm4;
import gui.cursor;
import primitive.point;
import farm;
import gui.palette;

static Farm myFarm;
static bool renderPalette;

extern (C) int rand();

extern (C) void start()
{
    myFarm.setup();
}

void input()
{
    static ubyte prevState;
    const gamepad = *w4.gamepad1;
    const justPressed = gamepad & (gamepad ^ prevState);

    if (justPressed & w4.buttonLeft)
    {
        // left
        w4.trace("left");
    }

    if (justPressed & w4.buttonRight)
    {
        // right
        w4.trace("right");
    }

    if (justPressed & w4.buttonUp)
    {
        // up
        w4.trace("up");
    }

    if (justPressed & w4.buttonDown)
    {
        // down
        w4.trace("down");
        renderPalette = !renderPalette;
    }

    prevState = gamepad;
}

void clear() {
    w4.rect(0, 0, w4.screenSize, w4.screenSize);
}

extern (C) void update()
{
    input();

    *w4.drawColors = 2;
    clear();

    myFarm.render();

    if (renderPalette)
    {
        drawPalette();
    }

    renderCursor();
}
