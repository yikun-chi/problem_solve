Description: Given a string s, find the length of the longest substring without duplicate characters.
Link: https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

```python
## greedy solution
### Just scan all possible substring and compare length vs. set length
### added some shortcut logic to increase performance. Strictly speaking still O(n^2) 
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        max_track = 0 
        for i in range(len(s)):
            for sub_str_len in range(1, len(s)-i+1): 
                if sub_str_len < max_track:
                    continue
                cur_sub_str = s[i:(i+sub_str_len)]
                if len(set(cur_sub_str)) == (sub_str_len): # no duplicate characters
                    max_track = max(max_track,len(set(cur_sub_str)))
                else: # we can shorcircut here, no need to check the rest of the longer substring 
                    break  
        return max_track

        
```

Some other cool solutions (really gotta think more on the two-pointer general approach lol 
```python
# from https://leetcode.com/problems/longest-substring-without-repeating-characters/solutions/3649636/3-methods-c-java-python-beginner-friendl-ck47/
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        n = len(s)
        maxLength = 0
        charMap = {}
        left = 0
        
        for right in range(n):
            if s[right] not in charMap or charMap[s[right]] < left:
                charMap[s[right]] = right
                maxLength = max(maxLength, right - left + 1)
            else:
                left = charMap[s[right]] + 1
                charMap[s[right]] = right
        
        return maxLength

```

This solution is interesting. So at the core we have a sliding window, expanding to the right while keep track of "what if the next letter is x, then where would the new left start be" 
``` Python
from collections import Counter

class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        n = len(s)
        ans = 0
        # charToNextIndex stores the index after current character
        charToNextIndex = {}

        i = 0
        # try to extend the range [i, j]
        for j in range(n):
            if s[j] in charToNextIndex:
                i = max(charToNextIndex[s[j]], i)

            ans = max(ans, j - i + 1)
            charToNextIndex[s[j]] = j + 1

        return ans
```
