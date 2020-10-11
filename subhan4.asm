INCLUDE Irvine32.inc
.data
str1 BYTE "aabbccdd      ",0 
str2 BYTE  "eeffgghh$$$$@@@@",0
str3 BYTE ?
.code
main PROC
INVOKE Str_trim,ADDR str1,' '
INVOKE Str_trim,ADDR str2,'@'
INVOKE Str_trim,ADDR str2,'$'
mov edx,OFFSET str1
call writestring
mov edx,OFFSET str2
call writestring
exit
main ENDP
END main