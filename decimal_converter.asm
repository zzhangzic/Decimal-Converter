.ORIG x3000

LEA R0,HI_1 ;print out greeting		
PUTS

AGAIN
AND R0,R0,#0		
ST R0,RES2		
ST R0,RES1
LEA R0,HI_2	 
PUTS ;reset variables and print out greeting again

MAIN
AND R0,R0,#0
AND R1,R1,#0
AND R2,R2,#0
AND R3,R3,#0
AND R4,R4,#0
AND R5,R5,#0
AND R6,R6,#0
AND R7,R7,#0 ;set up all resister

GETC
PUTC ;get input

ADD R6,R6,#9 ;loop counter for 1-9
ADD R2,R0,#-10	;Check if user press enter
BRz ENTER

ST R0,RES3	
AND R3,R3,#0
ADD R3,R0,#-8
ADD R3,R3,#-16
ADD R3,R3,#-16
ADD R3,R3,#-16
ADD R3,R3,#-16
ADD R3,R3,#-16 ;check if user press enter X
BRz QUIT

AND R3,R3,#0 ;Check if it is a negative sign	
AND R2,R2,#0
ADD R2,R0,#-16
ADD R2,R2,#-16
ADD R2,R2,#-13
BRz NEGATIVE
BRnp SAVE ;if not negative, go starting saving integer

NEGATIVE
AND R3,R3,#0
LD R3,RES1
ADD R3,R3,#1
ST R3,RES1 ;invert the number and add one for negative number
BRp MAIN

SAVE ;Saving integer
LD R1,RES2
ADD R3,R3,R1
ADD R6,R6,#-1
BRzp SAVE ;continue saving if not done

AND R2,R2,#0 ;
ADD R2,R0,#-16
ADD R2,R2,#-16
ADD R3,R3,#-16 ;get real value of the int
ADD R3,R3,R2
ST R3,RES2
BRnzp MAIN

ENTER
AND R0,R0,0
AND R2,R2,0
AND R3,R3,0
AND R4,R4,0
AND R5,R5,0
AND R6,R6,0 ;Reset Register
LEA R0, HI_3 ;Print Greeting Statement
PUTS

LEA R2,MASK ;Load Mask Address
LD R6,COUNT ;Load Count Value
LD R3,RES1 ;Check Sign
BRz COMPARE
LD R4,RES2 ;Load INT
NOT R4,R4 ;Invert R1 1's
ADD R4,R4,#1 ;Add 1 2's
ST R4,RES2 ;Store Back INT

COMPARE
AND R0,R0,0
AND R1,R1,0
AND R3,R3,0
AND R5,R5,0
AND R7,R7,0 ;Reset Register

LDR R4,R2,#0 ;Load Register Memory
ADD R6,R6,0 ;Check Count
BRn AGAIN

LD R5,RES2 ;Load INT
AND R7,R5,R4 ;INT AND MASK
BRnp PRINT1 ;PRINT1 FUNCTION
AND R0, R0 #0

ADD R2,R2,#1 ;MASKPTR+1
ADD R6,R6,#-1 ;COUNT-1
LEA R0,ZERO ;PRINT "0"
PUTS
BRnzp COMPARE

PRINT1
AND R0, R0 #0
ADD R2,R2,#1 ;MASKPTR+1
ADD R6,R6,#-1 ;COUNT-1
LEA R0,ONE ;PRINT "1"
PUTS
BRnzp COMPARE







QUIT ;quit the program, print out goodbye message
LD R0, HI_4
PUTS
HALT

HI_1 .STRINGZ "Welcome to the conversion program\n"
HI_2 .STRINGZ "Enter a decimal number or X to quit\n"
HI_3 .STRINGZ "Thanks here it is in binary\n"
HI_4 .STRINGZ "Bye. Have a great day\n" ;different text message

ZERO .STRINGZ "0"
ONE .STRINGZ "1" ;for printing 0 and 1
COUNT .FILL #15
RES1 .FILL #0
RES2 .FILL #0
RES3 .FILL #0 ;for counter and saving


MASK	.FILL b1000000000000000
	.FILL b0100000000000000
	.FILL b0010000000000000
	.FILL b0001000000000000
	.FILL b0000100000000000
	.FILL b0000010000000000
	.FILL b0000001000000000
	.FILL b0000000100000000
	.FILL b0000000010000000
        .FILL b0000000001000000
        .FILL b0000000000100000
        .FILL b0000000000010000
        .FILL b0000000000001000
	.FILL b0000000000000100
	.FILL b0000000000000010
	.FILL b0000000000000001 ;mask table


.END