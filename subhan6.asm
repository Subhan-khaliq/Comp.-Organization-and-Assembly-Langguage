Include Irvine32.inc 

.data
    Array Byte 1,2,3,4,5,6,7,8,9,10
    a byte 0
    r byte 9
    x byte 10
    m byte ?


.code

    main Proc
        .while a <= r
            mov al, m
            mov bl, r
            mov dl, a
            sub bl, dl
            xor dl, xor
            mov dl, a
            mov cl, a/2
            mul cl
            add al, cl

        .If Array[m] == x
            jmp fin
            .endif
           

        .if Array[m] < x
            mov al, a
            mov bl, m
            add bl, a
            mov al, bl

        

        .else
            mov al, r
            mov bl, m
            sub bl, a
        .endif

        .endw

        xor al, xor
        mov al, a
        neg al
        
        fin:
        exit
main ENDP
END main
