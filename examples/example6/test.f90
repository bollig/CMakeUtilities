program test
	implicit none
	
	integer :: retval        ! return value stores program status
	character(len=32) :: arg ! buffer for command line argument

	if (iargc() .gt. 0) then ! use first argument
	        call getarg(1, arg)
		call hello(arg)
		retval = 0
	else 
		call goodbye()
		retval = 1
	endif

	call exit(retval)
end program test
	
