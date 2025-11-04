# bubble sort
# for(int i = 0; i < n - 1; i++){
#     for(int j = 0; j < n - i - 1; j++){
#         if (arr[j] > arr[j + 1]){
#             int temp = arr[i];
#             arr[i] = arr[j];
#             arr[j] = temp;
#         }
#     }
# }

.data
arr: .word 9,2,7,11,1

.text
la x10, arr
addi x11, x0, 5              # n = 5
addi x12, x0, 0              # i = 0
addi x11, x11, -1            # n - 1

outer: 
    bge x12, x11, exit1
    sub x13, x11, x12            # n - 1 - i
    addi x5, x0, 0
inner: 
    bge x5, x13, exit2
    slli x6, x5, 2
    add x6, x6, x10
    lw x7, 0(x6)
    lw x8, 4(x6)
    ble x7, x8, skip
    sw x8, 0(x6)
    sw x7, 4(x6)
skip:
    addi x5, x5, 1
    jal x0, inner
exit2:
    addi x12, x12, 1
    jal x0, outer
exit1:
    nop
