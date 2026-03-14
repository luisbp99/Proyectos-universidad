
		module variables_comunes

        implicit none

        integer, parameter :: entero=SELECTED_INT_KIND(9)
        integer, parameter :: doblep=SELECTED_REAL_KIND(15,307)

        integer (kind=entero), parameter :: npmax=500, numk=5
        real (kind=doblep), parameter :: pi=3.1415926535898d00
        real (kind=doblep) :: pl,pli,vol,dens,rc,rc2,dt,dt12,dt2
        real (kind=doblep) :: corr_ener=0.d00, corr_sum_rvp=0.d00, corr_sum_r2vpp=0.d00

        interface 
        	subroutine potlj(np,rx,ry,rz,ax,ay,az,epot,dfiv,d2fiv)
            	implicit none
                integer (kind=entero), intent(in) :: np
                real (kind=doblep), dimension(:), intent(in) :: rx,ry,rz
        		real (kind=doblep), dimension(:), intent(out) :: ax,ay,az
        		real (kind=doblep), intent(out) :: epot,dfiv,d2fiv
			end subroutine
		end interface

        interface
        	subroutine verlet(np,rx,ry,rz,vx,vy,vz,ax,ay,az,epot,ecin,dfiv,d2fiv)
            	implicit none
                integer (kind=entero), intent(in) :: np
        		real (kind=doblep), dimension(:), intent(inout) :: rx,ry,rz,vx,vy,vz,ax,ay,az
        		real (kind=doblep), intent(out) :: epot,ecin,dfiv,d2fiv
            end subroutine
        end interface    

        end module variables_comunes