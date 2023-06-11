module app;

import w4 = wasm4;
import gui.cursor;
import primitive.point;
import farm;

static Farm _farm();

extern(C) int rand();

extern(C) void start()
{
}

void input()
{
    static ubyte prevState;
    const gamepad = *w4.gamepad1;
    const justPressed = gamepad & (gamepad ^ prevState);

    if (justPressed & w4.buttonLeft){
        // left
        w4.trace("left");
    }

    if (justPressed & w4.buttonRight){
        // right
        w4.trace("right");
    }

    if (justPressed & w4.buttonUp){
        // up
        w4.trace("up");
    }

    if (justPressed & w4.buttonDown){
        // down
        w4.trace("down");
    }

    prevState = gamepad;
}

extern(C) void update()
{
    input();

    *w4.drawColors = 2;
    w4.rect(1,1,w4.screenSize-2,w4.screenSize-2);

    _farm.render();
    renderCursor();
}
