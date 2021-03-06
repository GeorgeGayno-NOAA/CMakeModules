macro (setCheyenne)
  message("Setting paths for Cheyenne")
  option(FIND_HDF5 "Try to Find HDF5 libraries" OFF)
  option(FIND_HDF5_HL "Try to Find HDF5 libraries" OFF)

  set(HOST_FLAG "-xHOST" CACHE INTERNAL "Host Flag")
  set(MKL_FLAG "-mkl"  CACHE INTERNAL "MKL Flag")
  set(GSI_Intel_Platform_FLAGS "-DPOUND_FOR_STRINGIFY -O3 -fp-model source -assume byterecl -convert big_endian -g -traceback -D_REAL8_ ${OpenMP_Fortran_FLAGS} ${MPI_Fortran_COMPILE_FLAGS}" CACHE INTERNAL "GSI Fortran Flags")
  set(ENKF_Platform_FLAGS "-O3 ${HOST_FLAG} -warn all -implicitnone -traceback -fp-model strict -convert big_endian -DGFS -D_REAL8_ ${MPI3FLAG} ${OpenMP_Fortran_FLAGS}" CACHE INTERNAL "ENKF Fortran Flags")
  
  set(BUILD_CORELIBS "ON" )
  set(BUILD_UTIL "OFF" CACHE INTERNAL "" )
  set(BUILD_BUFR "ON" CACHE INTERNAL "")
  set(BUILD_SFCIO "ON" CACHE INTERNAL "")
  set(BUILD_SIGIO "ON" CACHE INTERNAL "")
  set(BUILD_W3EMC "ON" CACHE INTERNAL "")
  set(BUILD_W3NCO "ON" CACHE INTERNAL "")
  set(BUILD_BACIO "ON" CACHE INTERNAL "")
  set(BUILD_CRTM "ON" CACHE INTERNAL "")
  set(BUILD_SP "ON" CACHE INTERNAL "")
  set(BUILD_NEMSIO "ON" CACHE INTERNAL "")
  set(ENV{MPI_HOME} $ENV{MPI_ROOT} )
endmacro()

