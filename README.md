# WRF-DART_Derecho
WRF-DART scripts that I edited to work on NCAR's Derecho. My comments are denoted with my initials (MLL).

Note: The driver.csh script does not work automatically. Once the program moves onto the next cycle time, it terminates itself after preparing the initial conditions and running the filter (i.e., while running wrf.exe for each of the ensemble members). I suspected that this was an issue with the new_advance_model.csh script, but my changes there (now commented out) did not resolve the issue. I will work on making this script fully automatic.

The table below shows some of the key differences in the scripts when changing from Cheyenne to Derecho.
![alt text](https://github.com/mckenzielarson/WRF-DART_Derecho/blob/main/table_differences.png)

Also, I found it useful to source the following commands in a file when opening a new terminal window:
```
setenv DART_DIR ** your directory **
setenv BASE_DIR ** your directory **
setenv LD_LIBRARY_PATH /glade/u/home/wrfhelp/UNGRIB_LIBRARIES/lib:$LD_LIBRARY_PATH  # This is important for UNGRIB to work!!
setenv HDF5 /glade/u/apps/ch/opt/hdf5/1.10.1/gnu/7.1.0
```
