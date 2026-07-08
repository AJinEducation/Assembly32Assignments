; =========================================================================
; FILE: main.asm (32-Bit Version)
; DESCRIPTION: The absolute simplest starter code for absolute beginners.
;              This program calculates 5 + 10 and prints the answer.
; =========================================================================

; These two lines are REQUIRED setup. They must stay at the top of the file.
global main          ; Tells the computer where our program officially starts
extern printf        ; Tells the computer we want to use the standard print tool

section .data
    ; This is the text template used to display the answer on the screen.
    ; %d is a special placeholder where our final math number will drop in.
    ; 10 is the code for a New Line (pressing Enter).
    ; 0 is a Null-Terminator (it tells the computer the text is finished).
    format_string db "The answer is: %d", 10, 0

section .text
main:
    ; ---------------------------------------------------------------------
    ; START BOILERPLATE: Crucial memory setup for 32-bit.
    ; Tell students: "Do not touch or delete these two lines!"
    ; ---------------------------------------------------------------------
    push ebp         ; Save the background memory pointer (32-bit base pointer)
    mov ebp, esp     ; Align the memory stack so the computer doesn't crash
    ; ---------------------------------------------------------------------


    ; =====================================================================
    ; STUDENT WORK ZONE
    ; Students only edit the lines inside this box.
    ; =====================================================================
    
    mov eax, 5        ; 1. Move the number 5 into a temporary storage box named EAX
    add eax, 10       ; 2. Add 10 to whatever number is currently inside box EAX
                      ;    (Box EAX now holds the number 15)
    
    ; =====================================================================


    ; ---------------------------------------------------------------------
    ; END BOILERPLATE: Printing the answer and exiting safely.
    ; Tell students: "Do not touch or delete anything below this line!"
    ; ---------------------------------------------------------------------
    ; In 32-bit, we pass arguments to printf by pushing them onto the stack
    ; backwards. First we push the number, then we push the text format.
    push eax                ; Push the number inside box EAX (the answer)
    push format_string      ; Push our text layout template
    call printf             ; Trigger the print command to show the text
    add esp, 8              ; Clean up the stack (we pushed two 4-byte items)
    
    mov eax, 0              ; Set the program's final status code to 0 (Success)
    mov esp, ebp            ; Restore original memory stack pointer
    pop ebp                 ; Restore original background memory pointer
    ret                     ; Successfully close the program and exit