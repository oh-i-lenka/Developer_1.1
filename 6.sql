select avg(salary) from developers where id in (select DEVELOPER_ID from dev_project where PROJECT_ID in (select id from projects where costs = (select min(Costs) from projects)))
