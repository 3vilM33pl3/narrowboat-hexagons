
color("Peru", 1.0)
{
    // hexagon base
    linear_extrude(height = 6.2, center = false, convexity = 10, twist = 0)
    circle(30, $fn=6);
}