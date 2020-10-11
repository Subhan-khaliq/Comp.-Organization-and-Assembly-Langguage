INCLUDE Irvine32.inc 
.data 
Str_1 BYTE  "aabbccdd      ",0 
Str_2 BYTE  "eeffgghh$$$$@@@@",0 
str_3 BYTE 16 dup(?),0
count BYTE ?
.code 
main PROC  
INVOKE Str_trim,ADDR Str_1,' '
INVOKE Str_trim,ADDR Str_2,'@'
INVOKE Str_trim,ADDR Str_2,'$'
 INVOKE Str_ucase,ADDR Str_1  
 INVOKE Str_ucase,ADDR Str_2 
 xor eax,eax
 xor esi,esi
 mov esi,0
 mov ecx,LENGTHOF str_1
 L1:
    mov al,Str_1[esi]
    mov str_3[esi],al
    inc esi
    loop L1
    xor ecx,ecx
    mov ecx,LENGTHOF str_2
    xor esi,esi
    mov esi,0
    mov edi,9
    mov count,8
 L2:
 mov al,str_2[esi]
 PUSH esi
 movzx esi,count
 inc count
 mov str_3[esi],al
 POP esi
 inc esi
 loop L2
    xor ecx,ecx
    xor ecx,SIZEOF str_3
    xor esi,esi
    mov esi,0
    xor eax,eax
   L3:
   mov al,str_3[esi]
   call writechar
   inc esi
   loop L3
 exit 
main ENDP 
END main 