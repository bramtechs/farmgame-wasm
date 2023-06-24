module app;

import w4 = wasm4;
import gui.cursor;
import primitive.point;
import farm;
import gui;
import gui.palette;
import gui.highlight;

static Farm myFarm;
static GameGUI gameGUI;

extern (C) int rand();

extern (C) void start()
{
    myFarm.setup();
    gameGUI.setup();
}

void input()
{
    static ubyte prevState;
    const gamepad = *w4.gamepad1;
    const justPressed = gamepad & (gamepad ^ prevState);

    if (justPressed & w4.buttonDown)
    {
        togglePaletteVisible();
    }

    if (justPressed & w4.button1)
    {
        toggleCursorVisible();
    }

    prevState = gamepad;
}

void clear()
{
    w4.rect(0, 0, w4.screenSize, w4.screenSize);
}

extern (C) void update()
{
    input();

    *w4.drawColors = 2;
    clear();

    float delta = 1.0f / 60;

    myFarm.update(delta);
    myFarm.render();
    gameGUI.update(delta);
    gameGUI.render();

    renderPalette();
    renderHighlight();
    renderCursor();
}
