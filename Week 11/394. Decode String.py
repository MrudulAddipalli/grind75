# Solution - https://www.youtube.com/watch?v=qB0zZpBJlh8

# Time - 78%
# Space - 72%

class Solution:
    def decodeString(self, s: str) -> str:
      stack = []

      for i in range(len(s)):
        if (s[i] != "]"):
          stack.append(s[i])
        else:
          subStr = ""

          # start popping till "[" to get substring
          while stack[-1] != "[":
            subStr = stack.pop() + subStr

          # removing "["
          stack.pop()

          # finding number k which is before "["
          k = ""
          # while stack is not empty and last element of stack is a digit
          # we may not have digit , e.g a3[b] --- abbb
          while stack and stack[-1].isdigit():
            k = stack.pop() + k

          # storing updated multiplied string with k [ string converted to int ]
          stack.append(int(k)*subStr)

      # stack elements to string convertion
      return "".join(stack)
