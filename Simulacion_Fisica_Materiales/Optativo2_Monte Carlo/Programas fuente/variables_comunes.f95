
		module variables_comunes

        implicit none

        integer, parameter :: entero=SELECTED_INT_KIND(9)
        integer, parameter :: doblep=SELECTED_REAL_KIND(15,307)

        integer (kind=entero), parameter :: npmax=500, numk=5
        real (kind=doblep), parameter :: pi=3.1415926535898d00
        real (kind=doblep) :: pl,pli,vol,dens,rc,rc2,dt,dt12,dt2
        real (kind=doblep) :: corr_ener=0.d00, corr_sum_rvp=0.d00, corr_sum_r2vpp=0.d00

        interface 
        	subroutine potlj(rx,ry,rz,epot,dfiv,d2fiv)
            	implicit none
                real (kind=doblep), dimension(:), intent(in) :: rx,ry,rz
        		real (kind=doblep), intent(out) :: epot,dfiv,d2fiv
			end subroutine
		end interface

        interface
        	subroutine potlj_ip(ip,rx,ry,rz,epot_antes,dfiv_antes,d2fiv_antes)
            	implicit none
                integer (kind=entero), intent(in) :: ip
                real (kind=doblep), dimension(:), intent(in) :: rx,ry,rz
        		real (kind=doblep), intent(out) :: epot_antes,dfiv_antes,d2fiv_antes
            end subroutine
        end interface
                

        end module variables_comunes