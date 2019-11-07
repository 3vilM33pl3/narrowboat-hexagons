
color("Peru", 1.0)
{
    // hexagon base
    linear_extrude(height = 12.5, center = false, convexity = 10, twist = 0)
    circle(30.0, $fn=6);
}