#!/usr/bin/env python

import os
from scad import *

class Slasher(SCAD_Object):
    width = 127.76
    depth = 85.48
    height = 20
    corner_radius = 3.18
    flange_types = ["short", "medium", "tall"]
    flange_heights = {
        "short": 2.41,
        "medium": 6.10,
        "tall": 7.62,
        "none": 0,
        None: 0,
    }
    _flange_width = 1.27
    flange_type = "short"
    well_dia = 20
    well_height_offset = 1

    @property
    def flange_height(self):
        return self.flange_heights[self.flange_type]

    @property
    def flange_width(self):
        return self._flange_width if self.flange_height != 0 else 0

    @property
    def plate_width(self):
        return self.width - (self.flange_width * 2)
    
    @property
    def plate_depth(self):
        return self.depth - (self.flange_width * 2)

    @property
    def plate_height(self):
        return self.height - self.flange_height

    @property
    def base(self):
        if self.flange_height:
            flange = RoundedCube(x=self.width, y=self.depth, z=self.flange_height, r=self.corner_radius, fn=200)
            top = Cube(x=self.plate_width, y=self.plate_depth, z=self.plate_height, r=self.corner_radius, center=True)
            z_offset = (self.plate_height / 2.0) + self.flange_height
            top = Translate(z=z_offset)(top)
            base = Union()(flange, top)
        else:
            base = RoundedCube(x=self.width, y=self.depth, z=self.height, r=self.corner_radius, fn=200)
        return base

    @property
    def plate(self):
        return Difference()(self.base, self.wells)

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
        well = Cylinder(dia=self.well_dia, h=self.height, fn=200)
        wells = [Translate(**pos)(well) for pos in self.well_positions]
        wells = Union()(*wells)
        z_offset = self.well_height_offset
        wells = Translate(z=z_offset)(wells)
        return wells

    def scad(self):
        return self.plate

class VialPlate(Slasher):
    well_dia = 22.8
    flange_type = "none"
    well_height_offset = 2
    height = 22

class VialPlateTest(Slasher):
    well_dia = 23
    height = 21
    flange_type = "none"
    width = well_dia + 5
    depth = well_dia + 5

plate = VialPlate()
#plate = VialPlateTest()
plate.render("vial_plate.scad")
if not os.path.exists("vial_plate.stl"):
    plate.render("vial_plate.stl")
