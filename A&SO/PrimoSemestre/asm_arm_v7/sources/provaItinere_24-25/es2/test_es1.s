	.data
s:	"stringa di prova"	@ modificare la stringa a piacimento

	.text
	.global main
	.type main, %function

main:	ldr r0, =s    	@ indirizzo della stringa
	bl conta    	@ chiamata della conta
	mov pc, lr    	@ qui r0 = #occorrenze delle coppie di caratteri consec.