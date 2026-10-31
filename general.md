# Summary for k-sum 
- sort first, then try first number, search the rest use (k-1) sum
- time complexity
  - 2-sum: $O(n log(n)) + O(n)$
  - 3-sum: $O(n log(n)) + O(n^2)$
  - k-sum: $O(n log(n)) + O(n^{k-1})$
