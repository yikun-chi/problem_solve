# Write your MySQL query statement below
# https://leetcode.com/problems/combine-two-tables/
SELECT 
    FirstName
    , LastName
    , a.City
    , a.State
FROM Person p
LEFT JOIN Address a
    on p.PersonID = a.PersonID
