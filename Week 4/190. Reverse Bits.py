
# Solution - https://www.youtube.com/watch?v=UcoN6UjAI64

import operator


class Solution:
    # @param n, an integer
    # @return an integer
    def reverseBits(self, n):
        res = 0
        for i in range(32):
            print("Loop - " + str(i))
            bit = (n >> i) & 1
            print("i - " + str(i) + ", (n >> " + str(i) + ") -- " +
                  str(n >> i) + ", bit -- " + str(bit))
            res = res | (bit << (31-i))
            print("(bit << (31-i)) ---" + str(bit << (31-i)))
            print("res | bit --- " + str(res))
        return res


# Algorithm

# storing right most single bit in bit variable
# performing AND operation on (bit >> 1) with 1, which will only keep last right bit
# (bit >> 1) is shifting bit to right by 1, which will keep giving right most single bit

# then
# doing bit << (31-i), which will shift the bits by (31-i), which is equivalent to making bit variable last bit to come to first , moving 0th bit to 31st bit
# taking that 31st bit and doing logical OR on res variable, which will basically do reverse opeation of bits
# if res is 100, and bit is 001 , OR operation  will return - 101


# Explanation
#
# assume n = 4,
# bit = (n >> i) & 1
# res = res | (bit << (31-i))

# Loop - 0
# i - 0, (n >> 0) -- 4, bit -- 0
# (bit << (31-i)) ---0
# res | bit --- 0
# Loop - 1
# i - 1, (n >> 1) -- 2, bit -- 0
# (bit << (31-i)) ---0
# res | bit --- 0
# Loop - 2
# i - 2, (n >> 2) -- 1, bit -- 1
# (bit << (31-i)) ---536870912
# res | bit --- 536870912
# .
# .
# .
# .
# i - 31, (n >> 31) -- 0, bit -- 0
# (bit << (31-i)) ---0
# res | bit --- 536870912
# 536870912


# original  - 4          -   00000000 00000000 00000000 00000100
# reverse   - 536870912  -   00100000 00000000 00000000 00000000
