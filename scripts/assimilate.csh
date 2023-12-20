#!/bin/csh
#
# DART software - Copyright UCAR. This open source software is provided
# by UCAR, "as is", without charge, subject to all terms of use at
# http://www.image.ucar.edu/DAReS/DART/DART_download

# datea and paramfile are command-line arguments - OR -
# are set by a string editor (sed) command.

set datea     = ${1}
set paramfile = ${2}

source $paramfile

set start_time = `date +%s`
echo "host is " `hostname`

cd ${RUN_DIR}
echo $start_time >& ${RUN_DIR}/filter_started

# Make sure the previous results are not hanging around
if ( -e ${RUN_DIR}/obs_seq.final )  ${REMOVE} ${RUN_DIR}/obs_seq.final
if ( -e ${RUN_DIR}/filter_done   )  ${REMOVE} ${RUN_DIR}/filter_done

#  run data assimilation system
if ( $SUPER_PLATFORM == 'yellowstone' ) then

   setenv TARGET_CPU_LIST -1
   setenv FORT_BUFFERED true
   mpirun.lsf ./filter || exit 1

else if ( $SUPER_PLATFORM == 'derecho' ) then

# TJH MPI_SHEPHERD TRUE may be a very bad thing
   setenv MPI_SHEPHERD FALSE

   setenv TMPDIR  /dev/shm
   limit stacksize unlimited
   mpiexec ./filter || exit 1

endif
# MLL This below does not work since obs_seq.final is already moved to the output directory
if ( -e ${RUN_DIR}/obs_seq.final )  touch ${RUN_DIR}/filter_done
# Try this below
if ( -e ${OUTPUT_DIR}/${datea}/obs_seq.final )  touch ${RUN_DIR}/filter_done

set end_time = `date  +%s`
@ length_time = $end_time - $start_time
echo "duration = $length_time"

exit 0

