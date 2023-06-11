module gui.cursor;
import w4 = wasm4;
import primitive.polygon;
import primitive.point;

Polygon MousePoly = Polygon([
    Point(0, 0),
    Point(3, 3),
    Point(0, 0),
    Point(-1, 1),
    Point(1, -1),
    Point(-1, -1),
    Point(-1, 1)
]);

void renderCursor()
{
    const Point mousePos = Point(*w4.mouseX, *w4.mouseY).add(3,3);
    MousePoly.render(1, mousePos, 2);
}
