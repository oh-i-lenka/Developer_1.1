CREATE TEMPORARY TABLE IF NOT EXISTS min_sums
SELECT proj_company AS comp, MIN(costs) AS sums
FROM projects GROUP BY proj_company, proj_customers;

SELECT companies.company, min_sums.sums, customers.customer FROM projects 
INNER JOIN min_sums ON min_sums.comp = projects.proj_company AND min_sums.sums = projects.Costs  
LEFT JOIN companies ON min_sums.comp = companies.id 
LEFT JOIN customers ON customers.ID = projects.proj_customers;