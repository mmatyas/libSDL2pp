INCLUDE(CheckCXXSourceCompiles)

MACRO(CHECK_COMPILE RESULT_VAR CODE DESCRIPTION)
	SET(SAVED_CMAKE_REQUIRED_QUIET "${CMAKE_REQUIRED_QUIET}")
	SET(SAVED_CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS}")
	SET(CMAKE_REQUIRED_QUIET YES)
	SET(CMAKE_REQUIRED_FLAGS "${SDL2PP_WERROR_FLAG} ${CMAKE_CXX${SDL2PP_CXXSTD}_STANDARD_COMPILE_OPTION}")
	CHECK_CXX_SOURCE_COMPILES("${CODE}" ${RESULT_VAR})
	SET(CMAKE_REQUIRED_QUIET "${SAVED_CMAKE_REQUIRED_QUIET}")
	SET(CMAKE_REQUIRED_FLAGS "${SAVED_CMAKE_REQUIRED_FLAGS}")
	IF(${RESULT_VAR})
		MESSAGE(STATUS "Checking for ${DESCRIPTION}: yes")
	ELSE(${RESULT_VAR})
		MESSAGE(STATUS "Checking for ${DESCRIPTION}: no")
	ENDIF(${RESULT_VAR})
ENDMACRO(CHECK_COMPILE)
