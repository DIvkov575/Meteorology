
module setup
    contains
        pure subroutine set_gaussian(x, icenter, decay)
            ! Sets the values of x to a Gaussian shape centered on icenter
            ! that decays with the given input decay.
            real, intent(inout) :: x(:)
            integer, intent(in) :: icenter
            real, intent(in) :: decay
            integer :: i
            do concurrent(i = 1:size(x))
                x(i) = exp(-decay * (i - icenter)**2)
            end do
        end subroutine set_gaussian

        subroutine constant_checks(dt, dx, c, grid_size)
            integer, intent(in) :: grid_size
            real, intent(in) :: dt, dx, c

            if (grid_size <= 0) stop 'grid_size must be > 0'
            if (dt <= 0) stop 'time step dt must be > 0'
            if (dx <= 0) stop 'grid spacing dx must be > 0'
            if (c <= 0) stop 'background flow speed c must be > 0'
        end subroutine constant_checks
end module setup