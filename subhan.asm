INCLUDE Irvine32.inc
.data 
array byte 10 dup(0)
val byte 0
val1 byte 0
str1 byte " Enter numbers in the array  ",0
msg1 BYTE " ENTER  integers of your own choice: ",0
msg2 BYTE " Enter An Integer to check: ",0
msg3 BYTE " The integer present in array.",0
msg4 BYTE " Its position in array is:",0
msg5 BYTE " The Integer is not present in array.",0
array1 BYTE 10 DUP(?)	
val2 BYTE ?			
.code
assecindingsorting proc
mov edx,0
mov edx,offset str1
call writestring
xor eax,eax
xor ebx,ebx
mov ebx,0
mov eax,0
call crlf
.while ebx<10
    call readint
    mov array[ebx],al
    inc ebx
.endw
call crlf
mov edx,0
mov eax,0
	call crlf
	xor ebx,ebx
	mov eax,0
	.while ebx<10
	    mov eax,0
	    mov ecx,0
	    mov edx,0
	    mov val,0
	    mov val1,0
	    mov cl,array[ebx]
	    .while eax<10
		.IF cl<array[eax]
		    xchg array[eax],cl
		    mov array[ebx],cl
		.endIF
	       inc eax
	    .endw
	    inc ebx
	.endw
	mov ebx,0
	mov eax,0
	.while ebx<10
	    mov al,array[ebx]
	    call writedec
	    call crlf
	    inc ebx
	.endw
ret 
assecindingsorting endp
findindex proc
xor eax,eax
mov edx,OFFSET msg1		
call writeString
mov ecx,0
mov esi,0
	
	mov ecx,10			
L1:					
	call readint			
	mov array1[esi],al		
	inc esi
	loop L1
	xor eax,eax
	mov esi,0
	xor ecx,ecx			 
mov ecx,10				
	mov al,array1[esi]		
	inc esi				
mov edx,OFFSET msg2			
call writeString
xor ebx,ebx
call readint	
mov val2,al				
mov esi,0
mov  ecx,0
mov  ecx,9
L3:					
mov al,array1[esi]
	.IF al==val2			
		mov edx,OFFSET msg3
		call writestring
		call Crlf
		xor eax,eax
		mov edx,OFFSET msg4
		call  writestring
		mov eax,esi
		call writedec
	.ELSE				
		mov edx,OFFSET msg5
		call WriteString
inc esi		
loop L3 	
.ENDIF
ret
findindex endp
main PROC
call assecindingsorting
call findindex
exit
main ENDP
END main
