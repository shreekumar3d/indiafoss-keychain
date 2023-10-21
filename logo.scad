
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

// Step well architecture to make the hole on the bed
// bigger, while keeping the top in alignment with the
// "0" on the top of the logo
module logo_hole() {
  for(i=[0:0.1:5]) {
    translate([0,0,-3.5-i])
      linear_extrude(height=3.6)
        offset(r=i*0.8)
          import("indiafoss-logo-hole.svg", $fn = 100);
  }
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

    translate([-25,-4,0])
      color("red")
      for(i=[0:1:8]) {
        translate([i*14,0,-5]) {
          rotate(45,[0,0,1])
            cube([60,4.5,2]);
        }
        translate([i*14,40,-5]) {  
          rotate(-45,[0,0,1])
            cube([60,4.5,2]);
        }
      }
  }
}

// Scale down X & Y, but make the logo
// slighty clunkier
scale([0.4,0.4,1.25])
union() {
  color("red")
  logo_lettering();
  difference() {
    translate([0,0,-2])
      logo_base();

    logo_hole();
    translate([0,0,-3])
      logo_reverse_lettering();
    logo_reverse_pattern();
  }
}