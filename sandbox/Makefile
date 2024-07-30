MPI = mpif90
MPIRUN = mpirun

mpi_copy: mpi_copy.f08
	$(MPI) $< -o $@
	$(MPIRUN) -n 2 ./$@


clean:
	$(RM) mpi_copy