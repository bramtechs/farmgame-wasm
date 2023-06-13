module gui.cursor;

import w4 = wasm4;
import primitive.polygon;
import primitive.point;
import config;

Polygon mousePoly = ([
    Point(0, 0),
    Point(3, 3),
    Point(0, 0),
    Point(-1, 1),
    Point(1, -1),
    Point(-1, -1),
    Point(-1, 1)
]);

bool isVisible = false;

void renderCursor()
{
    if (isVisible)
    {
        const Point mousePos = Point(*w4.mouseX, *w4.mouseY).add(3, 3);
        mousePoly.render(CDARK, mousePos, 2);
    }
}

void toggleCursorVisible()
{
    isVisible = !isVisible;
}

void setCursorVisible(bool visible)
{
    isVisible = visible;
}
