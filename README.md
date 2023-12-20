# WRF-DART_Derecho
WRF-DART scripts that I edited to work on NCAR's Derecho. My comments are denoted with my initials (MLL).

Note: The driver.csh script does not work automatically. Once the program moves onto the next cycle time, it terminates itself after preparing the initial conditions and running the filter (i.e., while running wrf.exe for each of the ensemble members). I suspected that this was an issue with the new_advance_model.csh script, but my changes there (now commented out) did not resolve the issue. I will work on making this script fully automatic.
