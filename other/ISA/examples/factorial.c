############### factorial.c ###############

int main() {

	int a = 5;
	int fac = 1;

	for(int i = 2; i < a; i++) {

		// fac = fac*i;

		int mult = 0;
		for(int j = 0; j < i; j++) {

			mult += fac;
		}

		fac = mult;
	}
}

############### factorial.s ###############

// a = 5
psh $5

// fac = 1
lod $1 RA

// i = 2
lod $2 RB

factorial_loop_start:

	// mult = 0
	lod $0 RC

	// j = 0
	lod $0 RD

	mult_loop_start:

		add RC RA
		lod ACR RC

		// if j<i goto mult_loop_start
		sub RB RD
		jmpn mult_loop_start

	psh RC
	pop RA

	// if i<a goto factorial_loop_start
	lsr $1 RE
	sub RE RB
	jmpn factorial_loop_start

hlt