#!/usr/bin/env python

import os
from scad import *

class Slasher(SCAD_Object):
    width = 127.76
    depth = 85.48
    height = 20
    corner_radius = 3.18
    plate_height = 0.76
    flange_types = ["short", "medium", "tall"]
    flange_heights = {
        "short": 2.41,
        "medium": 6.10,
        "tall": 7.62
    }
    flange_width = 1.27
    flange_type = "short"
    well_dia = 20
    well_height_offset = 1

    @property
    def flange_height(self):
        return self.flange_heights[self.flange_type]

    @property
    def flange(self):
        return RoundedCube(x=self.width, y=self.depth, z=self.flange_height, r=self.corner_radius, fn=200)

    @property
    def plate_width(self):
        return self.width - (self.flange_width * 2)
    
    @property
    def plate_depth(self):
        return self.depth - (self.flange_width * 2)

    @property
    def plate(self):
        plate = Cube(x=self.plate_width, y=self.plate_depth, z=self.height, r=self.corner_radius, center=True)
        z_offset = (self.height / 2.0) + self.flange_height
        plate = Translate(z=z_offset)(plate)
        plate = Union()(plate, self.flange)
        plate = Difference()(plate, self.wells)
        return plate

    @property
    def well_positions(self):
        w_count = int(self.plate_width // self.well_dia)
        w_rem = self.plate_width % self.well_dia
        w_space = w_rem / (w_count + 1)
        d_count = int(self.plate_depth // self.well_dia)
        d_rem = self.plate_depth % self.well_dia
        d_space = d_rem / (d_count + 1)
        for xc in range(w_count):
            x = (self.plate_width / -2.0) + (xc + 1) * w_space + xc * self.well_dia + (self.well_dia / 2.0)
            for yc in range(d_count):
                y = (self.plate_depth / -2.0) + (yc + 1) * d_space + yc * self.well_dia + (self.well_dia / 2.0)
                yield {"x": x, "y": y}

    @property
    def wells(self):
        well = Cylinder(dia=self.well_dia, h=self.height)
        wells = [Translate(**pos)(well) for pos in self.well_positions]
        wells = Union()(*wells)
        z_offset = self.well_height_offset + self.height / 2.0
        wells = Translate(z=z_offset)(wells)
        return wells

    def scad(self):
        return self.plate

class VialPlate(Slasher):
    well_dia = 22.5

plate = VialPlate()
plate.render("vial_plate.scad")
if not os.path.exists("vial_plate.stl"):
    plate.render("vial_plate.stl")
