INCLUDE Irvine32.inc
.data

a WORD 16
b DWORD 32
c1 DWORD 64
d DWORD 64
e DWORD 0
eg DWORD 0
ls DWORD 0
gr DWORD 0
count DWORD 0

msgstr1 BYTE "e is",0
msgstr2 BYTE "times less than d",0

.code
main PROC

mov ecx, 0
mov ax, a
add eax, b
mov e, eax
mov eax, e
cmp eax, d
jne firstIfFalse
cmp eax, 0
jna firstIfFalse
mov ebx, 1
mov eg, ebx
jmp secondIf

firstIfFalse:	
	cmp eax, d
	jna firstElseIfFalse
	cmp eax, 0
	je firstElseIfFalse
	mov ebx, 0
	mov eg, 0
	jmp secondIf
firstElseIfFalse:	
	cmp eax, d
	ja movetobody
	cmp eax, 10
	ja movetobody
	jmp secondIfElseFalse

movetobody:
	mov ebx, 1
	mov gr, ebx
	jmp secondIf
	
secondIfElseFalse:	
	mov ebx, 0
	mov gr, ebx

secondIf:	
	cmp eax, d
	jnb secondIfFalse
	mov ebx, 1
	mov ls, ebx
	jmp whileLoop
	
secondIfFalse:	
	mov ebx, 0
	mov ls, 0
	jmp whileLoop
	whileLoop:	
		cmp eax, d
		je next
		inc ecx
		mov edx, OFFSET msgstr1
		call writestring
		mov count, ecx
		loop whileLoop
		
	next:	
		mov eax, count
		call writedec
		mov edx, OFFSET msgstr2
		call writestring 
		call crlf		
		
exit
main ENDP
END main
