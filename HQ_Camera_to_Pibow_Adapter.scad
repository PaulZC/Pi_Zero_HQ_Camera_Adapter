// An adapter which lets you attach the Raspberry Pi
// HQ Camera to the back of a Pimoroni Pibow Zero W

// You may need to increase the diameter of the holes
// depending on the accuracy of your printer

// Assembly:
// Install the micro SD card in the Pi Zero and attach
// a Pi Zero Camera Cable to the Pi
// Assemble the Pibow around the Pi using two screws +
// nuts to hold it together temporarily
// Fix the HQ camera to the adapter using four M2.5
// cap screws + nuts
// Attach the camera cable to the camera
// Carefully fold the Pi over onto the back of the
// adapter and attach to the adapter using four
// M3 screws + nuts

$fn=50; // fragments
thickness = 2.0; // plate thickness
width = 75.0; // external width (X)
depth = 40.0; // external depth (Y)
corner_hole_offset = 3.75; // offset of the corner hole
corner_hole_dia = 3.2; // diameter of the corner hole
support_separation = 30.0; // camera support separation
support_od = 5.5; // camera support outer diameter
support_id = 2.7; // camera support inner diameter
support_height = 3.5; // camera support height (Z)
screw_cap_od = 4.6; // screw cap recess outer diameter
screw_cap_depth = 2.5 ; // screw cap recess depth (Z)

module plate()
{
    translate([corner_hole_offset, corner_hole_offset, 0])
        minkowski() {
            cube([(width - (2 * corner_hole_offset)), (depth - (2 * corner_hole_offset)), (thickness / 2)]);
            cylinder(h=(thickness / 2), r=corner_hole_offset);
        }
}

module hole1()
// Cylinder is taller than required to avoid zero thickness skins
{
    translate([corner_hole_offset, corner_hole_offset, -1]) {
        cylinder(h=(thickness + 2),r=(corner_hole_dia / 2));
    }
}

module hole2()
{
    translate([corner_hole_offset,(depth - corner_hole_offset), -1]) {
        cylinder(h=(thickness + 2),r=(corner_hole_dia / 2));
    }
}

module hole3()
{
    translate([(width - corner_hole_offset), corner_hole_offset, -1]) {
        cylinder(h=(thickness + 2),r=(corner_hole_dia / 2));
    }
}

module hole4()
{
    translate([(width - corner_hole_offset), (depth - corner_hole_offset), -1]) {
        cylinder(h=(thickness + 2),r=(corner_hole_dia / 2));
    }
}

module support1()
{
    translate([((width - support_separation) / 2), ((depth - support_separation) / 2), 0]) {
        cylinder(h=(support_height + thickness),r=(support_od / 2));
    }
}

module support2()
{
    translate([((width + support_separation) / 2), ((depth - support_separation) / 2), 0]) {
        cylinder(h=(support_height + thickness),r=(support_od / 2));
    }
}

module support3()
{
    translate([((width - support_separation) / 2), ((depth + support_separation) / 2), 0]) {
        cylinder(h=(support_height + thickness),r=(support_od / 2));
    }
}

module support4()
{
    translate([((width + support_separation) / 2), ((depth + support_separation) / 2), 0]) {
        cylinder(h=(support_height + thickness),r=(support_od / 2));
    }
}

module support_hole1()
// Cylinder is taller than required to avoid zero thickness skins
{
    translate([((width - support_separation) / 2), ((depth - support_separation) / 2), -1]) {
        cylinder(h=(support_height + thickness + 2),r=(support_id / 2));
    }
}

module support_hole2()
{
    translate([((width + support_separation) / 2), ((depth - support_separation) / 2), -1]) {
        cylinder(h=(support_height + thickness + 2),r=(support_id / 2));
    }
}

module support_hole3()
{
    translate([((width - support_separation) / 2), ((depth + support_separation) / 2), -1]) {
        cylinder(h=(support_height + thickness + 2),r=(support_id / 2));
    }
}

module support_hole4()
{
    translate([((width + support_separation) / 2), ((depth + support_separation) / 2), -1]) {
        cylinder(h=(support_height + thickness + 2),r=(support_id / 2));
    }
}

module screw_cap_recess1()
// Cylinder is taller than required to avoid zero thickness skins
{
    translate([((width - support_separation) / 2), ((depth - support_separation) / 2), -1]) {
        cylinder(h=(screw_cap_depth + 1),r=(screw_cap_od / 2));
    }
}

module screw_cap_recess2()
{
    translate([((width + support_separation) / 2), ((depth - support_separation) / 2), -1]) {
        cylinder(h=(screw_cap_depth + 1),r=(screw_cap_od / 2));
    }
}

module screw_cap_recess3()
{
    translate([((width - support_separation) / 2), ((depth + support_separation) / 2), -1]) {
        cylinder(h=(screw_cap_depth + 1),r=(screw_cap_od / 2));
    }
}

module screw_cap_recess4()
{
    translate([((width + support_separation) / 2), ((depth + support_separation) / 2), -1]) {
        cylinder(h=(screw_cap_depth + 1),r=(screw_cap_od / 2));
    }
}

module finished_adapter()
{
    difference() {
        union () {
            plate();
            support1();
            support2();
            support3();
            support4();
        }
        hole1();
        hole2();
        hole3();
        hole4();
        support_hole1();
        support_hole2();
        support_hole3();
        support_hole4();
        screw_cap_recess1();
        screw_cap_recess2();
        screw_cap_recess3();
        screw_cap_recess4();
    }
}

finished_adapter();
