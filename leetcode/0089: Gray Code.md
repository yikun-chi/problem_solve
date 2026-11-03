Problem: 
An n-bit gray code sequence is a sequence of 2n integers where:

Every integer is in the inclusive range [0, 2n - 1],
The first integer is 0,
An integer appears no more than once in the sequence,
The binary representation of every pair of adjacent integers differs by exactly one bit, and
The binary representation of the first and last integers differs by exactly one bit.
Given an integer n, return any valid n-bit gray code sequence.
(https://leetcode.com/problems/gray-code/description/)


Brute Solution: 
At every step, we first add a zero to previous solution, then reverse previous solution andd add a 1 on top. 
Useful notes, use format(number, "0xb")) / f"{number:b"} / bin(number) to convert from int to binary, use int(binary,2) to convert string to int 

```pyhon
class Solution:
    def grayCode(self, n: int) -> list[int]:
        if n == 1: 
            return [0,1]
        else: 
            prev_binary_solution = [format(num, f"0{n-1}b") for num in self.grayCode(n-1)]

            new_binary_solution = ["0" + bin_sol for bin_sol in prev_binary_solution] + ["1" + bin_sol for bin_sol in reversed(prev_binary_solution)]
            return [int(bin_sol,2) for bin_sol in new_binary_solution]

```

Slightly optimized solution - same logic, except save binary conversion. Time Complexity: O(2**n)
```python
class Solution:
    def grayCode(self, n: int) -> list[int]:
        if n == 1: 
            return [0,1]
        else: 
            prev_sol = self.grayCode(n-1)
            return prev_sol + [(2**(n-1) + x) for x in reversed(prev_sol)]
```
