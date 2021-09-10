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

cl:
	rm *.o
	rm *.cf

r64:
	ghdl -a src/Memory/RAM64.vhd
	ghdl -a src/tests/RAM64_test.vhd
	ghdl -e RAM64_test
	ghdl -r RAM64_test --wave=wave.ghw --stop-time=70ns
	rm *.o
	rm *.cf
	rm ram64_test

cu:
	ghdl -a src/CU/*.vhd
	ghdl -a src/Mux/*.vhd
	ghdl -a src/Memory/*.vhd
	ghdl -a src/tests/ControlUnit_test.vhd
	ghdl -e ControlUnit_test
	ghdl -r ControlUnit_test --wave=wave.ghw --stop-time=200ns
	rm *.o
	rm *.cf

sm:
	ghdl -a src/CU/SevenState_sm.vhd
	ghdl -a src/Memory/DFlipFlop.vhd
	ghdl -a src/Memory/DFlipFlopRA.vhd
	ghdl -a src/tests/sevenState_sm_test.vhd
	ghdl -e SevenState_sm_test
	ghdl -r SevenState_sm_test --wave=wave.ghw --stop-time=1000ns
	rm *.o
	rm *.cf