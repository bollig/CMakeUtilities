
# Borrowed from FLOWVR (flowvr.sf.net)
#
# - Try to find QGLViewer
# Once done this will define

#  QGLVIEWER_FOUND - system has QGLViewer
#  QGLVIEWER_INCLUDE_DIR - the QGLViewer include directory
#  QGLVIEWER_LIBRARY - Link these to use QGLViewer
#  QGLVIEWER_DEFINITIONS - Compiler switches required for using QGLViewer
#

FIND_PATH ( QGLVIEWER_INCLUDE_DIR NAMES QGLViewer/qglviewer.h
            PATHS
            $ENV{QGLVIEWER_INCLUDE_DIR}
            ENV CPATH
            /usr/include
            /usr/local/include
            NO_DEFAULT_PATH
          )
FIND_PATH ( QGLVIEWER_INCLUDE_DIR NAMES QGLViewer/qglviewer.h )

FIND_LIBRARY ( QGLVIEWER_LIBRARY NAMES QGLViewer
               PATHS
               $ENV{QGLVIEWER_LIB_DIR}
               ENV LD_LIBRARY_PATH
               ENV LIBRARY_PATH
               /usr/lib64
               /usr/local/lib64
               /usr/lib
               /usr/local/lib
               NO_DEFAULT_PATH
             )
FIND_LIBRARY ( QGLVIEWER_LIBRARY NAMES QGLViewer )

IF ( NOT QGLVIEWER_LIBRARY )
FIND_LIBRARY ( QGLVIEWER_LIBRARY NAMES 3dviewer
               PATHS
               $ENV{QLGLVIEWER_LIB_DIR}
               ENV LD_LIBRARY_PATH
               ENV LIBRARY_PATH
               /usr/lib64
               /usr/local/lib64
               /usr/lib
               /usr/local/lib
               NO_DEFAULT_PATH
             )
FIND_LIBRARY ( QGLVIEWER_LIBRARY NAMES 3dviewer )
ENDIF ( NOT QGLVIEWER_LIBRARY )

IF ( QGLVIEWER_INCLUDE_DIR AND QGLVIEWER_LIBRARY )
SET ( QGLVIEWER_FOUND TRUE )
ENDIF ( QGLVIEWER_INCLUDE_DIR AND QGLVIEWER_LIBRARY )

IF ( QGLVIEWER_FOUND )
IF ( NOT QGLViewer_FIND_QUIETLY )
MESSAGE ( STATUS "Found QGLViewer: ${QGLVIEWER_LIBRARY}" )
ENDIF ( NOT QGLViewer_FIND_QUIETLY )
ELSE ( QGLVIEWER_FOUND )
IF ( QGLViewer_FIND_REQUIRED )
MESSAGE ( FATAL_ERROR "Could not find QGLViewer" )
ENDIF ( QGLViewer_FIND_REQUIRED )
ENDIF ( QGLVIEWER_FOUND )

# show the QGLVIEWER_INCLUDE_DIR and QGLVIEWER_LIBRARY variables only in the advanced view
MARK_AS_ADVANCED ( QGLVIEWER_INCLUDE_DIR QGLVIEWER_LIBRARY )
