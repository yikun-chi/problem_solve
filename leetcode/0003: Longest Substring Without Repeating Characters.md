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

Some other cool solutions
```python
# from https://leetcode.com/problems/longest-substring-without-repeating-characters/solutions/3649636/3-methods-c-java-python-beginner-friendl-ck47/
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        n = len(s)
        maxLength = 0
        charIndex = [-1] * 128
        left = 0
        
        for right in range(n):
            if charIndex[ord(s[right])] >= left:
                left = charIndex[ord(s[right])] + 1
            charIndex[ord(s[right])] = right
            maxLength = max(maxLength, right - left + 1)
        
        return maxLength

```
