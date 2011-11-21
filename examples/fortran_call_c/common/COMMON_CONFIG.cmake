###############################################
# Build Options (Definitions and compiler flags)
###############################################
	# Used by ALL compilers
	ADD_DEFINITIONS(-g)
	# Used by SPECIFIC compilers
 	# SET (CMAKE_CXX_FLAGS)


###############################################
# EXTENSIONS TO INCLUDE: 
###############################################
	ENABLE_TESTING()
	INCLUDE (CPack)
	INCLUDE (CMakeTarConfig)
	INCLUDE (UseDoxygen)
	FIND_PACKAGE (MPI)


###############################################
# Locate Required Libraries
###############################################
	# Find library: find_library(<VAR> name1 [path1 path2 ...])

	# Download and install Armadillo separately. 
	# Specify local installation dir here. If installed globally the dir is unnecessary.
	FIND_LIBRARY (armadillo armadillo PATHS /Users/erlebach/Documents/src/armadillo-0.6.12 /usr/local/lib64 ~/local/lib)

	# Typically installed separately. Same rules as Armadillo (local dir here; global unecessary)
	FIND_LIBRARY(fftw fftw3 PATHS /Users/erlebach/Documents/src/fftw-3.2.2/.libs)


###############################################
# External dependency search paths
###############################################
	# Directories searched for headers ORDER does not matter. 
	# If a directory does not exist it is skipped
	SET (RBF_INCLUDE_DIRS 
		.
		/Users/erlebach/Documents/src/fftw-3.2.2/include
		/Users/erlebach/Documents/src/armadillo-0.6.12/include
		/opt/local/include   # for boost
                ~/local/include
	)
		
	INCLUDE_DIRECTORIES ( ${RBF_INCLUDE_DIRS} )


###############################################
# Setup MPI 
###############################################

OPTION (USE_MPI "Enable/Disable parallel build and linking with MPI" ON)
IF (MPI_FOUND AND USE_MPI)
	SET (CMAKE_CXX_FLAGS ${MPI_COMPILE_FLAGS})
	SET (CMAKE_C_FLAGS ${MPI_COMPILE_FLAGS})
	SET (CMAKE_LINK_FLAGS ${MPI_LINK_FLAGS})
	
	INCLUDE_DIRECTORIES (${MPI_INCLUDE_PATH})
	# NOTE: add a target_link_library( MPI_LIBRARIES) for libs and bins
	# TESTS that run parallel should use MPIEXEC
ENDIF (MPI_FOUND AND USE_MPI) 


###############################################
# Allow 32bit compilation override
###############################################


	OPTION(FORCE_32BIT "Force the compile and link process to build a 32bit i386 executable/library" OFF)

	IF (FORCE_32BIT)
		# TEMPORARY (NOT worried about 32bit MPI right now)
		SET(USE_MPI OFF)
		MESSAGE("\n\nWARNING!!! Forcing MPI OFF (for 32bit build)\n\n")

		# The C compiler is our linker 
		MESSAGE("Original Search Path: ${CMAKE_C_IMPLICIT_LINK_DIRECTORIES}")

		# EXTEND THE DEFAULT LIBRARY SEARCH PATH TO LOOK FOR i386
		# ARCHITECTURE LIBRARIES 
		SET(TEMP_VAR )
		FOREACH(libdir ${CMAKE_C_IMPLICIT_LINK_DIRECTORIES})
			# NOTE: ${OS_SPECIFIC_32BIT_IMPLICIT_LIB_SUBDIR}) is defined in the
			# OS specific cmake builds (e.g., OSX_CONFIG.cmake)
			SET(TEMP_VAR ${TEMP_VAR} ${libdir}/${OS_SPECIFIC_32BIT_IMPLICIT_LIB_SUBDIR})
			SET(TEMP_VAR ${TEMP_VAR} ${libdir}${OS_SPECIFIC_32BIT_IMPLICIT_LIB_SUBDIR})
		ENDFOREACH(libdir)

		# THIS DOES NOT WORK!!!
		# I WANT TO OVERRIDE THE IMPLICIT LINK DIRS FOR 32bit
		# BUT THIS DOES NOT PROPAGATE TO THE LINKER CALL
		SET(CMAKE_C_IMPLICIT_LINK_DIRECTORIES ${TEMP_VAR})

		# This works but gives warnings about the 64bit libraries
		LINK_DIRECTORIES(${TEMP_VAR})

		MESSAGE("Updated Search Path: ${CMAKE_C_IMPLICIT_LINK_DIRECTORIES}")
		#MESSAGE("CXX Implicit: ${CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES}")
		#MESSAGE("FORTRAN Implicit: ${CMAKE_Fortran_IMPLICIT_LINK_DIRECTORIES}")

		# FORCE COMPILERS INTO 32bit mode
		ADD_DEFINITIONS( -m32 ) 
		# FORCE LINKERS INTO 32bit mode
		SET( CMAKE_EXE_LINKER_FLAGS 
			-m32
		)
	ENDIF(FORCE_32BIT)
