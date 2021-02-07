# n! python

n = 5
r = 1
i = 1

while i <= n:
	
	r *= i
	i += 1

print(str(r))



---------------------------

# n! pseudo assembly

n = 5
r = 1
i = 1

start:

	r *= i
	i ++

	n-i
	jmpn start

---------------------------

# a*b pseudo assembly


a*b :

i = 1
r = 0

mult_start:

	r += a
	i++

	b-i
	jmpn mult_start

---------------------------


# a*b assembly

lod $a RA
str RA 0 # a

lod $b RA
str RB 1 # b

lod $1 RA # i
str RA 2

lod $0 RA # r
str RA 3

mult_start:

	lod 3 RA
	lod 1 RB
	add RA RB
	str ACR 3 # r += a

	lod 2 RA
	inc RA
	str ACR 2 # i++

	lod 1 RA
	lod 2 RB
	sub RA RB #b-i

	jmpn 7 # jmpn mult_start

lod 3 RA
hlt


-------------------------------

# a*b binary (a=23 b=5)

lod $a RA 0001011100010110

str RA 0  0000000000001111

lod $b RA 0000010100010110

str RB 1  0000000100010001

lod $1 RA 0000000100010110

str RA 2  0000001000001111

lod $0 RA 0000000000010110

str RA 3  0000001100001111

lod 3 RA  0000001100001110

lod 1 RB  0000000100010000

add RA RB 0000000000000000

str ACR 3 0000001100010101

lod 2 RA  0000001000001110

inc RA    0000000000000110

str ACR 2 0000001000010101

lod 1 RA  0000000100001110

lod 2 RB  0000001000010000

sub RA RB 0000000000000011

jmpn 7    0000011100011001

lod 3 RA  0000001100001110

hlt       0000000000011011