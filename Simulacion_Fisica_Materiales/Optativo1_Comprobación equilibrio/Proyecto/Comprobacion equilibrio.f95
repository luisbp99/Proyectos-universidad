

		program comprobacion_equilibrio

        use variables_comunes
        implicit none

		integer (kind=entero) :: i,j,k,m,l
        real (kind=doblep) :: deltav
        real (kind=doblep), dimension(1000,500) :: vx,vy,vz
        real (kind=doblep), dimension(-610:530) :: distvx,distvy,distvz

		open(10,file='velocidades.dat',form='unformatted')
        do i=1,1000
          read(10) vx(i,:),vy(i,:),vz(i,:)
        end do
        close(10)

        write(*,*) 'valores maximos'
        write(*,*) 'max vx=',maxval(vx),'max vy=',maxval(vy),'max vz=',maxval(vz)
        write(*,*) 'valores minimos'
        write(*,*) 'min vx=',minval(vx),'min vy=',minval(vy),'min vz=',minval(vz)

        distvx = 0.d00
        distvy = 0.d00
        distvz = 0.d00
        deltav = 1.d-2

        do i=1,1000
          do j=1,500
            k = nint(vx(i,j)/deltav)
            distvx(k) = distvx(k)+1.d00

            l = nint(vy(i,j)/deltav)
            distvy(l) = distvy(l)+1.d00

            m = nint(vz(i,j)/deltav)
            distvz(m) = distvz(m)+1.d00

          end do
        end do
		

		open(10,file='resultado.dat')
        	do i=-610,530
            	write(10,9001) deltav*dble(i),distvx(i),distvy(i),distvz(i)
            end do
        close(10)

9001 format(1pe13.6,3(2x,e13.6))
	
		pause 'he terminado'
        stop
        end program