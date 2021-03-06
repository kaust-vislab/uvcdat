execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import shapely" RESULT_VARIABLE res OUTPUT_VARIABLE out ERROR_VARIABLE err)

if ( NOT ${res} EQUAL 0 )
 message("Could not detect shapely, ${PYTHON_EXECUTABLE}")
 set( Shapely_FOUND 0 )
else ( NOT ${res} EQUAL 0 )
 execute_process(COMMAND "@PYTHON_EXECUTABLE@" -c "import shapely;print shapely.__version__" RESULT_VARIABLE res OUTPUT_VARIABLE out ERROR_VARIABLE err)
 if ( ${out} VERSION_LESS ${SHAPELY_MAJOR_MIN}.${SHAPELY_MINOR_MIN} )
   message("You need shapely version ${SHAPELY_MAJOR_MIN}.${SHAPELY_MINOR_MIN} at minimum")
   set( Shapely_FOUND 0 )
 else ()
   set( Shapely_FOUND 1 )
 endif ()
endif ( NOT ${res} EQUAL 0 )
