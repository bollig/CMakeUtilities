module hellogoodbye
	implicit none
contains

	subroutine modhello(name)
		character(len=20) :: name
		print*,"Hello ",name
	end subroutine modhello

	subroutine modgoodbye()
		print*,"Adios Muchachos"
	end subroutine modgoodbye

end module hellogoodbye
