all:
	ghdl -a src/ALU/*.vhd
	ghdl -a src/CU/*.vhd
	ghdl -a src/Main/*.vhd
	ghdl -a src/Mux/*.vhd
	ghdl -a src/Memory/*.vhd
	ghdl -a src/tests/main_test.vhd
	ghdl -e main_test
	ghdl -r main_test --wave=wave.ghw --stop-time=35us
	mv *.o obj

clean:
	rm obj/*.o
	rm *.cf
	rm *.ghw
	rm main_test

r64:
	ghdl -a src/Memory/RAM64.vhd
	ghdl -a src/tests/RAM64_test.vhd
	ghdl -e RAM64_test
	ghdl -r RAM64_test --wave=wave.ghw --stop-time=70ns
	rm *.o
	rm *.cf
	rm ram64_test