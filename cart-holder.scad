// adjust these
cart_radius = 5.5;
cart_height = 45;
skirt_height = 5;
skirt_width = 10;
extra_height = 5;

// number of faces on cylinders
$fn = 200;

// not adjustable
n_carts = 3;
solid_width = (3 * n_carts + 1) * cart_radius;

module cart_hole() {
	cylinder(h=cart_height, r=cart_radius);
}

module solid() {
	scale([1, 0.5, 1]) union() {
		cylinder(h=cart_height + skirt_height + extra_height, r=solid_width / 2);
		cylinder(h=skirt_height, r=solid_width / 2 + skirt_width);
	}
}

module all() {
	difference() {
		solid();
		translate([0, 0, skirt_height + extra_height + 0.01]) union() {
			translate([3 * cart_radius, 0, 0])
				cart_hole();
			cart_hole();
			translate([-3 * cart_radius, 0, 0])
				cart_hole();
		}
	}
}

all();

/* vi: set ts=2 sts=2 sw=2 noet: */
