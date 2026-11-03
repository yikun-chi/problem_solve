Implement pow(x, n), which calculates x raised to the power n (i.e., xn).
At https://leetcode.com/problems/powx-n/description/


This is super interesting. Here is the brainless approach 
```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        if n == 0: 
            return 1
        elif n > 0 :
            return x * self.myPow(x, n-1)
        else: 
            return 1 / self.myPow(x, abs(n))
```
However, we see that it breaks time limit when n is super super big. We are calling the function n times. 

Here is then a different breakdown 
```Python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        if n == 0: 
            return 1
        elif n > 0 :
            half_pwer = self.myPow(x, n//2)
            if n%2 == 0: 
                return half_pwer * half_pwer
            else: 
                return half_pwer * half_pwer * x
        else: 
            return 1 / self.myPow(x, abs(n))
```
But for some reason, below one scores higher rating in run time. 

```Pytho
class Solution:
    def myPow(self, x: float, n: int) -> float:
        if n == 0: 
            return 1
        elif n > 0 :
            if n % 2 == 0: 
                return self.myPow(x*x, n/2)
            else: 
                return self.myPow(x*x, n//2)  * x
        else: 
            return 1 / self.myPow(x, abs(n))

```
