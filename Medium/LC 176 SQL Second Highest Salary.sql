# Write your MySQL query statement below
# https://leetcode.com/problems/second-highest-salary/

SELECT *
FROM (
    # First half of union - obtaining Second Highest Salary
    SELECT *
    FROM (
        SELECT base.Salary AS SecondHighestSalary
        FROM Employee base 

        # Left Join top salary to exclude 
        LEFT JOIN (
            # Obtaining TOP Salary
            SELECT Salary
            FROM Employee 
            ORDER BY Salary DESC
            LIMIT 1) top_salary
        ON base.Salary = top_salary.Salary
        WHERE top_salary.Salary IS NULL

        # Order and limit to find second highest 
        ORDER BY base.Salary desc
        LIMIT 1
    ) SecondHigh

    UNION 
    
    # Second half of union - add NUll row
    SELECT NULL AS SecondHighestSalary FROM Employee

) with_null 
# DESC will put row to the bottom 
ORDER BY SecondHighestSalary desc
LIMIT 1

# More Elegant Solution FROM algoshark ON leetcode
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee)