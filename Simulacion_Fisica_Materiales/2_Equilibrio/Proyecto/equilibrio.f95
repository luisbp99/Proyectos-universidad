
		program equilibrio

        use variables_comunes
        implicit none

		integer (kind=entero) :: np,kk,kpaso,ktotal,kcuenta
        real (kind=doblep) :: epot,ecin,etot,tiempo,dfiv,d2fiv,xnp,factor
        real (kind=doblep), dimension(npmax) :: rx,ry,rz,vx,vy,vz,ax,ay,az,px,py,pz

		open(10,file='datos_sim.txt')
        	read(10,*) np,pl,pli,rc,rc2
            read(10,*) vol,dens
            read(10,*) etot,ecin, epot
        close(10)

        open(20,file='rva.dat',form='unformatted')
        	read(20) rx,ry,rz,vx,vy,vz,ax,ay,az
        close(20)
		
        !Calculamos las correciones de la energia potencial y de sus derivadas

        xnp = dble(npmax)
        factor = 8*pi*xnp*xnp/(vol*rc*rc*rc)
        corr_ener = factor*(1.d00/(9.d00*rc**6.d00)-1.d00/3.d00)
        corr_sum_rvp = factor*(-4.d00/(3.d00*rc**6.d00)+2.d00)
        corr_sum_r2vpp = factor*(52.d00/(3.d00*rc**6.d00)-14.d00)
        
        dt = 1.d-4          !diferencia de tiempo entre dos pasos de la evoluvion
        dt12 = dt/2.d00
        dt2 = dt*dt/2.d00
        ktotal = 500000    !numero de pasos que evoluciona el sistema
        kpaso = 100         !cada cuantos pasos se graban las energias
		
        kcuenta = 0        !le damos el valor cero a esta variable para poder comprobar que se graban todos los pasos que queremos
        	do kk=1, ktotal
          		call verlet(np,rx,ry,rz,vx,vy,vz,ax,ay,az,epot,ecin,dfiv,d2fiv)
          		etot = ecin+epot  !calculamos la energia total con las energias cinetica y potencial que obtenemos de la subrutina verlet
          		if (mod(kk,kpaso)==0) then
            		kcuenta = kcuenta+1
            		tiempo=dble((kcuenta-1)*kpaso)*dt

					!abrimos un archivo para grabar el tiempo y las energias
                    
            		open(10,file='energias-tiempo.txt',access='append')
            			write(10,9001) tiempo,etot,ecin,epot
            		close(10)
          		end if
        	end do
    
        write(*,*) 'grabados',kcuenta,'pasos' 

        !call mod_energia(vx,vy,vz,epot)

        open(20,file='rva.dat',form='unformatted')
        	write(20) rx,ry,rz,vx,vy,vz,ax,ay,az
        close(20)

        open(20,file='posiciones.dat',form='unformatted')
        	write(20) rx,ry,rz
        close(20)


9001 format(1pe13.6,3(2x,e13.6))
	
		pause 'he terminado'
        stop
        end program