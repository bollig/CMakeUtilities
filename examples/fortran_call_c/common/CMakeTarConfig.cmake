# Generated with help from
# http://www.cmake.org/pipermail/cmake/2006-December/012312.html
#

set(CPACK_PACKAGE_VENDOR "Evan Bollig")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "An Example of Packaged Source")

# version for tarball name:
set(CPACK_PACKAGE_VERSION_MAJOR 1)
set(CPACK_PACKAGE_VERSION_MINOR 0)
set(CPACK_PACKAGE_VERSION_PATCH 0)

set(CPACK_PACKAGE_DESCRIPTION_FILE ${CMAKE_CURRENT_SOURCE_DIR}/README)
set(CPACK_GENERATOR TGZ)
#set(
#CPACK_SOURCE_PACKAGE_FILE_NAME
#"plplot-${VERSION}"
#CACHE INTERNAL "tarball basename"
#)
set(CPACK_SOURCE_GENERATOR TGZ)
# The following components are regex's to match anywhere (unless anchored)
# in absolute path + filename to find files or directories to be excluded
# from source tarball.
set(CPACK_SOURCE_IGNORE_FILES
"~$"
"\\\\.cvsignore$"
"^${PROJECT_SOURCE_DIR}.*/CVS/"
"^${PROJECT_SOURCE_DIR}.*/.svn/"
"^${PROJECT_SOURCE_DIR}.*/CMakeCache.txt"
"^${PROJECT_SOURCE_DIR}.*/CPack*"
"^${PROJECT_SOURCE_DIR}.*/lib*.a"
"^${PROJECT_SOURCE_DIR}.*/lib*.so"
"^${PROJECT_SOURCE_DIR}.*/cmake_install.cmake"
"^${PROJECT_SOURCE_DIR}.*/DartTestfile.txt"
"^${PROJECT_SOURCE_DIR}/debian/"
"^${PROJECT_SOURCE_DIR}/html/"
"^${PROJECT_SOURCE_DIR}/latex/"
"^${PROJECT_SOURCE_DIR}/_CPack_Packages/"
"^${PROJECT_SOURCE_DIR}.*/CMakeFiles/"
"^${PROJECT_SOURCE_DIR}.*/Testing/"
"^${PROJECT_SOURCE_DIR}/old/"
"^${PROJECT_BINARY_DIR}"
)
message("CPACK_SOURCE_IGNORE_FILES = ${CPACK_SOURCE_IGNORE_FILES}")
include(CPack)
