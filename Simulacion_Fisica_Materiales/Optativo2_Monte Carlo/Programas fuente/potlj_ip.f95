
		subroutine potlj_ip(ip,rx,ry,rz,epot_antes,dfiv_antes,d2fiv_antes)

        use variables_comunes
        implicit none

        integer (kind=entero), intent(in) :: ip
        integer (kind=entero) :: i
        real (kind=doblep) :: rrx,rry,rrz,rijx,rijy,rijz,suma_r2vpp,suma_rvp,aux1,a12,a6,a2,dis2
        real (kind=doblep), dimension(:), intent(in) :: rx,ry,rz
        real (kind=doblep), intent(out) :: epot_antes,dfiv_antes,d2fiv_antes

        epot_antes = 0.d00
        suma_rvp = 0.d00
        suma_r2vpp = 0.d00

        rrx = rx(ip)
        rry = ry(ip)
        rrz = rz(ip)

        do i=1,npmax
		  if (i.ne.ip) then
            rijx = rrx-rx(i)
            rijy = rry-ry(i)
            rijz = rrz-rz(i)

            rijx = rijx-pl*dnint(rijx*pli)
            rijy = rijy-pl*dnint(rijy*pli)
            rijz = rijz-pl*dnint(rijz*pli)

            dis2 = rijx*rijx+rijy*rijy+rijz*rijz

            if (dis2<=rc2 .and. 0<dis2) then
              a2=1.d00/dis2
              a6=a2*a2*a2
              a12=a6*a6
              epot_antes=epot_antes+a12-a6
              aux1=-2.d00*a12+a6
              
              suma_rvp = suma_rvp+aux1
              suma_r2vpp = suma_r2vpp+26.d00*a12-7.d00*a6

			end if
          end if
		end do

        epot_antes = 4.d00*epot_antes
        suma_rvp = 24.d00*suma_rvp
        suma_r2vpp = 24.d00*suma_r2vpp
        dfiv_antes = suma_rvp/(3.d00*vol)
        d2fiv_antes = (suma_r2vpp-2.d00*suma_rvp)/(9.d00*vol*vol)

        return
		end subroutine potlj_ip