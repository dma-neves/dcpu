all:
	ghdl -a ALU/*.vhd
	ghdl -a CU/*.vhd
	ghdl -a Main/*.vhd
	ghdl -a Mux/*.vhd
	ghdl -a Memory/*.vhd
	ghdl -a tests/main_test.vhd; 
	ghdl -e main_test; 
	ghdl -r main_test --wave=wave.ghw --stop-time=35us

clean:
	rm *.o
	rm *.cf
	rm *.ghw
	rm main_test