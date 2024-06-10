.model small
.stack 100h
.data

titleMsg db "SIMON - A MEMORY GAME$", 0Dh, 0Ah, "$"
intructMsg db "Press The Keys According To The Display Sequence$", 0Dh, 0Ah, "$"
keysMsg db "Keys:", 0Dh, 0Ah, "$"
greenMsg db "q = Green", 0Dh, 0Ah, "$"
RedMsg db "w = Red", 0Dh, 0Ah, "$"
blueMsg db "a = Blue", 0Dh, 0Ah, "$"
yellowMsg db "s = Yellow", 0Dh, 0Ah, "$"
endMsg db "ESC = End game", 0Dh, 0Ah, "$"
startMsg db "Press ENTER To Start", 0Dh, 0Ah, "$"
lostMsg db "DEFEAT - You LOST", 0Dh, 0Ah, "$"
WinMsg db "Victory - You WON", 0Dh, 0Ah, "$"
ExitMsg db "Press ENTER To Exit", 0Dh, 0Ah, "$"


keysToMove db 'w', 'a', 'q', 's'
temp dw 3
.code
main proc                                                        ; main procedure to clear the screen and display Messages of first screen
    mov ax, @data
    mov ds, ax

    ; Display start screen and instructions
    call clearScreen
    
    mov dh, 3
    mov dl, 28

    call positioningTheCursor
    
    mov bh, 0
    mov dx, offset titleMsg
    
    call printString

    
    mov dh, 5
    mov dl, 16

    call positioningTheCursor
    
    mov dx, offset intructMsg
    call printString

    
    mov dh, 7
    mov dl, 19

    call positioningTheCursor

    mov dx, offset keysMsg
    call printString

    mov dh, 8
    mov dl, 25

    call positioningTheCursor

    mov dx, offset greenMsg
    call printString

    mov dh, 9
    mov dl, 25

    call positioningTheCursor

    mov dx, offset RedMsg
    call printString


    mov dh, 10 ; y axis (upside down)
    mov dl, 25 ; x axis

    call positioningTheCursor

    mov dx, offset blueMsg
    call printString

    
    mov dh, 11 ; y axis (upside down)
    mov dl, 25 ; x axis

    call positioningTheCursor

    mov dx, offset yellowMsg
    call printString

    mov dh, 15 ; y axis
    mov dl, 25 ; x axis

    call positioningTheCursor

    mov dx, offset startMsg
    call printString

;------------------drawing first screen finished----------------------

waitForEnter:                                                     ; Level to wait for user to press Enter
    mov ah, 00h
    int 16h
    cmp al, 0dh
    jne waitForEnter

;------------------Start the game----------------------

    call clearScreenWithoutBlink ;to prevent mouse flashing
    call cursorHider

    call drawSquares

loopTheGame:                                                     ; Loop the Game
    inc temp
    mov si, offset keysToMove
    mov cx, 0 ;check how many times we looped already

displayInSeq:                                                    ; Display the sequence and Play the Notes
    mov al, [si]
    
    call PlayAndDraw
    
    inc si
    inc cx
    cmp cx, temp
    jb displayInSeq

    mov si, offset keysToMove
    mov cx, 0

userInputSeq:                                                    ; Get user Input of Sequence
    push cx
    mov ah, 07h 						;checks input from keyboard
    int 21h
    
    call PlayAndDraw 						;after user input, play his choice on the screen
    
    cmp al, 1bh 						;al stores the key pressed
    jne notCancel
    jmp exit

notCancel:                                                      ; Compare the inputs with actual sequence
    cmp al, [si]
    jne wrongInput						;lost the game
    inc si
    pop cx
    inc cx 							;how many times we looped
    cmp cx, temp
    jb userInputSeq
    mov dl, [si]
    mov dh, [si + 1]
    je lvlEnd 							;won the game
    jmp loopTheGame						;we never reach this code, because we already exited, I tried to make the game loop forever but had bugs.

wrongInput:                                                    ; If the User's Input sequence is not Correct
    
    mov dh, 3
    mov dl, 36
    call positioningTheCursor
    mov dx, offset lostMsg
    call printString
    jmp exit

lvlEnd:                                                        ; If the User's Input sequence is Correct, Display Victory Message
    mov dh, 3
    mov dl, 36
    call positioningTheCursor
    mov dx, offset WinMsg
    call printString

exit:                                                         ; If the User's Input sequence is not Correct, Exit the Game
    call positioningTheCursor
    mov dh, 18
    mov dl, 23
    mov dx, offset ExitMsg
    call printString

waitForExit:                                                  ; Wait for user to Press Enter before Exit the Game 
    mov ah, 00h
    int 16h
    cmp al, 0dh 						;compare with enter
    jne waitForExit
    mov ax, 0003h 						;exit program
    int 10h
    mov ax, 4c00h
    int 21h

main endp

clearScreen proc                                              ; Procedure to Clear the screen
    mov ah, 06h 						
    mov al, 00h							; Clear the screen
    mov bh, 07h 						; Attribute (white on black for text mode)
    mov cx, 0000h 						; Upper left corner of the window (row 0, column 0)
    mov dx, 184fh						; Lower right corner of the window (row 24, column 79)
    int 10h							; BIOS interrupt to execute the function
    ret								; Returns from the procedure
clearScreen endp

clearScreenWithoutBlink proc                                  ; Procedure to CLear the Screen without blink to increase the Useability
    mov ax, 1003h						; Set cursor mode (disable blinking)
    mov bx, 0
    int 10h
    call clearScreen
    ret
clearScreenWithoutBlink endp

cursorHider proc                                             ; Procedure to hide the cursor during the Game 
    mov ch, 32
    mov ah, 01h
    int 10h
    ret
cursorHider endp

positioningTheCursor proc                                      ; Setting the cursor position to Display at specific (x,y)
    mov ah, 02h
    mov dh, dh ;y axis
    mov dl, dl ;x axis
    mov bh, 00h
    int 10h
    ret
positioningTheCursor endp

printString proc                                             ; Procedure to print the strings (Mainly used to Message Printing)
    mov ah, 09h						;prints the string in dx register at the position of the cursor	 				
    int 21h
    ret
printString endp

PlayAndDraw proc                                             ; Procedure to Play and draw the Squares by comparing with Input
    push ax
    cmp al, 'q'
    jne ifNotGreen
    call newGreen
    mov bx, 5709					;sound code
    call playMusic
    call newGreen2
    jmp incomplete 					;incomplete for finish

ifNotGreen:
    cmp al, 'w'
    jne ifNotRed
    call newred
    mov bx, 4870
    call playMusic
    call newred2
    jmp incomplete

ifNotRed:
    cmp al, 'a'
    jne ifNotBlue
    call NewBlue2
    mov bx, 2875
    call playMusic
    call NewBlue
    jmp incomplete

ifNotBlue:
    cmp al, 's'
    jne ifNotyellow
    call white
    mov bx, 3837
    call playMusic
    call yellow
    jmp incomplete

ifNotyellow:						;skipped everything
    incomplete:
        pop ax
        ret

PlayAndDraw endp

playMusic proc                                             ; Procedure to play the music on each Square
    push cx						;plays the sound according to the value in bx register	
    mov al, 10110110B
    out 43H, al
    mov ax, bx
    out 42H, al
    mov al, ah
    out 42H, al
    in al, 61H
    or al, 00000011B
    out 61H, al
    mov ah, 86h
    mov cx, 7
    mov dx, 0a120h
    int 15h
    in al, 61H
    and al, 11111100B
    out 61H, al
    pop cx
    ret
playMusic endp

drawSquares proc                                             ; Procedure to draw the squares
    call newGreen2
    call newred2
    call NewBlue
    call yellow
    ret
drawSquares endp
    
    ;___________________________________________________________ Procedures to print different shades of colors when the note is played 

newGreen proc				;light green
    mov bl, 0aah			;color
    mov dl, 29				;y axis
    mov dh, 5				;x axis
    call drawLines			;draw
    ret
newGreen endp

newGreen2 proc				;dark green
    mov bl, 022h
    mov dl, 29
    mov dh, 5
    call drawLines
    ret
newGreen2 endp

newred proc				;light
    mov bl, 0CCh
    mov dl, 41
    mov dh, 5
    call drawLines
    ret
newred endp

newred2 proc				;dark
    mov bl, 044h
    mov dl, 41
    mov dh, 5
    call drawLines
    ret
newred2 endp

NewBlue2 proc				;light
    mov bl, 099h
    mov dl, 29
    mov dh, 11
    call drawLines
    ret
NewBlue2 endp

NewBlue proc				;dark
    mov bl, 011h
    mov dl, 29
    mov dh, 11
    call drawLines
    ret
NewBlue endp

yellow proc
    mov bl, 0EEh			;color
    mov dl, 41
    mov dh, 11
    call drawLines
    ret
yellow endp

white proc
    mov bl, 0ffh
    mov dl, 41
    mov dh, 11
    call drawLines
    ret
white endp

drawLines proc                                             ; Procedure to draw lines
    push cx						;very old cx value						
    mov cx, 5						;5 rows
    mov bh, 0						;for the correct color
    mov al, 0						;so draw will work well - default character to draw
 
    drawSquaresLevel:					;10 columns 
        push cx						;save the value of cx (was 5) for rows
        mov cx, 10					;draw 10 columns
        mov ah, 13h					;draw to screen
        int 10h
        inc dh						;move to the next row y axis increases
        pop cx						;return previous cx value (was 5)
        loop drawSquaresLevel
        pop cx						;push the value in the stack (מחסנית) to cx
        ret
drawLines endp

end main