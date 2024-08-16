
module mod_diff
   contains
        pure function diff(x) result(dx)
            ! Returns a 1st-order finite difference of a 1-d array.
            real, intent(in) :: x(:)
            real :: dx(size(x))
            integer :: im
            im = size(x)

            dx(1) = x(1) - x(im-1)
            dx(2) = x(2) - x(im)
            dx(3:im) = x(3:im) - x(1:im-2)

        end function diff
end module mod_diff