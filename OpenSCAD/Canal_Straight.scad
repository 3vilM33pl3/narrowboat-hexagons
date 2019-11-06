
// resolution bezier curve
deltat = 0.003;

// cubic bexier curve function
function cubic_bezier(p0,p1,p2,p3) = [for (t=[0:deltat:1+deltat]) pow(1-t,3)*p0+3*pow((1-t),2)*t*p1+3*(1-t)*pow(t,2)*p2+pow(t,3)*p3];


// cubic bezier curve for canal shape 
// +1 for a clean boolean operation
p0 = [-150, 125+1];
p1 = [-60, 125+1];
p2 = [-120, 35];
p3 = [0, 35];

// bezier curve
points = concat([[0, 125+1]], cubic_bezier(p0, p1, p2, p3));

difference()
{
    // hexagon base
    linear_extrude(height = 125, center = false, convexity = 10, twist = 0)
    circle(300, $fn=6);

    // canal shape
    union() 
    {
        rotate([90,0,0])
        linear_extrude(height = 800, center = true, convexity = 10, twist = 0)
        polygon(points);

        mirror([1,0,0])
        rotate([90,0,0])
        linear_extrude(height = 800, center = true, convexity = 10, twist = 0)
        polygon(points); 
    }
}