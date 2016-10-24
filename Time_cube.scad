/* Time_cube.scad
October, 2016
Albert Phan

This is the time cube housing. This time management device uses a RGB LED and gently fades between two colors over a period of time.

*/
$fn=100;
include <MCAD/boxes.scad>

inBoxLength = 60;
inBoxWidth = 60; 
inBoxHeight = 70;
radiusBox = 10;

baseHeight = 10;
baseLipHeight = 10;
bottomThickness = 1.0;

nozz = 1.0;// Nozzle Diameter
nozz2 = 2 * nozz;
nozz3 = 3 * nozz;
part = "base";	// base or top or both

if (part == "top")
{
// Top
translate([0,0,inBoxHeight/4])
	roundedBox([inBoxLength, inBoxWidth, inBoxHeight/2], radiusBox);
	translate([0,0,inBoxHeight/2])
roundedBox([inBoxLength, inBoxWidth, inBoxHeight/2], radiusBox, true);
}
else if(part == "base")
{
	// Lip to hold the Top
	translate([0,0,baseHeight + baseLipHeight/2])
		difference()
		{
			roundedBox([inBoxLength - nozz, inBoxWidth - nozz, baseLipHeight], radiusBox, true);
			roundedBox([inBoxLength - nozz3, inBoxWidth - nozz3, baseLipHeight + 0.1], radiusBox, true);
		}
	// Base
	translate([0,0, baseHeight/2])
		difference()
		{
			roundedBox([inBoxLength, inBoxWidth, baseHeight], radiusBox, true);
			roundedBox([inBoxLength - nozz3, inBoxWidth - nozz3, baseLipHeight + 0.1], radiusBox, true);
		}
	// Bottom of base
	translate([0,0, bottomThickness/2])
		roundedBox([inBoxLength, inBoxWidth, bottomThickness], radiusBox, true);
}

module timeCubeTop(inBoxLength, inBoxWidth, inBoxHeight, radiusBox, nozz)
{	
	
}


