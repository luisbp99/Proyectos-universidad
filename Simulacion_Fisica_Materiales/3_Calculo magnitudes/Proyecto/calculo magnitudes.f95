
		program calc_magnitudes

		
        use variables_comunes
        implicit none

		integer (kind=entero) :: np,kk,kpaso,ktotal,kcuenta,i
        real (kind=doblep) :: epot,ecin,etot,tiempo,dfiv,d2fiv,xnp,factor,ecin_inv,temp,pres,Cv,alfa_E,gamma,inv_ks,ks,grad_lib
        real (kind=doblep) :: ecin_media,ecin_inv_media,dfiv_media,d2fiv_media,dfiv_ecin_media,dfiv2_ecin_media,ult_sum
        real (kind=doblep), dimension(npmax) :: rx,ry,rz,vx,vy,vz,ax,ay,az,px,py,pz
        real (kind=doblep), dimension(10) :: temp_vec,pres_vec,Cv_vec,alfa_E_vec,gamma_vec,ks_vec
        real (kind=doblep) :: temp_media,pres_media,Cv_media,alfa_E_media,gamma_media,ks_media,err_temp,err_pres,err_Cv,err_alfa_E
        real (kind=doblep) :: err_gamma,err_ks,err_alfa_s,sumando,err_inv_kt,err_kt,err_Cp,err_alfa_p,alfa_p,Cp,kt,inv_kt,alfa_s

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
        ktotal = 5000000     !numero de pasos que evoluciona el sistema
        kpaso = 100         !cada cuantos pasos se graban las energias
        grad_lib = 1497.d00

        !Igualamos a cero las variables sobre las que sumamos para calcular las medias necesarias

        ecin_media = 0.d00          !variable con la que calculamos la media de la energia cinetica
        ecin_inv_media = 0.d00      !variable con la que calculamos la media de la inversa de la energia cinetica
        dfiv_media = 0.d00          !variable con la que calculamos la media de la derivada del potencial respecto al volumen
        d2fiv_media = 0.d00         !variable con la que calculamos la media de la segunda derivada del potencial respecto al volumen
        dfiv_ecin_media = 0.d00     !variable con la que calculamos la media del producto de la derivada del potencial por la inversa de la energia cinetica
        dfiv2_ecin_media = 0.d00    !variable con la que calculamos la media del producto de la derivada del potencial al cuadrado por la inversa de la energia cinetica
		
        kcuenta = 0
		do kk=4500001, ktotal
          	call verlet(np,rx,ry,rz,vx,vy,vz,ax,ay,az,epot,ecin,dfiv,d2fiv)
          	etot = ecin+epot  !calculamos la energia total con las energias cinetica y potencial que obtenemos de la subrutina verlet
            !Calculamos las medias necesarias para calcular las magnitudes
          	ecin_inv = 1.d00/ecin
			ecin_media = ecin_media+ecin
            ecin_inv_media = ecin_inv_media+ecin_inv
            dfiv_media = dfiv_media+dfiv
            d2fiv_media = d2fiv_media+d2fiv
            dfiv_ecin_media = dfiv_ecin_media+dfiv*ecin_inv
            dfiv2_ecin_media = dfiv2_ecin_media+dfiv*dfiv*ecin_inv
            if (mod(kk,kpaso)==0) then
              kcuenta = kcuenta+1
              tiempo = dble((kcuenta-1)*kpaso)*dt

              open(10,file='energias-tiempo.txt',access='append')
              	write(10,9001) tiempo,etot,ecin,epot
              close(10)
            end if
        end do

        !Dividimos las sumas del bucle entre el n�mero de pasos para obtener las medias, lo hacemos fuera del bucle para hacer la division solo una vez

        ecin_media = ecin_media/5.d05
        ecin_inv_media = ecin_inv_media/5.d05
        dfiv_media = dfiv_media/5.d05
        d2fiv_media = d2fiv_media/5.d05
        dfiv_ecin_media = dfiv_ecin_media/5.d05
        dfiv2_ecin_media = dfiv2_ecin_media/5.d05
        
        
		!Calculo de las magnitudes

        temp = 2.d00*ecin_media/grad_lib
        pres = xnp*temp/vol-dfiv_media
        Cv = 1.d00/(1+(2.d00/grad_lib-1.d00)*ecin_media*ecin_inv_media)
        alfa_E = 1.d00/(vol*((1.d00-2.d00/grad_lib)*ecin_media*dfiv_ecin_media-dfiv_media))
        gamma = xnp/Cv+vol*(grad_lib/2.d00-1.d00)*(dfiv_media*ecin_inv_media-dfiv_ecin_media)
        ult_sum=vol*(grad_lib/2.d00-1.d00)*(dfiv2_ecin_media-2.d00*dfiv_media*dfiv_ecin_media+dfiv_media*dfiv_media*ecin_inv_media)
        inv_ks = xnp*temp/vol*(1.d00+2.d00*gamma-xnp/Cv)+vol*d2fiv_media-ult_sum
        ks = 1.d00/inv_ks

        open(30,file='magnitudes.txt',access='append')
        	write(30,9002) temp,pres,Cv,alfa_E,gamma,ks
        close(30)

        open(20,file='rva.dat',form='unformatted')
			write(20) rx,ry,rz,vx,vy,vz,ax,ay,az
        close(20)

9001 format(1pe13.6,3(2x,e13.6))
9002 format(6(e13.6,2x))

		!El codigo a partir de esta linea solo lo ejecutamos en la ultima de las diez simulaciones. En estas lineas calculamos la media
        !de las magnitudes que calcualmos en las diez simulaciones, sus incertidumbres y el resto de magnitudes con sus incertidumbres.

		open(30,file='magnitudes.txt')
        do i=1,10
          read(30,*) temp_vec(i),pres_vec(i),Cv_vec(i),alfa_E_vec(i),gamma_vec(i),ks_vec(i)
        end do
        close(30)

        temp_media = sum(temp_vec)/10.d00
        pres_media = sum(pres_vec)/10.d00
        Cv_media = sum(Cv_vec)/10.d00
        alfa_E_media = sum(alfa_E_vec)/10.d00
        gamma_media = sum(gamma_vec)/10.d00
        ks_media = sum(ks_vec)/10.d00

        !Calculamos las incertidumbres de estas medias. Su incertidumbre sera el doble de la desviacion estandar.

        err_temp = 0.d00
        err_pres = 0.d00
        err_Cv = 0.d00
        err_alfa_E = 0.d00
        err_gamma = 0.d00
        err_ks = 0.d00

        do i=1,10
          err_temp = err_temp+(temp_vec(i)-temp_media)*(temp_vec(i)-temp_media)
          err_pres = err_pres+(pres_vec(i)-pres_media)*(pres_vec(i)-pres_media)
          err_Cv = err_Cv+(Cv_vec(i)-Cv_media)*(Cv_vec(i)-Cv_media)
          err_alfa_E = err_alfa_E+(alfa_E_vec(i)-alfa_E_media)*(alfa_E_vec(i)-alfa_E_media)
          err_gamma = err_gamma+(gamma_vec(i)-gamma_media)*(gamma_vec(i)-gamma_media)
          err_ks = err_ks+(ks_vec(i)-ks_media)*(ks_vec(i)-ks_media)
        end do

        err_temp = 2.d00*sqrt(err_temp/10.d00)
        err_pres = 2.d00*sqrt(err_pres/10.d00)
        err_Cv = 2.d00*sqrt(err_Cv/10.d00)
        err_alfa_E = 2.d00*sqrt(err_alfa_E/10.d00)
        err_gamma = 2.d00*sqrt(err_gamma/10.d00)
        err_ks = 2.d00*sqrt(err_ks/10.d00)

        !Una vez tenemos las magnitudes con sus incertidumbres calculamos el resto de magnitudes a partir de las que ya calculamos.

        alfa_s = -1.d00/(gamma_media*temp_media)
        inv_kt = 1.d00/ks_media-temp_media*Cv_media*gamma_media*gamma_media/vol
        kt = 1.d00/inv_kt
        Cp = Cv_media*kt/ks_media
        alfa_p = Cv_media*gamma_media*kt/vol

        !Calculamos mediante propagacion de incertidumbres las incertidumbres de estas magnitudes

        err_alfa_s = 1.d00/(gamma_media*temp_media)*sqrt((err_gamma/gamma_media)**2+(err_temp/temp_media)**2)
        sumando = (temp_media*gamma_media**2*err_Cv/vol)**2+(2*temp_media*gamma_media*Cv_media*err_gamma/vol)**2
        err_inv_kt = sqrt((err_ks/ks_media**2)**2+(Cv_media*gamma_media**2*err_temp/vol)**2+sumando)
        err_kt = err_inv_kt/inv_kt**2
        err_Cp = 1.d00/ks_media*sqrt((kt*err_Cv)**2+(Cv_media*err_kt)**2+(Cv_media*kt*err_ks/ks_media)**2)
        err_alfa_p = 1/vol*sqrt((gamma_media*kt*err_Cv)**2+(Cv_media*kt*err_gamma)**2+(Cv_media*gamma_media*err_kt)**2)

        !Por ultimo grabamos el resultado final en un fichero.

        open(40,file='resultado final.txt')
        	write(40,9003) 'temp=', temp_media,'error=', err_temp
            write(40,9003) 'pres=', pres_media,'error=', err_pres
            write(40,9003) 'Cv=', Cv_media,'error=', err_Cv
            write(40,9003) 'alfa_E=', alfa_E_media,'error=',err_alfa_E
            write(40,9003) 'gamma=', gamma_media,'error=', err_gamma
            write(40,9003) 'ks=', ks_media,'error=', err_ks
            write(40,9003) 'alfa_s=', alfa_s,'error=', err_alfa_s
            write(40,9003) 'kt=', kt,'error=', err_kt
            write(40,9003) 'Cp=', Cp,'error=', err_Cp
            write(40,9003) 'alfa_p=', alfa_p,'error=',err_alfa_p
        close(40)

         
9003 format(2(a7,e13.6,2x))   
	
		pause 'he terminado'
        stop
        end program    
