You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

[Problem Link](https://leetcode.com/problems/add-two-numbers/description/)


Solution 1: Basic solution, processing each number separately, then calculate the sum and construct the answer. 
```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:

        l1_val = 0
        l1_dig = 0
        while l1 is not None:
            l1_val += l1.val * (10 ** l1_dig)
            print(l1_val)
            l1_dig += 1
            l1 = l1.next
        print(l1_val)

        l2_val = 0
        l2_dig = 0
        while l2 is not None:
            l2_val += l2.val * (10 ** l2_dig)
            l2_dig += 1
            l2 = l2.next        
        print(l2_val)
        total = l1_val + l2_val
        
        # construct result 
        res_str = str(total)

        current_next_node = ListNode()
        res = ListNode(val = int(res_str[-1]), next = current_next_node)

        if len(res_str) == 1:
            res.next = None
            return res
         
        for i in range(-2, 0 - len(res_str) - 1, -1):
            current_next_node.val = int(res_str[i])

            if i == 0 - len(res_str):
                next_next_node = None 
            else: 
                next_next_node = ListNode()
            current_next_node.next = next_next_node
            current_next_node = next_next_node

        res     
        return res
```

Solution 2: One pass solution 
```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

# Basic idea: one-pass solution, can optimize 
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        
        l1_cur_val = l1.val 
        l2_cur_val = l2.val
        sum_to_next_digit = (l1_cur_val + l2_cur_val) // 10 

        res = ListNode((l1_cur_val + l2_cur_val) % 10, None)
        current_node = res

        l1 = l1.next
        l2 = l2.next
         
        while (l1 is not None) or (l2 is not None): 
    
            # calcualte the current number 
            l1_cur_val = l1.val if l1 is not None else 0
            l2_cur_val = l2.val if l2 is not None else 0

            next_node = ListNode((l1_cur_val + l2_cur_val + sum_to_next_digit) % 10, None)
            sum_to_next_digit = (l1_cur_val + l2_cur_val + sum_to_next_digit) // 10 

            # still at least 1 more digit to process
            current_node.next = next_node 
            current_node = next_node 

            # still digit 
            l1 = l1.next if l1 is not None else None 
            l2 = l2.next if l2 is not None else None 
            
        # read the current number 
        if sum_to_next_digit == 0: return res
        else: 
            current_node.next = ListNode(1, None)
            return res

```
