# LeetCode: https://leetcode.com/problems/nth-highest-salary/

# Own Solution
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE N_1 INT;
    SET N_1 = N-1;
  RETURN (
      # Write your MySQL query statement below.
      
      SELECT base.salary
      FROM Employee base
      LEFT JOIN (
        SELECT DISTINCT emp.salary
          FROM Employee emp
          ORDER BY salary desc
          LIMIT N_1
      ) filter
      ON base.salary = filter.salary
      WHERE filter.salary IS NULL
      ORDER BY base.salary desc
      LIMIT 1


  );
END


# DenseRank Solution by sjmishra 
# https://leetcode.com/problems/nth-highest-salary/discuss/1536321/MySQL-or-Simple-solution-using-DENSE_RANK()-or-Faster-than-96.41-cases
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select 
      CASE WHEN count(distinct rnk)<N  THEN NULL ELSE min(salary) END 
	  FROM (SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) as rnk
      FROM Employee) a where rnk<=N
  );
END

# Key Takeaway: 
# Use dense_rank to provide ranking 
