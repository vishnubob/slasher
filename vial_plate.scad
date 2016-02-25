 difference() {
     linear_extrude(height=22.0, center=false, twist=0.0, slices=20, scale=1.0) {
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

     translate([0.0, 0.0, 2.0]) {
         union() {
             translate([-50.18666666666667, -27.07, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([-50.18666666666667, -1.7763568394002505e-15, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([-50.18666666666667, 27.07, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([-25.09333333333334, -27.07, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([-25.09333333333334, -1.7763568394002505e-15, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([-25.09333333333334, 27.07, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([1.7763568394002505e-15, -27.07, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([1.7763568394002505e-15, -1.7763568394002505e-15, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([1.7763568394002505e-15, 27.07, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([25.093333333333334, -27.07, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([25.093333333333334, -1.7763568394002505e-15, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([25.093333333333334, 27.07, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([50.18666666666667, -27.07, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([50.18666666666667, -1.7763568394002505e-15, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

             translate([50.18666666666667, 27.07, 0.0]) {
                 cylinder(r=11.4, h=22.0, center=false, $fn=200.0);
            }

        }

    }

}
