.model small
.stack 100h
.data

icmd db 'Enter an input to perform actions: $' 
addi db 10, 13,'1. Addition $',10,13
Subt db 10, 13,"2. Subtraction $"
mult db 10, 13,"3. Multiplication $" 
divi db 10, 13,"4. Division $" 
andop db 10, 13,"5. AND $", 
orop db 10, 13,"6. OR $",  
xorop db 10, 13,"7. XOR $"
exi db 10, 13,"8. Exit $"

a dw ?
b dw ?    

q db ? 
r db ?

firstNum db 10, 13,'Enter the first number: $'
SecondNum db 10, 13,'Enter the second number: $' 
resultAdd db 10, 13,'Addition is: $' 

mulfirstNum db 10, 13,'Enter the multiplicand: $'
mulSecondNum db 10, 13,'Enter the  multiplier: $' 
resultmul db 10, 13,'Multiplication is: $'
                                    
resultsub db 10, 13,'Subtraction is: $'

divfirstNum db 10, 13,'Enter the dividend: $'
divSecondNum db 10, 13,'Enter the  divisor: $'     

resultdivq db 10, 13,'Quotient is: $' 

resultdivr db 10, 13,'Remainder is: $' 

resultdivi db 10, 13,'Division Result is: Undefined, Number can not be divided by zero $'

resultand db 10, 13,'(AND)& result is: $' 

resultor db 10, 13,'(OR)| result is: $'

resultxor db 10, 13,'(XOR) result is: $'                                      

.code
main proc
    mov ax,@data
    mov ds, ax
    
menu:    
    mov ah, 9
    lea dx, icmd
    int 21h 
    
    lea dx, addi
    int 21h 
    
    lea dx, Subt
    int 21h  
    
    lea dx, mult
    int 21h   
    
    lea dx, divi
    int 21h   
    
    lea dx, andop
    int 21h 
    
    lea dx, orop
    int 21h  
        
    lea dx, xorop
    int 21h 
        
    lea dx, exi
    int 21h 
    
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    

    ;menu input action selection    
    mov ah, 1
    int 21h
    
    cmp al, '1'
    je addition   
    
    cmp al, '2'
    je subtraction
    
    cmp al, '3'
    je multiplication
    
    cmp al, '4'
    je division  
    
    cmp al, '5'
    je andlabel   
    
    cmp al, '6'
    je orlabel  
    
    cmp al, '7'
    je xorlabel  
    
    cmp al, '8'
    je exit
    


  
  
  
;all operations label    
    
addition:  
    ;firstnum input
    mov ah, 9
    lea dx, firstNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bl, al 
    sub bl, 48 
    
    
    ;secondnum input
    mov ah, 9
    lea dx, secondNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bh, al 
    sub bh, 48
    
    
    ;add operation
    add bl, bh 
    add bl, 48 
    
    
    ;checking if result is greater than 9
    cmp bl, 57
    jg greater  
    
    ;add output
    mov ah, 9
    lea dx, resultAdd
    int 21h  
    
    mov ah, 2
    mov dl, bl
    int 21h 
    
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
      
    ;menu
    jmp menu
    
    greater:
    mov ah, 9
    lea dx, resultAdd
    int 21h  
    
    mov ah, 2 
    mov dl, '1'
    int 21h 
    sub bl, 10
    mov dl, bl
    int 21h 
    
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
      
    ;menu
    jmp menu
    
    

subtraction:
    ;firstnum input
    mov ah, 9
    lea dx, firstNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bl, al 
    sub bl, 48 
    
    
    ;secondnum input
    mov ah, 9
    lea dx, secondNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bh, al 
    sub bh, 48 
    
    cmp bl, bh
    jge label1 
    jl label2
    
    
    label1:
    ;subtraction operation No.1
    sub bl, bh 
    add bl, 48  
    
    ;subtraction output No.1
    mov ah, 9
    lea dx, resultSub
    int 21h  
    
    mov ah, 2
    mov dl, bl
    int 21h  
    
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
      
    ;menu
    jmp menu
    
    
    label2:  
    ;subtraction operation No.2
    sub bh, bl
    add bh, 48  
    
    ;subtraction output No.2
    mov ah, 9
    lea dx, resultSub
    int 21h  
    
    mov ah, 2 
    mov dl,2Dh
    int 21h
    mov dl, bh
    int 21h
    
      
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
      
    ;menu
    jmp menu

multiplication: 
    ;firstnum input
    mov ah, 9
    lea dx, mulfirstNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov a, ax 
    sub a, 48 
    
    
    ;secondnum input
    mov ah, 9
    lea dx, mulsecondNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov b, ax 
    sub b, 48
    
    
    ;multiplication operation
    mov ax, a 
    mul b
    
    add ax, 48 
    
    mov bx, ax 
    
    ;multiplication output
    mov ah, 9
    lea dx, resultmul
    int 21h  
    
    mov ah, 2
    mov dx, bx
    int 21h
      
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
      
    ;menu
    jmp menu

division: 
    ;firstnum input
    mov ah, 9
    lea dx, divfirstNum
    int 21h  
    
    
    mov ah, 1
    int 21h
    mov bl, al 
    sub bl, 48 
    
    
    ;secondnum input
    mov ah, 9
    lea dx, divSecondNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bh, al 
    sub bh, 48
    
    ;checking if divisor is zero
    cmp bh, 0
    je invalid
    
    ;division operation
    mov ah, 0
    mov al, bl 
    div bh
    
    mov q, al
    add q, 48  
    
    mov r, ah,
    add r, 48
    
    ;division output quotient
    mov ah, 9
    lea dx, resultdivq
    int 21h  
    
    mov ah, 2
    mov dl, q 
    int 21h
       
         
    ;division output remainder
    mov ah, 9
    lea dx, resultdivr
    int 21h  
    
    mov ah, 2
    mov dl, r 
    int 21h
      
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
      
    ;menu
    jmp menu 
               
               
    ;if divided by zero
    invalid: 
    mov ah, 9
    lea dx, resultdivi
    int 21h  
    
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
      
    ;menu
    jmp menu 
           
              
andlabel:  
   ;firstnum input
    mov ah, 9
    lea dx, firstNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bl, al 
    sub bl, 48 
    
    
    ;secondnum input
    mov ah, 9
    lea dx, secondNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bh, al 
    sub bh, 48
    
    
    ;AND operation
    and bl, bh 
    add bl, 48  
    
    ;AND output
    mov ah, 9
    lea dx, resultand
    int 21h  
    
    mov ah, 2
    mov dl, bl
    int 21h
      
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
      
    ;menu
    jmp menu

orlabel: 
   ;firstnum input
    mov ah, 9
    lea dx, firstNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bl, al 
    sub bl, 48 
    
    
    ;secondnum input
    mov ah, 9
    lea dx, secondNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bh, al 
    sub bh, 48
    
    
    ;OR operation
    or bl, bh 
    add bl, 48  
    
    ;OR output
    mov ah, 9
    lea dx, resultor
    int 21h  
    
    mov ah, 2
    mov dl, bl
    int 21h
      
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
      
    ;menu
    jmp menu

xorlabel: 
   ;firstnum input
    mov ah, 9
    lea dx, firstNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bl, al 
    sub bl, 48 
    
    
    ;secondnum input
    mov ah, 9
    lea dx, secondNum
    int 21h  
    
    mov ah, 1
    int 21h
    mov bh, al 
    sub bh, 48
    
    
    ;XOR operation
    xor bl, bh 
    add bl, 48  
    
    ;XOR output
    mov ah, 9
    lea dx, resultxor
    int 21h  
    
    mov ah, 2
    mov dl, bl
    int 21h
      
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
      
    ;menu
    jmp menu


   
    
    
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main