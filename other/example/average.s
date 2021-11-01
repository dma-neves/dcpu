jmp main

avg:
	pop RB ; arr
	pop RC ; len
	lod $0 RD ; sum = 0
	lod $0 RE ; i = 0

	sum_loop_start:
		; if i >= len goto loop_end
		sub RC RE
		jmpn sum_loop_end
		jmpz sum_loop_end

		; sum += arr[i]
		add RB RE
		lod ACR ADR
		lod [ADR] RF
		add RD RF
		lod ACR RD

		; i++
		inc RE
		lod ACR RE
		jmp sum_loop_start
	sum_loop_end:

	psh $0 ; div = 0
	psh RD ; s = sum

	div_loop_start:
		; s -= len
		lsr $1 RF
		sub RF RC
		lod ACR RF
		srs RF $1

		; if s <= 0 goto div_loop_end
		lsr $1 RF
		dec RF
		jmpn div_loop_end

		; else div++ and goto div_loop_start
		lsr $2 RF
		inc RF
		lod ACR RF
		srs RF $2
		jmp div_loop_start
	div_loop_end:

	; return div
	pop
	pop RA
	pop RB
	lod RB ADR
	jmp ADR

main:
	psh $3 ; len = 3
	psh $5 ; arr[0] = 5
	psh $2 ; arr[1] = 2
	psh $9 ; arr[2] = 9


	psh avg_ret ; push return address
	lsr $5 RA ; push len
	psh RA ; push arr
	SSP $5
	psh ACR
	; call avg(arr,len)
	jmp avg
	avg_ret:

	hlt