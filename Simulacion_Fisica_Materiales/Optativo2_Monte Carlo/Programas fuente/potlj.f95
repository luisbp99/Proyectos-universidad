
		subroutine potlj(rx,ry,rz,epot,dfiv,d2fiv)

        use variables_comunes
        implicit none

        !integer (kind=entero), intent(in) :: np
        integer (kind=entero) :: i,j
        real (kind=doblep) :: rrx,rry,rrz,suma_r2vpp,suma_rvp,aux1,a12,a6,a2,dis2,rijx,rijy,rijz
        real (kind=doblep), dimension(:), intent(in) :: rx,ry,rz
        real (kind=doblep), intent(out) :: epot,dfiv,d2fiv

        !Le damos valor cero a las variables sobre las que vamos a hacer sumas

        epot = 0.d00
        suma_rvp = 0.d00
        suma_r2vpp = 0.d00
		
        do i=1,npmax-1
          rrx = rx(i)
          rry = ry(i)
          rrz = rz(i)
			
          do j=i+1,npmax
            rijx = rrx-rx(j)
            rijy = rry-ry(j)
            rijz = rrz-rz(j)

            rijx = rijx-pl*dnint(rijx*pli)
            rijy = rijy-pl*dnint(rijy*pli)
            rijz = rijz-pl*dnint(rijz*pli)

            dis2 = rijx*rijx+rijy*rijy+rijz*rijz

            !Solo se calcula la energía si la distancia es menor que el radio de corte

            if (dis2<=rc2) then
              a2=1.d00/dis2
              a6=a2*a2*a2
              a12=a6*a6
              epot=epot+a12-a6
              aux1=-2.d00*a12+a6
              
              suma_rvp = suma_rvp+aux1
              suma_r2vpp = suma_r2vpp+26.d00*a12-7.d00*a6

			end if
		  end do
		end do

        epot=4.d00*epot+corr_ener
        suma_rvp = 24.d00*suma_rvp+corr_sum_rvp
        suma_r2vpp = 24.d00*suma_r2vpp+corr_sum_r2vpp
        dfiv = suma_rvp/(3.d00*vol)
        d2fiv = (suma_r2vpp-2.d00*suma_rvp)/(9.d00*vol*vol)

        return
        end subroutine potlj