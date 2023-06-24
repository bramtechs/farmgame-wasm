module gui.toolbox.toolicon;

import w4 = wasm4;
import w4e = wasm4e;
import primitive.point;
import config;

struct ToolIcon {
    public static const int WIDTH = 16;
    private Point pos;

    public void update(float delta){
    }

    public void setPos(Point pos){
        this.pos = pos;
    }

    public void render(){
        *w4.drawColors = CDARKER;
        w4e.cornerlessRect(pos.x, pos.y, WIDTH,WIDTH);
        *w4.drawColors = CDARK;
        w4.rect(pos.x+1,pos.y+1,WIDTH-1,WIDTH-1);
    }
}