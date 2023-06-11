module farm.farmplots;

import gameobject;
import primitive.polygon;
import primitive.point;

class FarmPlot : GameObject
{
    Polygon poly = Polygon([
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
        poly.render(3, pos, 10);
    }
}

class FarmPlots : GameObject
{
    FarmPlot[10][10] plots();

    this()
    {
    }

    public void update(float delta)
    {

    }

    public void render()
    {
        for (int i = 0; i < plots.length; i++)
        {
            for (int j = 0; j < plots[i].length; j++)
            {
                plots[i][j].render();
            }
        }
    }
}
