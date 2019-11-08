r=30;
h=6.2;

// small number
e=.02;

translate([0,0, 6.2])
difference(){
    cylinder(h,r,r, $fn=6);
    translate([-r, -2*r,-e])
    cube([2*r,2*r,h+2*e]);
}