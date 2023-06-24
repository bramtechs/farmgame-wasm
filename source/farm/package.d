module farm;

import farm.farmplots;
import gui.toolbox;

struct Farm
{
    FarmPlots plots;

    public void setup()
    {
        plots.setup();
    }

    public void update(float delta)
    {
        plots.update(delta);
    }

    public void render()
    {
        plots.render();
    }
}
