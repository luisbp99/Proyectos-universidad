
		subroutine verlet(np,rx,ry,rz,vx,vy,vz,ax,ay,az,epot,ecin,dfiv,d2fiv)

        use variables_comunes
        implicit none

        integer (kind=entero), intent(in) :: np
        real (kind=doblep), dimension(:), intent(inout) :: rx,ry,rz,vx,vy,vz,ax,ay,az
        real (kind=doblep), intent(out) :: epot,ecin,dfiv,d2fiv

        rx = rx+vx*dt+ax*dt2
        ry = ry+vy*dt+ay*dt2
        rz = rz+vz*dt+az*dt2
        vx = vx+ax*dt12
        vy = vy+ay*dt12
        vz = vz+az*dt12
        
		call potlj(np,rx,ry,rz,ax,ay,az,epot,dfiv,d2fiv)

        vx = vx+ax*dt12
        vy = vy+ay*dt12
        vz = vz+az*dt12

        ecin = 0.5d00*(sum(vx*vx)+sum(vy*vy)+sum(vz*vz))

        end subroutine verlet