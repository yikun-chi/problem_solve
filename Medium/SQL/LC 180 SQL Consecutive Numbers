# Write your MySQL query statement below


SELECT DISTINCT base.num AS ConsecutiveNums 
FROM Logs base 

LEFT JOIN Logs lag_1 
ON base.id = lag_1.id -1 

LEFT JOIN Logs lag_2
ON base.id = lag_2.id - 2

WHERE base.num = lag_1.num 
AND base.num = lag_2.num



# Clever more efficient self join
# bpgong
# https://leetcode.com/problems/consecutive-numbers/discuss/1544565/Self-join-faster-than-96.22-submissions
select distinct l1.num as ConsecutiveNums
from Logs l1 join Logs l2 join Logs l3
on l1.id + 1 = l2.id 
    and l2.id + 1 = l3.id
    and l1.num = l2.num
    and l2.num = l3.num
;


# Usage of LEAD and LAG, no dependency on id 
# hatidzhe
# https://leetcode.com/problems/consecutive-numbers/discuss/1551781/Solution-with-both-LEAD()-and-LAG()-functions

SELECT DISTINCT num AS ConsecutiveNums
FROM( 
    SELECT num,
           LAG(num) OVER () AS prev_num,
           LEAD(num) OVER () AS next_num
    FROM Logs
    ) t
WHERE num = prev_num AND num = next_num
OR second way:

SELECT DISTINCT num AS ConsecutiveNums
FROM( 
    SELECT num,
           LEAD(num) OVER (ORDER BY id) AS next_num,
           LEAD(num,2) OVER (ORDER BY id) AS next_2_num
    FROM Logs
    ) t
WHERE num = next_num AND next_num = next_2_num
