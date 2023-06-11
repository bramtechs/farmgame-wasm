module primitive.polygon;
import primitive.point;
import w4 = wasm4;

struct Polygon {
    Point[] points;

    this(Point[] points) {
        this.points = points;
    }

    void render(byte color, Point offset=Point(0,0), float scale=1.0f){
        *w4.drawColors = color;
        for (int i = 0; i < points.length; i++) {
            Point p1 = points[i].scale(scale).add(offset);
            Point p2 = points[(i + 1) % points.length].scale(scale).add(offset);
            w4.line(p1.x, p1.y, p2.x, p2.y);
        }
    }
}