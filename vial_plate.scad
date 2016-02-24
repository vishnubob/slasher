 difference() {
     union() {
         translate([0.0, 0.0, 12.41]) {
             cube([125.22, 82.94, 20.0], center=true);
        }

         linear_extrude(height=2.41, center=false, twist=0.0, slices=20, scale=1.0) {
             hull() {
                 translate([-60.7, -39.56, 0.0]) {
                     circle(r=3.18, $fn=200.0);
                }

                 translate([60.7, -39.56, 0.0]) {
                     circle(r=3.18, $fn=200.0);
                }

                 translate([-60.7, 39.56, 0.0]) {
                     circle(r=3.18, $fn=200.0);
                }

                 translate([60.7, 39.56, 0.0]) {
                     circle(r=3.18, $fn=200.0);
                }

            }

        }

    }

     translate([0.0, 0.0, 11.0]) {
         union() {
             translate([-49.24, -26.36, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([-49.24, 0.0, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([-49.24, 26.36, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([-24.619999999999997, -26.36, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([-24.619999999999997, 0.0, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([-24.619999999999997, 26.36, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([0.0, -26.36, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([0.0, 0.0, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([0.0, 26.36, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([24.619999999999997, -26.36, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([24.619999999999997, 0.0, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([24.619999999999997, 26.36, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([49.239999999999995, -26.36, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([49.239999999999995, 0.0, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

             translate([49.239999999999995, 26.36, 0.0]) {
                 cylinder(r=11.25, h=20.0, center=false);
            }

        }

    }

}
