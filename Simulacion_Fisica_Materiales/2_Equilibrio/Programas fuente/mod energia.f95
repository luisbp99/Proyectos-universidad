
		subroutine mod_energia(vx,vy,vz,epot)

        use variables_comunes
        implicit none

        real (kind=doblep), dimension(npmax), intent(inout) :: vx,vy,vz
        real (kind=doblep), intent(in) :: epot
        real (kind=doblep) :: xnp,ecin,ecinq,px,py,pz,factor,etotq

        xnp = dble(npmax)

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

        !Calculamos la energia cinetica necesaria para tener la energia total que hemos fijado y luego las velocidades para tener esa energia cinetica
        
		ecinq = etotq-epot

        if (ecinq<=0.d00) then
          write(*,*) 'error, energia cinetica negativa!'
        end if

        factor = dsqrt(ecinq/ecin)

        vx = factor*vx
        vy = factor*vy
        vz = factor*vz

        !Volvemos a calcular todo para comprobar que esta todo bien

        px = sum(vx)
        py = sum(vy)
        pz = sum(vz)

        ecin = 0.5d00*(sum(vx*vx)+sum(vy*vy)+sum(vz*vz))
		
        end subroutine mod_energia
