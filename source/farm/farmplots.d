module farm.farmplots;

import w4 = wasm4;
import primitive.polygon;
import primitive.point;
import farm.farmplot;

const CELLS_X = 10;
const CELLS_Y = 10;

struct FarmPlots
{
    FarmPlot[CELLS_X][CELLS_Y] plots;

    public void setup()
    {
        for (int y = 0; y < CELLS_Y; y++)
        {
            for (int x = 0; x < CELLS_X; x++)
            {
                plots[x][y] = FarmPlot(x, y);
            }
        }
    }

    public void update(float delta)
    {

    }

    public void render()
    {
        for (int y = 0; y < CELLS_Y; y++)
        {
            for (int x = 0; x < CELLS_X; x++)
            {
                plots[x][y].render();
            }
        }
    }
}
