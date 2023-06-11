module farm.farmplot;

import w4 = wasm4;
import primitive.polygon;
import primitive.point;
import farm.farmplots;

const CELLS_W = w4.screenSize / CELLS_X;
const CELLS_H = w4.screenSize / CELLS_Y;

struct FarmPlot
{
    static Polygon poly = Polygon([
        Point(0, 0),
        Point(1, 0),
        Point(1, 1),
        Point(0, 1),
    ]);

    Point pos;

    this(int x, int y)
    {
        pos = Point(x, y);
    }

    this(Point pos)
    {
        this.pos = pos;
    }

    void update(float delta)
    {

    }

    void render()
    {
        poly.render(1, pos.scale(CELLS_W), CELLS_W);
    }
}