
program tsunami
    use mod_diff, only: diff
    use setup, only: set_gaussian, constant_checks

    implicit none

    integer :: n
    integer, parameter :: grid_size = 100 ! grid size in x
    integer, parameter :: num_time_steps = 100 ! number of time steps
    real, parameter :: dt = 1 ! time step [s]
    real, parameter :: dx = 1 ! grid spacing [m]
    real, parameter :: c = 1 ! phase speed [m/s]
    real :: h(grid_size)
    integer, parameter :: icenter = 25
    real, parameter :: decay = 0.02
    character(*), parameter :: fmt = '(i0,*(1x,es15.8e2))'

    call constant_checks(dt, dx, c, grid_size)
    call set_gaussian(h, icenter, decay)

    print fmt, 0, h

!    u = 0
    time_loop: do n = 1, num_time_steps
        h = h - c * diff(h) / dx * dt
        print fmt, n, h
    end do time_loop

contains


end program tsunami