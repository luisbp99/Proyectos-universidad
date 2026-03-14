
		program Monte_Carlo

        use variables_comunes
		implicit none
        
		integer (kind=entero) :: kpaso,ktotal,num_acept,num_rech,ip,i
        real (kind=doblep) :: np,temp,epot,beta,kt,inv_kt,gamma,grad_lib,Cv,pres,acepto,alea,prob,delta_d2fiv,delta_dfiv,delta_ener
        real (kind=doblep) :: d2fiv_despues,dfiv_despues,epot_despues,d2fiv_antes,dfiv_antes,epot_antes,dx,dy,dz,idum,mi_random
        real (kind=doblep) :: d2fiv,dfiv,d2fiv_media,dfiv2_media,epot2_media,epot_dfiv_media,dfiv_media,epot_media,desp_max,xnp
        real (kind=doblep) :: factor
        real (kind=doblep), dimension(npmax) :: rx,ry,rz

        open(10,file='datos_sim.txt')
        	read(10,*) np,pl,pli,rc,rc2
            read(10,*) vol,dens
            read(10,*) epot,temp
        close(10)

        open(20,file='posiciones.dat',form='unformatted')
        	read(20) rx,ry,rz
       	close(20)
        
		idum = -9999
		alea = mi_random(idum)
        beta = 1.d00/temp
        xnp = dble(np)
        desp_max = 0.001d00
        num_acept = 0
        num_rech = 0
        grad_lib = 3.d00*xnp-3.d00

        !Calculamos las correciones de la energia potencial y de sus derivadas

        factor = 8*pi*xnp*xnp/(vol*rc*rc*rc)
        corr_ener = factor*(1.d00/(9.d00*rc**6.d00)-1.d00/3.d00)
        corr_sum_rvp = factor*(-4.d00/(3.d00*rc**6.d00)+2.d00)
        corr_sum_r2vpp = factor*(52.d00/(3.d00*rc**6.d00)-14.d00)

        epot_media = 0.d00          !variable con la que calculamos la energia potencial media
        dfiv_media = 0.d00          !variable con la que calculamos la media de la derivada de la energia potencial con respecto al volumen
        epot_dfiv_media = 0.d00     !variable con la que calculamos la media del producto de la derivada del potencial por la energia potencial
        epot2_media = 0.d00         !variable con la que calculamos la media del cuadrado de la energia potencial
        dfiv2_media = 0.d00         !variable con la que calculamos la media de la derivada de la energia potencial con respecto al volumen al cuadrado
        d2fiv_media = 0.d00         !variable con la que calculamos la media de la derivada segunda de la energia potencial con respecto al volumen

        ktotal = 5000000
        kpaso = 100

        call potlj(rx,ry,rz,epot,dfiv,d2fiv)

        do i=1, ktotal
          ip = int(mi_random(idum)*dble(np)+1.d00)

          dx = (mi_random(idum)*2.d00-1.d00)*desp_max
          dy = (mi_random(idum)*2.d00-1.d00)*desp_max
          dz = (mi_random(idum)*2.d00-1.d00)*desp_max

          call potlj_ip(ip,rx,ry,rz,epot_antes,dfiv_antes,d2fiv_antes)

          rx(ip) = rx(ip)+dx
          ry(ip) = ry(ip)+dy
          rz(ip) = rz(ip)+dz

          call potlj_ip(ip,rx,ry,rz,epot_despues,dfiv_despues,d2fiv_despues)

          delta_ener = epot_despues-epot_antes
          delta_dfiv = dfiv_despues-dfiv_antes
          delta_d2fiv = d2fiv_despues-dfiv_antes

          if(delta_ener<=0.d00) then
            !Aceptamos la configuración
            epot = epot+delta_ener
            dfiv = dfiv+delta_dfiv
            d2fiv = d2fiv+delta_d2fiv
            num_acept = num_acept+1

          else
            prob = dexp(-beta*delta_ener)
            alea = mi_random(idum)
            if(alea<=prob) then
              !Aceptamos la configuración
              epot = epot+delta_ener
              dfiv = dfiv+delta_dfiv
              d2fiv = d2fiv+delta_d2fiv
              num_acept = num_acept+1
            else
              !no se acepta la configuración y volvemos a la configuración inicial
              rx(ip) = rx(ip)-dx
              ry(ip) = ry(ip)-dy
              rz(ip) = rz(ip)-dz
              num_rech = num_rech+1
            end if
          end if

          if(mod(i,1000)==0) then
            acepto = dble(num_acept)/dble(num_acept+num_rech)
            if(acepto>0.55d00) desp_max = desp_max*1.05d00
            if(acepto<0.45d00) desp_max = desp_max*0.95d00
            num_acept = 0
            num_rech = 0
          end if
          
          epot_media = epot_media+epot          
          dfiv_media = dfiv_media+dfiv
          epot_dfiv_media = epot_dfiv_media+epot*dfiv
          epot2_media = epot_media+epot*epot
          dfiv2_media = dfiv2_media+dfiv*dfiv
          d2fiv_media = d2fiv_media+d2fiv

          if(mod(i,kpaso)==0) then
			open(30,file='ener_der.txt',access='append')
            	write(30,9001) epot,dfiv,d2fiv,desp_max
            close(30)
          end if
        end do

        open(20,file='rva.dat',form='unformatted')
        	write(20) rx,ry,rz
        close(20)
        
		epot_media = epot_media/5.d06
        dfiv_media = dfiv_media/5.d06
        epot_dfiv_media = epot_dfiv_media/5.d06
		epot2_media = epot2_media/5.d06
        dfiv2_media = dfiv2_media/5.d06
        d2fiv_media = d2fiv_media/5.d06
        
		pres = xnp*temp/vol-dfiv_media
        Cv = grad_lib/2.d00+(epot2_media-epot_media*epot_media)/temp**2
        gamma = vol/Cv*(xnp/vol+(epot_media*dfiv_media-epot_dfiv_media)/temp**2)
        inv_kt = xnp*temp/vol+vol*d2fiv_media-vol/temp*(dfiv2_media-dfiv_media*dfiv_media)
        kt = 1.d00/inv_kt

        open(40,file='magnitudes.txt',access='append')
        	write(40,9001) pres,Cv,gamma,kt
        close(40)

9001 format(4(e13.6,2x))

		call media()
        

        pause 'he terminado'
        stop
        end program