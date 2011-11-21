PROJECT(fortLib Fortran) 

FILE(GLOB SRC_FILES *.f90)

ADD_LIBRARY(hellofortShared SHARED ${SRC_FILES}) 
ADD_LIBRARY(hellofortStatic STATIC ${SRC_FILES}) 
