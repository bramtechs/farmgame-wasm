module farm;

import farm.farmplots;
import gameobject;

class Farm : GameObject
{
    FarmPlots plots();

    public void update(float delta)
    {
        plots.update(delta);
    }

    public void render()
    {
        plots.render();
    }
}
