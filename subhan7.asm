INCLUDE Irvine32.inc
.data
str1 BYTE "SUBAHN",0
str2 BYTE "Pakist",0
.code
main PROC
xor eax,eax
xor edx,edx
xor esi,esi
xor ebx,ebx
xor esi,0
mov ecx,LENGTHOF str1
L1:
mov al,str1[esi]
mov bl,str2[esi]
mov str1[esi],bl
mov str2[esi],al
inc esi
loop L1
mov edx,OFFSET str1
call writestring
call crlf
mov edx,OFFSET str2
call writestring
exit
main ENDP
END main