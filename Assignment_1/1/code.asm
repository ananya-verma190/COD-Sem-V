# Search for a character and replace it with a special character

.data
str: .string "abcdct"
character: .byte 99        # ASCII value for 'c'
replace: .byte 63          # ASCII value for '?'

.text
la x7, str
la x5, character
la x6, replace

lb x5, 0(x5)                # x5 = c
lb x6, 0(x6)                # x6 = ?

loop:
lb x10, 0(x7)
beq x10, x0, end            # check is string has ended
bne x10, x5, skip
sb x6, 0(x7)
skip: 
addi x7, x7, 1
beq x0, x0, loop
end: nop
