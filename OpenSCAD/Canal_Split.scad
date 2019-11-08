// resolution bezier curve
deltat = 0.004;

// cubic bexier curve function
function cubic_bezier(p0,p1,p2,p3) = [for (t=[0:deltat:1+deltat]) pow(1-t,3)*p0+3*pow((1-t),2)*t*p1+3*(1-t)*pow(t,2)*p2+pow(t,3)*p3];
    
function reverse(v) = [for (i=[len(v)-1:-1:0]) v[i]];
function delete_first(v) = [for (i=[1:len(v)-1]) v[i]]; 

// cubic bezier curve for canal shape 
p10 = [-75, 63];
p11 = [-30, 63];
p12 = [-60, 18];
p13 = [0, 18];

p20 = [75, 63];
p21 = [30, 63];
p22 = [60, 18];
p23 = [0, 18];

// bezier curve
points_left = cubic_bezier(p10, p11, p12, p13);
points_right = reverse(cubic_bezier(p20, p21, p22, p23));
points = concat(points_left, points_right);


difference()
{
    
    // hexagon base
    color("Peru", 1.0)
    {
        linear_extrude(height = 62, center = false, convexity = 10, twist = 0)
        circle(300, $fn=6);
    }
    
    color("DodgerBlue", 1.0)
    {
        union()
        {
            tx=450;
            ty=259.8;
            // canal shape
            translate([-tx, -ty, 0])
            rotate_extrude(angle=360, convexity=10, $fn=90)
            translate([-tx, 0, -ty])
            polygon(points);
            
            // canal shape
            translate([tx, -ty, 0])
            rotate_extrude(angle=360, convexity=10, $fn=90)
            translate([tx, 0, -ty])
            polygon(points);
        }
    }
}

