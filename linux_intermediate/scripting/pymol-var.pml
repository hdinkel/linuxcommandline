#####################################################################
# Cameron Mura
# March 2002
#
# PyMOL script to make simple ribbon diagram of the Pae SurE dimer
# One monomer will be colored red, the other blue. 
#####################################################################


# load pdb file and call the PyMOL object "sure":
load PDBFILE.pdb

# set background color to white:
bg_color black
rotate y, 90


# Hide all the atoms, then make the cartoon and display just the ribbons:
hide everything
cartoon auto
show cartoon
show ribbon
show sticks
set cartoon_fancy_helices=1
set cartoon_flat_sheets = 1
set cartoon_smooth_loops = 1

clip slab, 60

set antialias = 1
set gamma = 1.15
set orthoscopic = 1

# Do ray-tracing, write out .png files, and quit PyMOL:

ray 1600, 1200
png PDBFILE.png, 1600, 1200
quit
