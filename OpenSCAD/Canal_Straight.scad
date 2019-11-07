// resolution bezier curve
deltat = 0.004;

// cubic bexier curve function
function cubic_bezier(p0,p1,p2,p3) = [for (t=[0:deltat:1+deltat]) pow(1-t,3)*p0+3*pow((1-t),2)*t*p1+3*(1-t)*pow(t,2)*p2+pow(t,3)*p3];
    
function reverse(v) = [for (i=[len(v)-1:-1:0]) v[i]];
function delete_first(v) = [for (i=[1:len(v)-1]) v[i]]; 

// cubic bezier curve for canal shape 
// +1 for a clean boolean operation
p10 = [-15.0, 12.5+0.1];
p11 = [-6.0, 12.5+0.1];
p12 = [-12.0, 3.5];
p13 = [0, 3.5];

p20 = [15.0, 12.5+0.1];
p21 = [6.0, 12.5+0.1];
p22 = [12.0, 3.5];
p23 = [0, 3.5];

// bezier curve
points_left = cubic_bezier(p10, p11, p12, p13);
points_right = reverse(cubic_bezier(p20, p21, p22, p23));
points = concat(points_left, points_right);

difference()
{
    color("Peru", 1.0)
    {
        // hexagon base
        linear_extrude(height = 12.5, center = false, convexity = 10, twist = 0)
        circle(30.0, $fn=6);
    }
    
    color("DodgerBlue", 1.0)
    {
        // canal shape
        rotate([90,0,0])
        linear_extrude(height = 80.0, center = true, convexity = 10, twist = 0)
        polygon(points);
    }
    
}