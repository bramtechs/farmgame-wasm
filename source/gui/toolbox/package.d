module gui.toolbox;

import primitive.point;
import w4 = wasm4;
import gui.toolbox.toolicon;

struct Toolbox {
    private static const int COUNT = 5;
    ToolIcon[COUNT] icons;

    public void centerX(int y){
        Point topRight = this.setup(Point(0,y));
        int x = w4.screenSize / 2 - topRight.x / 2;
        this.setup(Point(x, topRight.y));
    }

    public Point setup(Point offset=Point()){
        const int MARGIN = 10;
        const int TOTAL_WIDTH = ToolIcon.WIDTH + MARGIN;
        Point pos = offset;
        for (int i = 0; i < COUNT; i++){
            icons[i].setPos(pos);
            pos.x += TOTAL_WIDTH;
        }
        return Point(pos.x - offset.x - MARGIN, pos.y);
    }

    public void update(float delta){
        for (int i = 0; i < COUNT; i++)
        {
            icons[i].update(delta);
        }
    }

    public void render(){
        for (int i = 0; i < COUNT; i++)
        {
            icons[i].render();
        }
    }
}