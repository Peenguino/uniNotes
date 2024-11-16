.global _start
.global main

.data
s:	.string "Hello World"

.text

_start: LDR r0, =s @carica ind str


ctr:	LDRB r1, [r0] @carica char in r1	
main:	CMP r1,#0 @vedi se hai finito
		BEQ end @se hai finito salta alla fine
		@altrimenti
min:	CMP r1,#97 @confronto char ad 'a'
		BLT next
		SUB r2,r1,#32 @rendi mais. tramite diff offset
		STRB r2,[r0] @quando fai store, se registro ha ind, usa []
					
next:	ADD r0,r0,#1
		B ctr
		
end:	MOV pc,lr
