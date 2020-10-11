INCLUDE Irvine32.inc
.data
var DWORD ?
var2 DWORD ?
var3 DWORD ?
sum DWORD 0d
count DWORD 0d
str1 BYTE "Total sum is : ",0
str2 BYTE "Total digits is : ",0
str3 BYTE "Enter digit :  ",0
.code
main PROC
xor eax,eax
xor ebx,ebx
xor edx,edx
xor ecx,ecx
mov edx,OFFSET str3
call writestring
call readint
mov var2,eax
xor eax,eax
xor edx,edx
.While var2>0
	xor eax,eax
	xor edx,edx
	mov eax,var2
	mov ebx,10d
	div ebx
	mov var2,0
	mov var2,eax
	xor eax,eax
	mov var,edx
	mov eax,var
	ADD sum,eax
	inc count
.ENDW
xor edx,edx
mov edx,OFFSET str1
call writestring
xor eax,eax
mov eax,sum
call writedec
call crlf
xor edx,edx
mov edx,OFFSET str2
call writestring
xor eax,eax
mov eax,count
call writedec
exit
main ENDP
END main