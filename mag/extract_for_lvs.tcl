# Load the cell
set project [file rootname [lindex $argv end]]

load $project

# Preserve all labels attached to extracted nets
extract do aliases

extract do local
extract unique notopports
extract all

# Convert to spice
ext2spice lvs
ext2spice cthresh infinite
ext2spice short resistor
ext2spice -d -o $project.lvs.spice

# Save any warnings
feedback save $project.fb.txt
