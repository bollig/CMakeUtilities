PROJECT(example6 CXX Fortran)

SUBDIRS(
	cxx
	fortran
)

ADD_EXECUTABLE(sharedCXX test.cxx)
TARGET_LINK_LIBRARIES( sharedCXX
	m
	helloShared
)
	
ADD_EXECUTABLE(staticCXX test.cxx)
TARGET_LINK_LIBRARIES( staticCXX
	curl
	helloStatic
)
	
ADD_EXECUTABLE(sharedFORT test.f90)
TARGET_LINK_LIBRARIES( sharedFORT
	m
	hellofortShared
)

ADD_EXECUTABLE(staticFORT test.f90)
TARGET_LINK_LIBRARIES( staticFORT
	curl
	hellofortStatic
)

ADD_EXECUTABLE(moduleFORT testMod.f90)
TARGET_LINK_LIBRARIES( moduleFORT
	hellofortStatic
)
# required for us to find the .mod file
INCLUDE_DIRECTORIES(
	fortran
)

INCLUDE(CMakeTests.txt)
INCLUDE(CMakeDoc.txt)
INCLUDE(CMakeTar.txt)
