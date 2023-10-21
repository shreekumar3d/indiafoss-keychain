
module logo_base() {
  linear_extrude(height=2)
    import("indiafoss-logo-outline.svg", layer="Text", $fn = 100);
}

module logo_lettering() {
  union() {
    difference() {
      linear_extrude(height=1)
        import("indiafoss-logo-rect.svg", layer="Text", $fn = 100);
      translate([0,0,-0.5])
        linear_extrude(height=2)
          import("indiafoss-logo-indiafoss.svg", layer="Text", $fn = 100);
    }

    linear_extrude(height=1)
      import("indiafoss-logo-3p0.svg", layer="Text", $fn = 100);
  }
}

module logo_hole() {
  translate([0,0,-5])
    linear_extrude(height=10)
      import("indiafoss-logo-hole.svg", $fn = 100);
}

module logo_reverse_lettering() {
  linear_extrude(height=2)
    import("indiafoss-logo-2023.svg", layer="Text", $fn = 100);   
}

module logo_reverse_pattern() {
  translate([0.5,-2.5,2])
  intersection() {
    translate([2,5,-6])
      color("green")
        cube([84,28,4]);

    translate([-25,-3,0])
      color("red")
      for(i=[0:1:8]) {
        translate([i*14,0,-5]) {
          rotate(45,[0,0,1])
            cube([60,3,2]);
        }
        translate([i*14,40,-5]) {  
          rotate(-45,[0,0,1])
            cube([60,3,2]);
        }
      }
  }
}

scale([0.4,0.4,1])
difference() {
  union() {
    logo_lettering();
    translate([0,0,-2])
      logo_base();
  }
  logo_hole();
  translate([0,0,-3])
    logo_reverse_lettering();
  logo_reverse_pattern();
}