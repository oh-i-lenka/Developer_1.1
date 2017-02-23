select * from projects where ID in
(select PROJECT_ID from dev_project where DEVELOPER_ID =
(select id from developers where salary = (select max(salary) from developers)))
