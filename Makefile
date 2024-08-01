GFORT='gfortran'

run:
	$(GFORT) tsunami.f90 -o tsunami
	./tsunami > output
	python3 visualizer.py output
	rm output
	rm tsunami

clean:
	rm output
	rm tsunami

