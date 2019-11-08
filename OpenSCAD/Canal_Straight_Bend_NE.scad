// resolution bezier curve
deltat = 0.004;

// cubic bexier curve function
function cubic_bezier(p0,p1,p2,p3) = [for (t=[0:deltat:1+deltat]) pow(1-t,3)*p0+3*pow((1-t),2)*t*p1+3*(1-t)*pow(t,2)*p2+pow(t,3)*p3];
    
function reverse(v) = [for (i=[len(v)-1:-1:0]) v[i]];
function delete_first(v) = [for (i=[1:len(v)-1]) v[i]]; 

// cubic bezier curve for canal shape 
p10 = [-7.5, 6.3];
p11 = [-3.0, 6.3];
p12 = [-6.0, 1.8];
p13 = [0.0, 1.8];

p20 = [7.5, 6.3];
p21 = [3.0, 6.3];
p22 = [6.0, 1.8];
p23 = [0.0, 1.8];


// bezier curve
points_left = cubic_bezier(p10, p11, p12, p13);
points_right = reverse(cubic_bezier(p20, p21, p22, p23));
points = concat(points_left, points_right);

difference()
{
    color("Peru", 1.0)
    {
        // hexagon base
        linear_extrude(height = 6.2, center = false, convexity = 10, twist = 0)
        circle(30, $fn=6);
    }
    
    color("DodgerBlue", 1.0)
    {
        union()
        {
            // canal shape
            rotate([90,0,0])
            linear_extrude(height = 120, center = true, convexity = 10, twist = 0)
            polygon(points);
            
            tx=45.0;
            ty=25.98;
            // canal shape
            translate([tx, -ty, 0])
            rotate_extrude(angle=360, convexity=10, $fn=90)
            translate([tx, 0, -ty])
            polygon(points);
        }
    }
    
}
