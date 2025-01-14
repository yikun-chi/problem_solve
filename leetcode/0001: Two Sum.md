Problem: 

Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to the target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.

Self solution: O(n)

```python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        # thoughts: going through the list, and keep track of the number needed 
        diff_number_dict = {}
        for idx, num in enumerate(nums): 
            if num in diff_number_dict: 
                # found solution 
                return [idx, diff_number_dict[num]]
            else:
                # add the candidate number that would needed for the current number to dict 
                diff_number_dict[target - num] = idx
```
