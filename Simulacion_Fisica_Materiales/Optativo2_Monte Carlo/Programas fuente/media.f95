

		subroutine media()

        use variables_comunes
        implicit none

		integer (kind=entero) :: i
        real (kind=doblep), dimension(10) :: pres_vec,Cv_vec,gamma_vec,kt_vec
        real (kind=doblep) :: pres_media,Cv_media,gamma_media,kt_media,err_pres,err_Cv,err_gamma,err_kt

        open(40,file='magnitudes.txt')
        do i=1,10
          read (40,*) pres_vec(i),Cv_vec(i),gamma_vec(i),kt_vec(i)
        end do
        close(40)

        pres_media = sum(pres_vec)/10.d00
        Cv_media = sum(Cv_vec)/10.d00
        gamma_media = sum(gamma_vec)/10.d00
        kt_media = sum(kt_vec)/10.d00

        err_pres = 0.d00
        err_Cv = 0.d00
        err_gamma = 0.d00
        err_kt = 0.d00

        do i=1,10
          err_pres = err_pres+(pres_vec(i)-pres_media)*(pres_vec(i)-pres_media)
          err_Cv = err_Cv+(Cv_vec(i)-Cv_media)*(Cv_vec(i)-Cv_media)
          err_gamma = err_gamma+(gamma_vec(i)-gamma_media)*(gamma_vec(i)-gamma_media)
          err_kt = err_kt+(kt_vec(i)-kt_media)*(kt_vec(i)-kt_media)
        end do

        err_pres = 2.d00*sqrt(err_pres/10.d00)
        err_Cv = 2.d00*sqrt(err_Cv/10.d00)
        err_gamma = 2.d00*sqrt(err_gamma/10.d00)
        err_kt = 2.d00*sqrt(err_kt/10.d00)

        open(50,file='resultado final.txt')
        	write(50,9003) 'pres=', pres_media, 'error=', err_pres
            write(50,9003) 'Cv=', Cv_media, 'error=', err_Cv
            write(50,9003) 'gamma=', gamma_media, 'error=', err_gamma
            write(50,9003) 'kt=', kt_media, 'error=', err_kt
        close(50)

9003 format(2(a7,e13.6,2x))

        return
        end subroutine