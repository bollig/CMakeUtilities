MESSAGE(STATUS "LINUX detected.")

# One or more dirs split by spaces. This is a command so it can be called multiple times
INCLUDE_DIRECTORIES (
)

# One or more dirs split by spaces. This is a command so it can be called multiple times
LINK_DIRECTORIES (
)


# Additional libraries required by this OS
# NOTE: order of libraries is important in Linux. 
# 	does not matter on macOSX
SET (ADDITIONAL_REQUIRED_LIBRARIES 
)

# Linux has 32bit libraries under the "<default implicit libpath>/32"
SET(OS_SPECIFIC_32BIT_IMPLICIT_LIB_SUBDIR 32)
