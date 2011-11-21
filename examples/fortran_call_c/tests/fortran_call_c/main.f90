program tst
implicit none
real, dimension(10) ::  phi
integer :: nx, i

  nx = 10
  do i=1,10
     phi(i) = i
  end do

  call gradient_c(phi, nx)

end program tst
