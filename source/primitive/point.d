module primitive.point;

struct Point
{
    public static Point zero = Point(0, 0);

    int x;
    int y;

    this(int x, int y)
    {
        this.x = x;
        this.y = y;
    }

    Point scale(float factor) const
    {
        return Point(cast(int)(cast(float) x * factor),
            cast(int)(cast(float) y * factor));
    }

    Point add(Point p) const
    {
        return this.add(p.x, p.y);
    }

    Point add(int x, int y) const
    {
        return Point(this.x + x, this.y + y);
    }
}
