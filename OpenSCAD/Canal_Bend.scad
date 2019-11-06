// resolution bezier curve
deltat = 0.003;

// cubic bexier curve function
function cubic_bezier(p0,p1,p2,p3) = [for (t=[0:deltat:1+deltat]) pow(1-t,3)*p0+3*pow((1-t),2)*t*p1+3*(1-t)*pow(t,2)*p2+pow(t,3)*p3];
    
function reverse(v) = [for (i=[len(v)-1:-1:0]) v[i]];
function delete_first(v) = [for (i=[1:len(v)-1]) v[i]]; 

// cubic bezier curve for canal shape 
// +1 for a clean boolean operation
p10 = [-150, 125+1];
p11 = [-60, 125+1];
p12 = [-120, 35];
p13 = [0, 35];

p20 = [150, 125+1];
p21 = [60, 125+1];
p22 = [120, 35];
p23 = [0, 35];

// bezier curve
points_left = cubic_bezier(p10, p11, p12, p13);
points_right = reverse(cubic_bezier(p20, p21, p22, p23));
points = concat(points_left, points_right);


difference()
{
    
    // hexagon base
    color("Peru", 1.0)
    {
        linear_extrude(height = 125, center = false, convexity = 10, twist = 0)
        circle(300, $fn=6);
    }
    
    color("DodgerBlue", 1.0)
    {
        tx=450;
        ty=259.8;
        // canal shape
        translate([-tx, -ty, 0])
        rotate_extrude(angle=360, convexity=10, $fn=90)
        translate([-tx, 0, -ty])
        polygon(points);
    }
}

