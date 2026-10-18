## Viewing the schematic
To open the schematics, make sure your present working directory is the repo's `xschem` folder, then use `xschem [sch name]` to open a particular schematic or just `xschem` to open a new schematic.

The schematics assume that the `symbols` and `tests` folders from the gf180mcuD pdk are included. If you get a "symbol missing" text showing when opening the schematic, then verify that these are in the xschem folder.

If you are a UW ECE student, use a thin client like ThinLinc to log onto either eceTesla0.uwaterloo.ca or eceTesla1.uwaterloo.ca. From there you can find the pdk at `/usr/local/share/pdk/gf180mcuD/libs.tech/xschem` and you can copy and paste the needed folders into the repo's `xschem` folder. If you're on the server, you should also see the `devices` folder at `/usr/share/xschem/xschem_library/` which has the generic symbols used in the schematics.

If you want to edit the code blocks in a text editor instead of xschem's GUI, Tesla0 (never tried Tesla1 myself) doesn't have GVim installed so you will need to edit the `xschemrc` file to use something else instead (ctrl+F "set editor" and uncomment the appropriate line). If you cannot find the xschemrc file that xschem is referencing, you can just copy the `xschemrc` file from `/usr/local/share/pdk/gf180mcuD/libs.tech/xschem` and put it in the repo's `xschem` folder as that will overwrite the previous configuration.

## Running the simulations
At the top, click `Simulation` -> `Use 'simulation' dir under current schematic dir`. If you close xschem and re-open, you will need to re-enable this option.

You will also need to copy the `design.ngspice` and `sm141064.ngspice` files from the pdk at `/usr/local/share/pdk/gf180mcuD/libs.tech/ngspice` and paste them into the repo's `xschem/simulation` folder.

To view the waveforms on the graph, click the `Netlist` button in the top right of xschem, followed by `Simulation`. You should see a pop-up as NGSpice runs. Once the run is complete, ctrl+click the `load waves` arrow below the graph to display the waveform and again to un-display. Alternatively, you can click `Simulation` -> `Load/Unload spice .raw file` from the top menu bar.