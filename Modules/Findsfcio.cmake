# This module looks for environment variables detailing where SFCIO lib is
# If variables are not set, SFCIO will be built from external source
if(DEFINED ENV{SFCIO_LIB4} )
  set(SFCIO_LIB4 $ENV{SFCIO_LIB4} CACHE STRING "SFCIO_4 Library Location" )
  set(SFCIO_INC4 $ENV{SFCIO_INC4} CACHE STRING "SFCIO_4 Include Location" )
  
  set(name "sfcio")
  string(TOUPPER ${name} uppercase_name)

  string(REGEX MATCH "(v[0-9]+\\.[0-9]+\\.[0-9]+)" _ ${${uppercase_name}_LIB4})
  set(version ${CMAKE_MATCH_1})

  set(kinds "4")
  foreach(kind ${kinds})
    set(lib_name ${name}_${kind})
    set(versioned_lib_name ${name}_${version}_${kind})

    if(EXISTS ${${uppercase_name}_LIB${kind}} )
      get_filename_component(lib_dir ${${uppercase_name}_LIB${kind}} DIRECTORY)
      find_library(sfcio_path NAMES ${versioned_lib_name} PATHS ${lib_dir} NO_DEFAULT_PATH)

      add_library(${lib_name} STATIC IMPORTED)
      set_target_properties(${lib_name} PROPERTIES
        IMPORTED_LOCATION ${sfcio_path}
        INTERFACE_INCLUDE_DIRECTORIES ${${uppercase_name}_INC${kind}})
    endif()
  endforeach()
endif()

find_package_handle_standard_args(sfcio
  REQUIRED_VARS sfcio_path)
