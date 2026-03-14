		program red_fcc

        use variables_comunes
        implicit none


        integer (kind=entero) :: np
        integer (kind=entero) :: i,j,k
        real (kind=doblep), dimension(npmax) :: rx,ry,rz,vx,vy,vz,ax,ay,az
        real (kind=doblep) :: iflag,mi_random,xnp,plamit,pla,epot,ecin,ecinq,px,py,pz,factor,etotq,dfiv,d2fiv

        !Pedimos por pantalla que se introduzca la densidad y el numero de particulas. En este caso dens=0.5 y 500 particulas
        
		write(*,*) 'densidad'
        read(*,*) dens
        write(*,*) 'Numero de particulas'
        read(*,*) np

        !Con los datos de la densidad y el numero de particulas calculamos el volumen, el lado de la caja y otros datos que necesitaremos

        xnp = dble(np)				!valor del numero de particulas en doble precision	 
        vol = dble(np)/dble(dens)   !volumen de la caja
        pl = vol**(1.d00/3.d00)     !longitud del lado de la caja
        pli = 1.d00/pl              !inverso del lado de la caja
        pla = pl/dble(numk) 		!valor del lado de las celdas en las que dividimos la caja
        plamit = pla/2.d00          !mitad de pla
        rc = pl/2.d00               !radio de corte del potencial
        rc2 = rc*rc                 !radio de corte al cuadrado

        !comenzamos a colocar las particulas

        np=0
        do i=0, numk-1
          do j=0, numk-1
            do k=0, numk-1
              np=np+1
              rx(np) = 0.d00+dble(i)*pla
              ry(np) = 0.d00+dble(j)*pla
              rz(np) = 0.d00+dble(k)*pla

              np=np+1
              rx(np) = plamit+dble(i)*pla
              ry(np) = plamit+dble(j)*pla
              rz(np) = 0.d00+dble(k)*pla

              np=np+1
              rx(np) = plamit+dble(i)*pla
              ry(np) = 0.d00+dble(j)*pla
              rz(np) = plamit+dble(k)*pla

              np=np+1
              rx(np) = 0.d00+dble(i)*pla
              ry(np) = plamit+dble(j)*pla
              rz(np) = plamit+dble(k)*pla
            end do
          end do
        end do

        !Comprobamos si se han colocado todas las particulas

		write(*,*) 'colocas en red',np,'particulas'

        write(*,*) 'introduce un numero para inicializar funcion random'
        read*, iflag

        write(*,*) iflag
        px = mi_random(iflag)
        write(*,*) px

        !Movemos la posicion de la particulas usando un numero aleatorio

        rx = rx+(2.d00*mi_random(iflag)-1.d00)*pl/100.d00
        ry = ry+(2.d00*mi_random(iflag)-1.d00)*pl/100.d00
        rz = rz+(2.d00*mi_random(iflag)-1.d00)*pl/100.d00

        !Llamamos a la funcion potencial

        call potlj(np,rx,ry,rz,ax,ay,az,epot,dfiv,d2fiv)

        write(*,*) 'epot =',epot

        !Asignamos velocidades entre -1 y 1 a todas las particulas en todas direcciones y calculamos su momento lineal

        do i=1,np
          vx(i) = 2.d00*mi_random(iflag)-1.d00
          vy(i) = 2.d00*mi_random(iflag)-1.d00
          vz(i) = 2.d00*mi_random(iflag)-1.d00
        end do

        px = sum(vx)
        py = sum(vy)
        pz = sum(vz)

        !Corregimos el momento para que sea cero

        px = px/xnp
        py = py/xnp
        pz = pz/xnp

        vx = vx-px
        vy = vy-py
        vz = vz-pz

        !Repetimos el calculo para verificar y calculamos la energia cinetica

        px = sum(vx)
        py = sum(vy)
        pz = sum(vz)

        ecin = 0.5d00*(sum(vx*vx)+sum(vy*vy)+sum(vz*vz))

        write(*,*) 'ecin=', ecin, 'epot=',epot, 'etot=', epot+ecin

        !Pedimos por pantalla el valor de energia que queremos fijar, en este caso -650
        
        write(*,*) 'energia total que quiere fijar' 
        read(*,*) etotq

        !Calculamos la energia cinética necesaria para tener la energia total que hemos fijado y luego las velocidades para tener esa energia cinetica
        
		ecinq = etotq-epot

        if (ecinq<=0.d00) then
          write(*,*) 'error, energía cinética negativa!'
        end if

        factor = dsqrt(ecinq/ecin)

        vx = factor*vx
        vy = factor*vy
        vz = factor*vz

        !Volvemos a calcular todo para comprobar que esté todo bien

        px = sum(vx)
        py = sum(vy)
        pz = sum(vz)

        ecin = 0.5d00*(sum(vx*vx)+sum(vy*vy)+sum(vz*vz))

        !Escribimos en patalla los valores de los momentos y las energias

        write(*,*) 'momentos=',px,py,pz
        write(*,*) 'ecin=',ecin,'epot=',epot,'etot=',ecin+epot

        !Creamos dos arhivos en los que escribimos los datos de la simulacion

        open(10,file='datos_sim.txt')
        	write(10,9001) np,pl,pli,rc,rc2
            write(10,9002) vol,dens
            write(10,9003) ecin+epot,ecin,epot
        close(10)

        open(20,file='rva.dat',form='unformatted')
        	write(20) rx,ry,rz,vx,vy,vz,ax,ay,az
        close(20)
        
9001    format(i4,2x,1pe19.12,3(2x,e19.12))
9002    format(1pe19.12,2x,e19.12)
9003    format(1pe19.12,2x,e19.12,2x,e19.12)

		pause 'he terminado'
        stop
        end program