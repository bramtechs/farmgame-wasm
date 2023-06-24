module gui;

import w4 = wasm4;
import primitive.point;
import gui.toolbox;
import gui.toolbox.toolicon;

struct GameGUI {
    Toolbox toolbox;

    public void setup() {
        toolbox = Toolbox();

        const int MARGIN = 5;
        int y = w4.screenSize-MARGIN-ToolIcon.WIDTH;
        toolbox.setup(Point(MARGIN,y));
        toolbox.centerX(y);
    }

    public void update(float delta){
        toolbox.update(delta);
    }

    public void render(){
        toolbox.render();
    }
}